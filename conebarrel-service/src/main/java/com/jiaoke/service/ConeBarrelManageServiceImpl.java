package com.jiaoke.service;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.jiaoke.bean.ConeBarrelManage;
import com.jiaoke.util.DateUtil;
import com.jiaoke.web.dao.ConeBarrelManageMapper;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.URL;
import java.net.URLConnection;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 锥桶管理
 *
 * @author lihui
 * @version 1.0
 * @date 2020-5-7 15:40
 */
@Service
public class ConeBarrelManageServiceImpl implements ConeBarrelManageService {

    @Resource
    private ConeBarrelManageMapper coneBarrelManageMapper;

    @Override
    public Map<String, Object> addConeBarrel(String keyWd,String platform) {

        //字母和数字组成的字符串
        String checkKey = "[A-Za-z0-9]+";
        //总数
        String total = "total";
        String zero = "0";

        Map<String, Object> codeMap = new HashMap<>(16);
        ConeBarrelManage coneBarrelManage = new ConeBarrelManage();

        //校验键入的锥桶编号格式
        if (keyWd != null && keyWd.matches(checkKey)) {
            String resultData = sendGet("userKey=0cc8ebe2a2b54d73ab3e60ff9099c47a&keyWd=" + keyWd);
            JSONObject parseObject = JSONObject.parseObject(resultData);
            //返回条数
            if (!zero.equals(parseObject.getString(total))) {
                coneBarrelManage.setDeviceId(keyWd);
                //查询是否已经存在
                if (coneBarrelManageMapper.selectCount(coneBarrelManage) == 0) {
                    //添加
                    ConeBarrelManage barrelManage = JSONArray.parseArray(parseObject.getString("data"), ConeBarrelManage.class).get(0);
                    barrelManage.setServicePlatform(platform);
                    if (coneBarrelManageMapper.insertSelective(barrelManage) < 0) {
                        codeMap.put("msg", "添加过程中出现错误！");
                        return codeMap;
                    } else {
                        codeMap.put("code", "200");
                        codeMap.put("msg", "添加成功！");
                        return codeMap;
                    }
                } else {
                    codeMap.put("msg", "此锥桶已存在，无需重复添加！");
                    return codeMap;
                }
            } else {
                codeMap.put("msg", "查询无此锥桶！");
                return codeMap;
            }
        } else {
            codeMap.put("msg", "输入的设备编号格式错误");
            return codeMap;
        }
    }

    @Override
    public List<ConeBarrelManage> getAll() {
        List<ConeBarrelManage> coneBarrelManageList = coneBarrelManageMapper.selectAll();
        for (ConeBarrelManage coneBarrelManage : coneBarrelManageList) {
            coneBarrelManage.setLastReportTime(DateUtil.getDateToString(Long.valueOf(coneBarrelManage.getLastReportTime())));
            coneBarrelManage.setOpenTime(String.valueOf(Long.parseLong(coneBarrelManage.getOpenTime()) / 60));
        }
        return coneBarrelManageList;
    }

    @Override
    public List<ConeBarrelManage> selectAllDeviceId() {
        return coneBarrelManageMapper.selectAllDeviceId();
    }

    @Override
    public List<ConeBarrelManage> updateConeBarrelState() {
        String resultData = sendGet("userKey=0cc8ebe2a2b54d73ab3e60ff9099c47a&page=1&size=100");
        JSONObject parseObject = JSONObject.parseObject(resultData);
        List<ConeBarrelManage> coneBarrelManageList = JSONArray.parseArray(parseObject.getString("data"), ConeBarrelManage.class);
        for (ConeBarrelManage coneBarrelManage : coneBarrelManageList) {
            System.out.println("设备ID=======" + coneBarrelManage.getDeviceId());
            int i = coneBarrelManageMapper.updateByPrimaryKeySelective(coneBarrelManage);
            System.out.println(i);
        }
        return coneBarrelManageList;
    }

    /**
     * 发送get请求
     *
     * @param param 参数
     * @return result
     */
    private static String sendGet(String param) {
        String result = "";
        BufferedReader in = null;
        try {
            String urlNameString = "https://ih.amap.com/trafficdata/hardware/report.do?" + param;
            URL realUrl = new URL(urlNameString);
            // 打开和URL之间的连接
            URLConnection connection = realUrl.openConnection();
            // 设置通用的请求属性
            connection.setRequestProperty("accept", "*/*");
            connection.setRequestProperty("connection", "Keep-Alive");
            connection.setRequestProperty("user-agent", "Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1;SV1)");
            // 建立实际的连接
            connection.connect();
            // 定义 BufferedReader输入流来读取URL的响应
            in = new BufferedReader(new InputStreamReader(connection.getInputStream()));
            String line;
            while ((line = in.readLine()) != null) {
                result += line;
            }
        } catch (Exception e) {
            System.out.println("发送GET请求出现异常！" + e);
            e.printStackTrace();
        }
        // 使用finally块来关闭输入流
        finally {
            try {
                if (in != null) {
                    in.close();
                }
            } catch (Exception e2) {
                e2.printStackTrace();
            }
        }
        return result;
    }
}
