/**
 * FileName: ConeBucketManagerControl
 * author:   Melone
 * Date:     2019/3/17 20:46
 * History:
 * <author>    <time>     <version>   <desc>
 * 作者姓名     修改时间    版本号        描述
 **/
package com.jiaoke.control;

import com.alibaba.fastjson.JSON;
import com.jiaoke.serviceInf.ConeBucketManagerServiceInf;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 *  <一句话功能描述>
 *
 * @author: Melone
 * @create: 2019/3/17 20:46
 * @Description:
 */
@Controller
public class ConeBucketManagerControl {

    @Autowired
    private ConeBucketManagerServiceInf coneBucketManagerServiceInf;

    /**
     *
     * 功能描述: <br>
     *  <锥桶添加函数>
     * @param [diseaseNumber, roadName]
     * @return java.lang.String
     * @auther Melone
     * @date 2019/3/18 17:52
     */
    @ResponseBody
    @RequestMapping(value = "/addConeBucket.do" ,method = RequestMethod.POST)
    public String addConeBucket(@RequestParam("diseaseNumber") String diseaseNumber , @RequestParam("roadName") String roadName){

        Map<String,Object> map = new HashMap<>();
        if (diseaseNumber.isEmpty() || roadName.isEmpty()) {
            map.put("resultCode","404");
            return JSON.toJSONString(map);
        }

        int id =  coneBucketManagerServiceInf.addConeBucket(diseaseNumber,roadName);

        if (id > 0){
            map.put("resultCode","200");
            String tem = JSON.toJSONString(map);
            return tem;
        }else {
            map.put("resultCode","404");
            return JSON.toJSONString(map);
        }
    }

    /**
     *
     * 功能描述: <br>
     *  <查询所有锥桶>
     * @param []
     * @return java.lang.String
     * @auther Melone
     * @date 2019/3/18 17:54
     */
    @ResponseBody
    @RequestMapping("/getAllConeBucket.do")
    public String getAllConeBucket(){

        //返回map
        Map<String,Object> resMap = new HashMap<>();
        //查询数据
        List<Map<String,Object>> coneBucketList = coneBucketManagerServiceInf.getAllConeBucket();

        if (coneBucketList.size() == 0){
            resMap.put("resCode","404");
        }else {
            resMap.put("resData",coneBucketList);
            resMap.put("resCode","200");
        }

        String res = JSON.toJSONString(resMap);

        return res;
    }

    @ResponseBody
    @RequestMapping(value = "/removeConeBucketById.do" ,method = RequestMethod.POST)
    public String removeConeBucketById(@RequestParam("idArray") String[] idArray){
        Map<String,Object> resMap = new HashMap<>();
        if (idArray.length == 0){
            resMap.put("resCode","403");
            String error = JSON.toJSONString(resMap);
            return error;
        }
       int tem =  coneBucketManagerServiceInf.removeConeBucketById(idArray);

        if (tem > 0){
            resMap.put("resCode","200");
        }else {
            resMap.put("resCode","403");
        }

        return JSON.toJSONString(resMap);
    }

    @ResponseBody
    @RequestMapping(value = "/getConeBucketByCondition.do" ,method = RequestMethod.POST)
    public String getConeBucketByCondition(@RequestParam("cbn") String cbn,@RequestParam("cbt") String cbt){

        Map<String,Object> resMap = new HashMap<>();

        List<Map<String,Object>>  cbList = coneBucketManagerServiceInf.getConeBucketByCondition(cbn,cbt);

        if (cbList.size() != 0){
            resMap.put("resCode","200");
            resMap.put("resData",cbList);
        }else {
            resMap.put("resCode","403");
        }

        return JSON.toJSONString(resMap);
    }

    @RequestMapping("/getConeBucketLog.do")
    public String getConeLog(String coneBucketNum, Model model){

        List<Map<String,String>> list = coneBucketManagerServiceInf.getConeBucketLogByConeBucketNum(coneBucketNum);

        model.addAttribute("logList",list);

        return "bucket/cone_bucket_log";
    }
}
