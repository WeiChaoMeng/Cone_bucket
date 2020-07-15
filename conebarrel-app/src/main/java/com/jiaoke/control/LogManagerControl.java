/**
 * FileName: LogManagerControl
 * author:   Melone
 * Date:     2019/3/29 11:08
 * History:
 * <author>    <time>     <version>   <desc>
 * 作者姓名     修改时间    版本号        描述
 **/
package com.jiaoke.control;

import com.alibaba.fastjson.JSON;
import com.jiaoke.bean.LogMessage;
import com.jiaoke.bean.PageBean;
import com.jiaoke.serviceInf.LogManagerInf;
import com.jiaoke.util.PagingUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.List;
import java.util.Map;

/**
 *  <一句话功能描述>
 *
 * @author: Melone
 * @create: 2019/3/29 11:08
 * @Description:
 */
@Controller
public class LogManagerControl {

    @Autowired
    private LogManagerInf logManagerInf;

    /**
     *
     * 功能描述: <br>
     *  <查询所有锥桶日志>
     * @param
     * @return
     * @auther Melone
     * @date 2019/3/29 11:21
     */
    @RequestMapping("/getAllConeBucketLog.do")
    public String getAllConeBucketLog(HttpServletRequest request){

        String temp = request.getParameter("currentPageNum");
        String url = PagingUtil.getUrl(request);

        PageBean<LogMessage> page = new PageBean();

        if ( temp == null || temp.trim().isEmpty() ){
            page = logManagerInf.getAllConeBucketLog(1,url);
        }else {
            page = logManagerInf.getAllConeBucketLog(Integer.parseInt(temp),url);
        }

        if (null == page) return null;

        request.setAttribute("pageBean",page);

        return "log/cone_bucket_log";
    }
}
