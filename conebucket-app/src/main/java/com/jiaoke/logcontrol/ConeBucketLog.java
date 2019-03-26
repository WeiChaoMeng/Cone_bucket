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

import java.util.HashMap;
import java.util.Map;

/**
 *  <一句话功能描述>
 *
 * @author: Melone
 * @create: 2019/3/25 12:27
 * @Description:
 */
@Component
public class ConeBucketLog {

    @Autowired
    private SyetemLogInf syetemLogInf;


    @Value("${zonwi}")
    private String zonwiURI;


    @Value("${googleEvent}")
    private String googleEvent;

    @Value("${googleMeesage}")
    private String googleMeesage;


    @Scheduled(cron = "5 * *  * * ? ")
    public void addConeBucketLog(){

        //调用接口获取参数
        //url参数map
        Map<String,String> urlParamMap = new HashMap<>();
        //添加参数
        urlParamMap.put("page","1");
        urlParamMap.put("size","20");
        urlParamMap.put("stateFlags[]","2");
        urlParamMap.put("isHardWare","true");
        urlParamMap.put("userKey","0635fe71-699a-4feb-8894-de0dc7f632ac");

        String googleData = HttpClientUtil.doGet(googleEvent, urlParamMap);

        JSONObject jsonObject = JSONObject.parseObject(googleData);

        JSONArray dataArray = JSONArray.parseArray(jsonObject.get("data").toString());



        if (dataArray.size() != 0){
            for (int i =0;i < dataArray.size();i++){
                String startDate = dataArray.getJSONObject(i).getString("startDate");
                String startTime = dataArray.getJSONObject(i).getString("startTime");
                String endDate = dataArray.getJSONObject(i).getString("endDate");
                String endTime = dataArray.getJSONObject(i).getString("endTime");
                String eventDesc = dataArray.getJSONObject(i).getString("eventDesc");
                String locRoadName = dataArray.getJSONObject(i).getString("locRoadName");
                String sEventId = dataArray.getJSONObject(i).getString("sEventId");
                String deviceId = sEventId.substring(0,9);

               long startDataTimeTem =  Long.parseLong(startDate) + Long.parseLong(startTime);
               String startDataTime = String.valueOf(startDataTimeTem) + "000";

                long endDataTimeTem =  Long.parseLong(endDate) + Long.parseLong(endTime);
                String endDataTime = String.valueOf(endDataTimeTem) + "000";

                Map<String,String> res = syetemLogInf.getConeBucketLastTimeBydeviceId(deviceId);

                if (res.size() != 0){

                }else {
                    int tem = syetemLogInf.addConeBucketTime(deviceId,"0",eventDesc,locRoadName,startDataTime,endDataTime);

                    if (tem > 0) {

                    }else {

                    }
                }

            }
        }


    }
}
