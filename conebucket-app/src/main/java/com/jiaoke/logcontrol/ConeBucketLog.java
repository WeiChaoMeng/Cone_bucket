/**
 * FileName: ConeBucketLog
 * author:   Melone
 * Date:     2019/3/25 12:27
 * History:
 * <author>    <time>     <version>   <desc>
 * 作者姓名     修改时间    版本号        描述
 **/
package com.jiaoke.logcontrol;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.jiaoke.http.HttpClientUtil;
import com.jiaoke.serviceInf.ConeBucketManagerServiceInf;
import com.jiaoke.serviceInf.SyetemLogInf;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Lazy;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;

import javax.annotation.Resource;
import java.text.Format;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import static com.jiaoke.http.HttpClientUtil.timeStamp2Date;

/**
 *  <一句话功能描述>
 *
 * @author: Melone
 * @create: 2019/3/25 12:27
 * @Description:
 */
@Component
public class ConeBucketLog {

    @Resource
    private SyetemLogInf syetemLogInf;
    @Resource
    private ConeBucketManagerServiceInf coneBucketManagerServiceInf;


    @Value("${zonwi}")
    private String zonwiURI;


    @Value("${googleEvent}")
    private String googleEvent;

    @Value("${googleMeesage}")
    private String googleMeesage;

    /**
     *
     * 功能描述: <br>
     *  <处理google信息>
     * @param
     * @return
     * @auther Melone
     * @date 2019/3/27 16:15
     */
    @Scheduled(cron = "5 * *  * * ? ")
    public void addGoogleConeBucketLog(){

        //调用接口获取参数
        //url参数map
        Map<String,String> urlParamMap = new HashMap<>();
        //添加参数
        urlParamMap.put("page","1");
        urlParamMap.put("size","20");
        urlParamMap.put("stateFlags[]","0");
        urlParamMap.put("isHardWare","true");
        urlParamMap.put("userKey","0635fe71-699a-4feb-8894-de0dc7f632ac");

        String googleData = HttpClientUtil.doGet(googleEvent, urlParamMap);

        JSONObject jsonObject = JSONObject.parseObject(googleData);

        JSONArray dataArray = JSONArray.parseArray(jsonObject.get("data").toString());


//        if (dataArray.size() != 0){
//            for (int i =0;i < dataArray.size();i++){
//
//                String startDate = dataArray.getJSONObject(i).getString("startDate");
//                String startTime = dataArray.getJSONObject(i).getString("startTime");
//                String endDate = dataArray.getJSONObject(i).getString("endDate");
//                String endTime = dataArray.getJSONObject(i).getString("endTime");
//                String eventDesc = dataArray.getJSONObject(i).getString("eventDesc");
//                String locRoadName = dataArray.getJSONObject(i).getString("locRoadName");
//                String sEventId = dataArray.getJSONObject(i).getString("sEventId");
//                String deviceId = sEventId.substring(0,10);
//
//               long startDataTimeTem =  Long.parseLong(startDate) + Long.parseLong(startTime);
//               String startDataTime = String.valueOf(startDataTimeTem) + "000";
//
//                long endDataTimeTem =  Long.parseLong(endDate) + Long.parseLong(endTime);
//                String endDataTime = String.valueOf(endDataTimeTem) + "000";
//
//                Map<String,String> res = syetemLogInf.getConeBucketLastTimeBydeviceId(deviceId);
//
//                Format format = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
//
//                if (res != null){
//                    if (HttpClientUtil.timeStamp2Date(startDataTime).equals(format.format(res.get("start_time"))) &&
//                            HttpClientUtil.timeStamp2Date(endDataTime).equals(format.format(res.get("end_time")))){
//                        continue;
//                    }else {
//                        //添加锥桶信息
//                        Map<String,String> googleConeBucket = coneBucketManagerServiceInf.getGoogleConeBucketById(deviceId);
//                        if (googleConeBucket == null){
//                            coneBucketManagerServiceInf.addConeBucket(deviceId,"0");
//                        }
//                        int tem = syetemLogInf.addConeBucketTime(deviceId,"0",eventDesc,locRoadName,HttpClientUtil.timeStamp2Date(startDataTime),HttpClientUtil.timeStamp2Date(endDataTime));
//                    }
//
//                }else {
//                   syetemLogInf.addConeBucketTime(deviceId,"0",eventDesc,locRoadName,timeStamp2Date(startDataTime),timeStamp2Date(endDataTime));
//                }
//
//            }
//        }

        //zonwi日志逻辑

        String zonwiData = HttpClientUtil.doGet(zonwiURI);

        JSONObject jsonObj = JSONObject.parseObject(zonwiData);

        JSONArray online = JSONArray.parseArray(jsonObj.get("online").toString());
        JSONArray offOnline = JSONArray.parseArray(jsonObj.get("offline").toString());

        for (int i = 0; i < online.size();i++){

            String id = online.getJSONObject(i).getString("id");
            String lasttime = online.getJSONObject(i).getString("lasttime");
            String roadInfo = online.getJSONObject(i).getString("RoadInfo");
            String roadName = "未获取道路信息";

            if (roadInfo != null){
                    JSONObject roadJson = JSONObject.parseObject(roadInfo);
                    Object temObj = roadJson.get("RoadName");
                    if (temObj !=  null){
                        roadName = temObj.toString();
                    }
            }

            Map<String, String> coneBucket = syetemLogInf.getConeBucketLastTimeBydeviceId(id);

            if (coneBucket == null){

                syetemLogInf.addConeBucketTime(id,"1","道路维护",roadName,lasttime,lasttime);

            }else {
                String start_time = coneBucket.get("start_time");
                String dbSubStartTime = start_time.substring(0,9);
                String portSubStartTime = lasttime.substring(0,9);
                if (!dbSubStartTime.equals(portSubStartTime)){
                    syetemLogInf.addConeBucketTime(id,"1","道路维护",roadName,lasttime,lasttime);
                }
            }

        }

        for (int i =0;i < offOnline.size();i++){
            String id = offOnline.getJSONObject(i).getString("id");
            String lasttime = offOnline.getJSONObject(i).getString("lasttime");

            Map<String, String> dbLogData = syetemLogInf.getConeBucketLastTimeBydeviceId(id);

            if (dbLogData == null){
                break;
            }else {
                String dbId = dbLogData.get("id");
                String endTime = dbLogData.get("end_time");
                if (endTime.isEmpty()){
                    syetemLogInf.editConeBucketBydeviceId(dbId,lasttime);
                }
            }


        }


    }


}
