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

    /**
     * 中维URL
     */
    @Value("${zonwi}")
    private String zonwiURI;


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


        JSONObject jsonObject = JSONObject.parseObject(res);

        JSONArray online = JSONArray.parseArray(jsonObject.get("online").toString());

        List<Map<String,Object> > list = new ArrayList<>();

        for (int i = 0; i < online.size();i++){
            Map<String,Object> map = new HashMap<>();
            String id = online.getJSONObject(i).getString("id");
            String lastLocation = online.getJSONObject(i).getString("lastLocation");
            String roadInfo = online.getJSONObject(i).getString("RoadInfo");

            map.put("id",id);
            map.put("lastLocation",lastLocation);
            map.put("roadInfo",roadInfo);

            list.add(map);
        }


        return JSON.toJSONString(list);
    }
}
