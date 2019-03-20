/**
 * FileName: SystemManagerController
 * author:   Melone
 * Date:     2019/3/19 18:03
 * History:
 * <author>    <time>     <version>   <desc>
 * 作者姓名     修改时间    版本号        描述
 **/
package com.jiaoke.control;

import com.jiaoke.serviceInf.UserManagerServiceInf;
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
 * @create: 2019/3/19 18:03
 * @Description:
 */
@Controller
public class SystemManagerController {

    @Autowired
    private UserManagerServiceInf userManagerServiceInf;
    @ResponseBody
    @RequestMapping(value = "/addUser.do",method = RequestMethod.POST)
    public String addUser(@RequestParam("userName") String userName,@RequestParam("password") String password,@RequestParam("phone") String phone){
        Map<String,Object> resMap = new HashMap<>();
        int id = userManagerServiceInf.addUser(userName,password,phone);
        if (id > 0){
            resMap.put("resCode","200");
        }else {
            resMap.put("resCode","403");
        }
    }
}
