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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.HashMap;
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

    @ResponseBody
    @RequestMapping(value = "/addConeBucket.do" ,method = RequestMethod.POST)
    public String addConeBucket(@RequestParam("diseaseNumber") String diseaseNumber , @RequestParam("roadName") String roadName){

        Map<String,Object> map = new HashMap<>();
        if (diseaseNumber.isEmpty() || roadName.isEmpty()) return JSON.toJSONString(map.put("code","404"));

        int id =  coneBucketManagerServiceInf.addConeBucket(diseaseNumber,roadName);

        if (id > 0){
            return JSON.toJSONString(map.put("code","200"));
        }else {
            return JSON.toJSONString(map.put("code","404"));
        }
    }
}
