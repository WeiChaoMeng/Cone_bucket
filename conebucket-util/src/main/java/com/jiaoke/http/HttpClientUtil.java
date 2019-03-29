package com.jiaoke.http; /**
 * FileName: HttpClientUtil
 * author:   Melone
 * Date:     2019/3/15 14:23
 * History:
 * <author>    <time>     <version>   <desc>
 * 作者姓名     修改时间    版本号        描述
 **/

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import org.apache.http.client.methods.CloseableHttpResponse;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.client.utils.URIBuilder;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClients;
import org.apache.http.util.EntityUtils;

import java.io.IOException;
import java.net.URI;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.*;

/**
 *  <一句话功能描述>
 *
 * @author: Melone
 * @create: 2019/3/15 14:23
 * @Description:
 */

public class HttpClientUtil {

    /**
     *
     * 功能描述: <br>
     *  <发送带参数Get请求>
     * @param
     * @return java.lang.String
     * @auther Melone
     * @date 2019/3/15 14:45
     */
    public static String doGet(String url, Map<String,String> param){

        //使用apache.httpcomponents 创建一个http客户端对象
        CloseableHttpClient httpclient = HttpClients.createDefault();

        String resultString = "";
        CloseableHttpResponse response = null;

        try{
            //创建uri
            URIBuilder builder = new URIBuilder(url);
            if (param != null){
                for (String key:param.keySet()){
                    builder.addParameter(key,param.get(key));
                }
            }
            URI uri = builder.build();

            //创建HttpGET请求
            HttpGet httpGet = new HttpGet(uri);
            //执行请求
            response = httpclient.execute(httpGet);
            //判断状态码是否为200
            if(response.getStatusLine().getStatusCode() == 200){
                resultString = EntityUtils.toString(response.getEntity(), "UTF-8");
            }

        }catch (Exception e){
            e.printStackTrace();
        }finally {
            if (response != null){
                try{
                    response.close();
                    httpclient.close();
                }catch (IOException e){
                    e.printStackTrace();
                }
            }
        }

        return resultString;
    }


    /**
     *
     * 功能描述: <br>
     *  <不带参数的get请求>
     * @param
     * @return java.lang.String
     * @auther Melone
     * @date 2019/3/15 14:46
     */
    public static String doGet(String url) {

        return doGet(url, null);
    }

    /**
     *
     * 功能描述: <br>
     *  <根据接口返回的json,返回需要的数据>
     * @param
     * @return java.lang.String
     * @auther Melone
     * @date 2019/3/16 11:20
     */

    public static String resJsonToString(String res,String arrayName){

        JSONObject jsonObject = JSONObject.parseObject(res);

        JSONArray online = JSONArray.parseArray(jsonObject.get(arrayName).toString());

        List<Map<String,Object> > list = new ArrayList<>();

        //用于判断使用的接口是zonwi还是google
        String str = "online";

        if(str.equals(arrayName)){

                //测试展示数据
                Map<String,Object> map = new HashMap<>();

                map.put("id","1");
                map.put("lastLocation","116.3101959229,39.9234289527");
                map.put("roadName","西三环修复工程");

                Map<String,Object> map2 = new HashMap<>();
                map2.put("id","2");
                map2.put("lastLocation","116.3102227449,39.9228694481");
                map2.put("roadName","西三环修复工程");
                Map<String,Object> map3 = new HashMap<>();
                map3.put("id","3");
                map3.put("lastLocation","116.4897751808,39.9223428514");
                map3.put("roadName","东四环修复工程");
                Map<String,Object> map4 = new HashMap<>();
                map4.put("id","4");
                map4.put("lastLocation","116.4897322655,39.9205820144");
                map4.put("roadName","东四环修复工程");
                list.add(map);
                list.add(map2);
//            for (int i = 0; i < online.size();i++){
//
//                Map<String,Object> map = new HashMap<>();
//                String id = online.getJSONObject(i).getString("id");
//                String lastLocation = online.getJSONObject(i).getString("lastLocation");
//                //处理道路信息
//                String roadInfo = online.getJSONObject(i).getString("RoadInfo");
//                String roadName = "未获取道路信息";
//
//                if (roadInfo != null){
//                    JSONObject roadJson = JSONObject.parseObject(roadInfo);
//                    Object temObj = roadJson.get("RoadName");
//                    if (temObj !=  null){
//                        roadName = temObj.toString();
//                    }
//                }
//
//                map.put("id",id);
//                map.put("lastLocation",lastLocation);
//                map.put("roadName",roadName);
//
//                list.add(map);
//            }
        }else {

            for (int i = 0; i < online.size();i++){

                Map<String,Object> map = new HashMap<>();
                String lastLocation= online.getJSONObject(i).getString("locPos");
                String locRoadName = online.getJSONObject(i).getString("locRoadName");
                String sourceName = online.getJSONObject(i).getString("sourceName");

                map.put("lastLocation",lastLocation);
                map.put("locRoadName",locRoadName);
                map.put("sourceName",sourceName);

                list.add(map);
            }
        }

        return JSON.toJSONString(list);
    }


    public static String getConeBucketOnlineSize(String res,String arrayName){

        JSONObject jsonObject = JSONObject.parseObject(res);

        JSONArray online = JSONArray.parseArray(jsonObject.get(arrayName).toString());

        Map<String,Object> map = new HashMap<>();

        map.put("coneBucketSzie",online.size());

        return JSON.toJSONString(map);

    }
    /**
     * 时间戳转date字符串
     * @param time
     * @return
     */
    public static String timeStamp2Date(String time) {
        Long timeLong = Long.parseLong(time);
        //要转换的时间格式
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        Date date;
        try {
            date = sdf.parse(sdf.format(timeLong));
            return sdf.format(date);
        } catch (ParseException e) {
            e.printStackTrace();
            return null;
        }
    }
}
