package com.jiaoke.control;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.jiaoke.bean.WarningLog;
import com.jiaoke.service.WarningLogService;
import com.jiaoke.util.JsonHelper;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.util.List;

/**
 * 预警日志
 *
 * @author lihui
 * @version 1.0
 * @date 2019/4/1 3:10
 */
@Controller
@RequestMapping("/warningLog")
public class WarningLogController {

    @Resource
    private WarningLogService warningLogService;

    @RequestMapping("/index.do")
    @ResponseBody
    public String index(int page) {
        PageHelper.startPage(page, 10);
        List<WarningLog> warningLogList = warningLogService.selectAll();
        PageInfo<WarningLog> pageInfo = new PageInfo<>(warningLogList);
        return JsonHelper.toJSONString(pageInfo);
    }
}
