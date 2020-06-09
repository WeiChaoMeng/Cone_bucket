package com.jiaoke.control;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.jiaoke.bean.ConeBarrelLog;
import com.jiaoke.service.ConeBarrelLogService;
import com.jiaoke.util.JsonHelper;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.util.List;

/**
 * 锥桶日志
 *
 * @author lihui
 * @version 1.0
 * @date 2019/4/1 3:10
 */
@Controller
@RequestMapping("/coneBarrel")
public class ConeBarrelLogController {

    @Resource
    private ConeBarrelLogService coneBarrelLogService;

    @RequestMapping("/index.do")
    @ResponseBody
    public String index(int page) {
        PageHelper.startPage(page, 10);
        List<ConeBarrelLog> coneBarrelLogList = coneBarrelLogService.selectAll();
        PageInfo<ConeBarrelLog> pageInfo = new PageInfo<>(coneBarrelLogList);
        return JsonHelper.toJSONString(pageInfo);
    }
}
