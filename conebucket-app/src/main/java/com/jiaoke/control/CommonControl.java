/**
 * FileName: CommonControl
 * author:   Melone
 * Date:     2019/3/13 14:18
 * History:
 * <author>    <time>     <version>   <desc>
 * 作者姓名     修改时间    版本号        描述
 **/
package com.jiaoke.control;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 *  <一句话功能描述>
 *
 * @author: Melone
 * @create: 2019/3/13 14:18
 * @Description:
 */
@Controller
public class CommonControl {

    @RequestMapping("/")
    public String index(){
        return "index";
    }
}
