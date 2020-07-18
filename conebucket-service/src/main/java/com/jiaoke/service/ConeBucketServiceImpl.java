package com.jiaoke.service;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.jiaoke.bean.ConeBucket;
import com.jiaoke.bean.ConeBucketType;
import com.jiaoke.bean.RoadInfo;
import com.jiaoke.web.dao.ConeBucketMapper;
import com.jiaoke.web.dao.ConeBucketTypeMapper;
import com.jiaoke.web.dao.RoadInfoMapper;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.ArrayList;
import java.util.List;

/**
 * 锥桶管理
 *
 * @author lihui
 * @version 1.0
 * @date 2020-7-10 11:28
 */
@Service
public class ConeBucketServiceImpl implements ConeBucketService {

    @Resource
    private ConeBucketMapper coneBucketMapper;

    @Resource
    private RoadInfoMapper roadInfoMapper;

    @Resource
    private ConeBucketTypeMapper coneBucketTypeMapper;

    @Override
    public List<ConeBucket> selectAll() {
        List<ConeBucket> coneBucketList = coneBucketMapper.selectAll();
        for (ConeBucket coneBucket : coneBucketList) {
            RoadInfo roadInfo = roadInfoMapper.selectByPrimaryKey(coneBucket.getId());
            ConeBucketType coneBucketType = coneBucketTypeMapper.selectByPrimaryKey(Integer.parseInt(coneBucket.getConeBucketTypeId()));
            coneBucket.setConeBucketTypeId(coneBucketType.getTypeName());
            coneBucket.setRoadInfo(roadInfo);
        }
        return coneBucketList;
    }

    @Override
    public int delete(String deviceId) {
        if (coneBucketMapper.deleteByPrimaryKey(deviceId) < 0) {
            return 0;
        } else {
            if (roadInfoMapper.deleteByPrimaryKey(deviceId) < 0) {
                return 0;
            } else {
                return 1;
            }
        }
    }

    /**
     * 根据工程id查询锥桶信息
     *
     * @param proId 工程id
     * @return list
     */
    @Override
    public List<ConeBucket> selectByProId(Integer proId) {
        return coneBucketMapper.selectByProId(proId);
    }

    @Override
    public List<ConeBucket> locationById(String[] ids) {
        List<ConeBucket> coneBucketList = new ArrayList<>();
        for (String id : ids) {
            coneBucketList.add(coneBucketMapper.locationById(id));
        }
        return coneBucketList;
    }

    @Override
    public List<ConeBucket> allConeBucketPosition() {
        return coneBucketMapper.allConeBucketPosition();
    }

    @Override
    public int updateConeBucketInfo() {
        String coneBucketList = sendPost();
        JSONObject jsonObject = JSONObject.parseObject(coneBucketList);
        //离线设备
        JSONArray offlineArray = JSONObject.parseArray(jsonObject.getString("offline"));
        if (offlineArray.size() > 0) {
            for (Object offlineObj : offlineArray) {
                //json转对象
                ConeBucket coneBucket = JSONObject.parseObject(offlineObj.toString(), ConeBucket.class);

                //处理锥桶位置信息数据
                String lastLocation = coneBucket.getLastLocation();
                String substring = lastLocation.substring(1, lastLocation.length() - 1);
                coneBucket.setLastLocation(substring);

                //更新锥桶信息
                coneBucket.setConeBucketTypeId("0");
                coneBucketMapper.updateByPrimaryKey(coneBucket);

                //更新锥桶路线信息(离线锥桶无线路信息)
                RoadInfo roadInfo = new RoadInfo();
                roadInfo.setConeBucketId(coneBucket.getId());
                roadInfoMapper.updateByPrimaryKey(roadInfo);
            }
        }

        //在线设备
        JSONArray onlineArray = JSONObject.parseArray(jsonObject.getString("online"));
        if (onlineArray.size() > 0) {
            for (Object onlineObj : onlineArray) {

                ConeBucket coneBucket = JSONObject.parseObject(onlineObj.toString(), ConeBucket.class);

                //处理锥桶位置信息数据
                String lastLocation = coneBucket.getLastLocation();
                String substring = lastLocation.substring(1, lastLocation.length() - 1);
                coneBucket.setLastLocation(substring);

                //更新锥桶信息
                coneBucket.setConeBucketTypeId("0");
                coneBucketMapper.updateByPrimaryKey(coneBucket);

                //更新锥桶路线信息
                RoadInfo roadInfo = coneBucket.getRoadInfo();
                roadInfo.setConeBucketId(coneBucket.getId());
                roadInfoMapper.updateByPrimaryKey(roadInfo);
            }
        }
        return 0;
    }

