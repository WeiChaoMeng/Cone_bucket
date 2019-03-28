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
 * <一句话功能描述>
 *
 * @author: Melone
 * @create: 2019/3/13 14:18
 * @Description:
 */
@Controller
public class CommonControl {

    /**
     * 浏览器版本校验
     *
     * @return jsp
     */
    @RequestMapping("/")
    public String index() {
        return "login";
    }

    /**
     * 登录
     *
     * @return jsp
     */
    @RequestMapping("/login.do")
    public String login() {
        return "login";
    }

    /**
     * 版本过低页面
     *
     * @return jsp
     */
    @RequestMapping("/version.do")
    public String version() {
        return "version";
    }

    /**
     * 跳转首页
     *
     * @return main.jsp
     */
    @RequestMapping("/main.do")
    public String main() {
        return "main";
    }

    /*------------------------系统管理------------------------------*/

    /**
     * 参数管理
     *
     * @return parameter_configure.jsp
     */
    @RequestMapping("/parameterConfigure.do")
    public String parameterConfigure() {
        return "system/parameter_configure";
    }

    /*----------------------------设备管理------------------------------*/

    /**
     * 锥桶管理
     *
     * @return cone_bucket_manage.jsp
     */
    @RequestMapping("/coneBucketManage.do")
    public String coneBucketManage() {
        return "bucket/cone_bucket_manage";
    }

    /*----------------------------日志管理-------------------------------------*/

    /**
     * 工程日志
     *
     * @return engineering_log.jsp
     */
    @RequestMapping("/engineeringLog.do")
    public String engineeringLog() {
        return "log/engineering_log";
    }

    /**
     * 锥桶日志
     *
     * @return engineering_log.jsp
     */
    @RequestMapping("/coneBucketLog.do")
    public String coneBucketLog() {
        return "log/cone_bucket_log";
    }

    /**
     * 预警日志
     *
     * @return alert_log.jsp
     */
    @RequestMapping("/alertLog.do")
    public String alertLog() {
        return "log/alert_log";
    }


}
