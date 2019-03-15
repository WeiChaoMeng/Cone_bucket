package com.jiaoke.http; /**
 * FileName: HttpClientUtil
 * author:   Melone
 * Date:     2019/3/15 14:23
 * History:
 * <author>    <time>     <version>   <desc>
 * 作者姓名     修改时间    版本号        描述
 **/

import org.apache.http.client.methods.CloseableHttpResponse;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.client.utils.URIBuilder;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClients;
import org.apache.http.util.EntityUtils;

import java.io.IOException;
import java.net.URI;
import java.util.Map;

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




}