    @Override
    public String add(String deviceId, String coneBucketType) {

        String msg;
        int flag = 0;

        //1.查询数据库是否已经添加。
        ConeBucket coneBucketInfo = coneBucketMapper.selectByPrimaryKey(deviceId);
        if (coneBucketInfo == null) {
            msg = "不存在，可以添加！";
            //2.未添加，调用接口查询是否存在。
            String coneBucketList = sendPost();
            //转json
            JSONObject jsonObject = JSONObject.parseObject(coneBucketList);

            //离线设备
            JSONArray offlineArray = JSONObject.parseArray(jsonObject.getString("offline"));
            if (offlineArray.size() > 0) {
                for (Object offlineObj : offlineArray) {
                    //调用第三方接口查询该锥桶是否存在。
                    String id = JSONObject.parseObject(offlineObj.toString()).getString("id");
                    //存在
                    if (deviceId.equals(id)) {
                        ConeBucket coneBucket = JSONObject.parseObject(offlineObj.toString(), ConeBucket.class);
                        //处理锥桶位置信息数据
                        String lastLocation = coneBucket.getLastLocation();
                        String substring = lastLocation.substring(1, lastLocation.length() - 1);
                        coneBucket.setLastLocation(substring);

                        //添加锥桶类型
                        coneBucket.setConeBucketTypeId(coneBucketType);

                        //锥桶数据插入数据库
                        if (coneBucketMapper.insertSelective(coneBucket) < 0) {
                            msg = "添加失败！";
                        } else {
                            //离线锥桶无路线信息
                            RoadInfo roadInfo = new RoadInfo();
                            roadInfo.setConeBucketId(coneBucket.getId());
                            roadInfoMapper.insertSelective(roadInfo);
                            msg = "添加成功！";
                        }
                        flag = 1;
                        break;
                    } else {
                        msg = "未查询到该锥桶信息！";
                    }
                }
            }

            if (flag == 0) {
                //在线设备
                JSONArray onlineArray = JSONObject.parseArray(jsonObject.getString("online"));
                if (onlineArray.size() > 0) {
                    for (Object onlineObj : onlineArray) {
                        String id = JSONObject.parseObject(onlineObj.toString()).getString("id");
                        if (deviceId.equals(id)) {
                            ConeBucket coneBucket = JSONObject.parseObject(onlineObj.toString(), ConeBucket.class);

                            String lastLocation = coneBucket.getLastLocation();
                            String substring = lastLocation.substring(1, lastLocation.length() - 1);
                            coneBucket.setLastLocation(substring);

                            coneBucket.setConeBucketTypeId(coneBucketType);

                            if (coneBucketMapper.insertSelective(coneBucket) < 0) {
                                msg = "添加失败！";
                            } else {
                                RoadInfo roadInfo = coneBucket.getRoadInfo();
                                roadInfo.setConeBucketId(coneBucket.getId());
                                roadInfoMapper.insertSelective(roadInfo);
                                msg = "添加成功！";
                            }
                            break;
                        } else {
                            msg = "未查询到该锥桶信息！";
                        }
                    }
                }
            }

            return msg;
        } else {
            msg = "锥桶已经存在,请勿重复添加!";
            return msg;
        }
    }

    private static String sendPost() {
        BufferedReader in = null;
        StringBuilder result = new StringBuilder();
        HttpURLConnection connection = null;
        try {
            URL url = new URL("http://182.150.21.208:8009/getdevice");
            connection = (HttpURLConnection) url.openConnection();
            //设置请求方法
            connection.setRequestMethod("POST");
            //发送POST请求必须设置为true
            connection.setDoOutput(true);
            connection.setDoInput(true);
            //Post 请求不能使用缓存
            connection.setUseCaches(false);
            //设置连接超时时间和读取超时时间
            connection.setConnectTimeout(30000);
            connection.setReadTimeout(10000);
            connection.setRequestProperty("Content-Type", "application/json");
            connection.setRequestProperty("Accept", "application/json");
            //取得输入流，并使用Reader读取
            if (200 == connection.getResponseCode()) {
                in = new BufferedReader(new InputStreamReader(connection.getInputStream(), "UTF-8"));
                String line;
                while ((line = in.readLine()) != null) {
                    result.append(line);
                }
            } else {
                System.out.println("ResponseCode is an error code:" + connection.getResponseCode());
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (in != null) {
                    in.close();
                }
            } catch (IOException ioe) {

                ioe.printStackTrace();
            }
        }
        return result.toString();
    }
}
