package com.jiaoke.control;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.jiaoke.bean.ProjectLog;
import com.jiaoke.service.ProjectLogService;
import com.jiaoke.util.JsonHelper;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.util.List;

/**
 * 工程日志
 *
 * @author lihui
 * @version 1.0
 * @date 2019/4/1 3:10
 */
@Controller
@RequestMapping("/projectLog")
public class ProjectLogController {

    @Resource
    private ProjectLogService projectLogService;

    @RequestMapping("/index.do")
    @ResponseBody
    public String index(int page) {
        PageHelper.startPage(page, 10);
        List<ProjectLog> projectLogList = projectLogService.selectAll();
        PageInfo<ProjectLog> pageInfo = new PageInfo<>(projectLogList);
        return JsonHelper.toJSONString(pageInfo);
    }
}
