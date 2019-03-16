package com.jiaoke.control;

import com.jiaoke.bean.ConeBucketType;
import com.jiaoke.bean.ProjectMessage;
import com.jiaoke.bean.ProjectType;
import com.jiaoke.service.ConeBucketTypeService;
import com.jiaoke.service.ProjectMessageService;
import com.jiaoke.service.ProjectTypeService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.util.List;

/**
 * 项目管理
 *
 * @author lihui
 * @version 1.0
 * @date 2019/3/15 14:43
 */
@Controller
@RequestMapping("/projectMessage")
public class ProjectMessageController {

    @Resource
    private ProjectMessageService projectMessageService;

    @Resource
    private ConeBucketTypeService coneBucketTypeService;

    @Resource
    private ProjectTypeService projectTypeService;

    /**
     * 跳转工程管理首页
     *
     * @return project_manage.jsp
     */
    @RequestMapping("/toIndex.do")
    public String toIndex() {
        return "project/project_manage";
    }

    /**
     * 跳转添加工程
     *
     * @return add.jsp
     */
    @RequestMapping("/toAdd.do")
    public String addEngineering(Model model) {
        //查询锥桶类型
        List<ConeBucketType> coneBucketTypeList = coneBucketTypeService.selectAll();
        //查询工程类型
        List<ProjectType> projectTypeList = projectTypeService.selectAll();

        model.addAttribute("coneBucketTypeList", coneBucketTypeList);
        model.addAttribute("projectTypeList", projectTypeList);
        return "project/add";
    }

    /**
     * 选择性插入数据
     *
     * @return 影响行数
     */
    @RequestMapping("/add.do")
    @ResponseBody
    public String insertSelective(ProjectMessage projectMessage) {
        System.out.println(projectMessage);
        if (projectMessageService.insertSelective(projectMessage) > 0) {
            return "success";
        }
        return "error";
    }
}
