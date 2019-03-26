/**
 * FileName: WechatAppControl
 * author:   Melone
 * Date:     2019/3/15 13:58
 * History:
 * <author>    <time>     <version>   <desc>
 * 作者姓名     修改时间    版本号        描述
 **/
package com.jiaoke.wechatapp;


import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.jiaoke.http.HttpClientUtil;
import com.jiaoke.serviceInf.AppServiceInf;
import com.jiaoke.serviceInf.ConeBucketManagerServiceInf;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 *  <一句话功能描述>
 *
 * @author: Melone
 * @create: 2019/3/15 13:58
 * @Description:
 */
@Controller
public class WechatAppControl {


    @Autowired
    private AppServiceInf appServiceInf;
    @Autowired
    private ConeBucketManagerServiceInf coneBucketManagerServiceInf;
    /**
     * 中维URL
     */
    @Value("${zonwi}")
    private String zonwiURI;


    @Value("${googleEvent}")
    private String googleEvent;

    @Value("${googleMeesage}")
    private String googleMeesage;


    /**
     *
     * 功能描述: <br>
     *  <返回中维锥桶位置点方法>
     * @param
     * @return
     * @auther Melone
     * @date 2019/3/15 15:19
     */
    @ResponseBody
    @RequestMapping(value = {"/getZonwiConeBucket.do"},method = RequestMethod.POST)
    public String getZonwiConeBucket(@RequestParam("progress") String progress,@RequestParam("proStatus") String proStatus,@RequestParam("coneBucket_type") String coneBucketType){

        String res = HttpClientUtil.doGet(zonwiURI);

        //开启多线程处理添加锥桶
        Runnable myRunnable = () -> addConeBucketByControlData(res,"zonwi","online");
        myRunnable.run();

        return HttpClientUtil.resJsonToString(res,"online");
    }

    /**
     *
     * 功能描述: <br>
     *  <返回谷歌锥桶位置点方法>
     * @param
     * @return
     * @auther Melone
     * @date 2019/3/15 15:19
     */
    @ResponseBody
    @RequestMapping(value = {"/getGoogleConeBucket.do"},method = RequestMethod.POST)
    public String getGoogleConeBucket(@RequestParam("progress") String progress,@RequestParam("proStatus") String proStatus,@RequestParam("coneBucket_type") String coneBucketType){

        //url参数map
        Map<String,String> urlParamMap = new HashMap<>();

        //添加参数
        urlParamMap.put("page","1");
        urlParamMap.put("size","2");
        urlParamMap.put("stateFlags[]","0");
        urlParamMap.put("isHardWare","true");
        urlParamMap.put("userKey","0635fe71-699a-4feb-8894-de0dc7f632ac");



        String res = HttpClientUtil.doGet(googleEvent,urlParamMap);

        //开启多线程处理添加锥桶
        Runnable myRunnable = () -> {
            //url参数map
            Map<String,String> googleMeesageParamMap = new HashMap<>();
            googleMeesageParamMap.put("isOnline","true");
            googleMeesageParamMap.put("userKey","0635fe71-699a-4feb-8894-de0dc7f632ac");

            String deviceRes = HttpClientUtil.doGet(googleMeesage,googleMeesageParamMap);
            addConeBucketByControlData(deviceRes,"google","data");
        };
        myRunnable.run();

        return HttpClientUtil.resJsonToString(res,"data");


    }


    @ResponseBody
    @RequestMapping(value = {"/getProgectByProgres.do"},method = RequestMethod.POST)
    public String getProgectByProgres(@RequestParam("progress" ) String progress,@RequestParam("proStatus") String proStatus){

        if (progress.isEmpty() || proStatus.isEmpty()){
            return "";
        }

        //查询所有符合条件的工程
       List<Map<String,Object>> proList =  appServiceInf.getProgectByProgresAndproStatus(progress,proStatus);

        if (proList.size() != 0){

            //创建工程id结果集合，查询经纬度使用
            List<String> idList = new ArrayList<>();
            for (int i = 0; i < proList.size();i++){
                String id = proList.get(i).get("id").toString();
                idList.add(id);
            }
            List<Map<String,Object>> locationList =  appServiceInf.getProLocationsByIdList(idList);


            for (int i = 0; i < proList.size();i++) {

                String id = proList.get(i).get("id").toString();
                //每个工程下经纬度结果集
                List<Map<String,String>> temList = new ArrayList<>();

                //循环查找工程下的所有经纬度
                for (int j = 0; j < locationList.size();j++){

                    String proId = locationList.get(j).get("proId").toString();

                    if (!id.equals(proId)){
                        continue;
                    }else {
                        String longitude = locationList.get(j).get("longitude").toString();
                        String latitude = locationList.get(j).get("latitude").toString();
                        Map<String,String> map = new HashMap<>();
                        map.put("longitude",longitude);
                        map.put("latitude",latitude);

                        //放入经纬度结果集
                        temList.add(map);
                    }
                }
                //将遍历好的结果集放入工程下
                proList.get(i).put("locations",temList);
            }
        }


        String res = JSON.toJSONString(proList);

        return res;

    }

    /**
     *
     * 功能描述: <br>
     *  <根据接口数据添加锥桶>
     * @param
     * @return
     * @auther Melone
     * @date 2019/3/25 10:19
     */
    public void addConeBucketByControlData(String resData,String condition,String arrayName){

        JSONObject jsonObject = JSONObject.parseObject(resData);

        JSONArray online = JSONArray.parseArray(jsonObject.get(arrayName).toString());

        if (online.size() == 0) return;

        List<Map<String, Object>> allConeBucket = coneBucketManagerServiceInf.getAllConeBucket();

        if (allConeBucket.size() != 0){

            for (int i = 0;i < allConeBucket.size();i++ ){

                String coneBucketNum = allConeBucket.get(i).get("cone_bucket_num").toString();

                if ("zonwi".equals(condition)){

                    for (int j = 0; j < online.size();j++){
                        String id = online.getJSONObject(j).getString("id");
                        if (coneBucketNum.equals(id)){
                            continue;
                        }else {
                            coneBucketManagerServiceInf.addConeBucket(coneBucketNum,"1");
                        }
                    }

                }else if ("google".equals(condition)){

                    for (int j = 0; j < online.size();j++){
                        String id = online.getJSONObject(j).getString("deviceId");
                        if (coneBucketNum.equals(id)){
                            continue;
                        }else {
                            coneBucketManagerServiceInf.addConeBucket(coneBucketNum,"0");
                        }
                    }

                }

            }
        }else {
            if ("zonwi".equals(condition)){
                for (int j = 0; j < online.size();j++){
                    String id = online.getJSONObject(j).getString("id");
                    coneBucketManagerServiceInf.addConeBucket(id,"1");
                }
            }else if ("google".equals(condition)){
                for (int j = 0; j < online.size();j++){
                    String id = online.getJSONObject(j).getString("deviceId");
                    coneBucketManagerServiceInf.addConeBucket(id,"0");
                }
            }
        }


    }

}
