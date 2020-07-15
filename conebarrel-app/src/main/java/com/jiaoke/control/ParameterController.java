package com.jiaoke.control;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.jiaoke.bean.Parameter;
import com.jiaoke.service.ParameterService;
import com.jiaoke.util.JsonHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.util.List;

/**
 * 参数
 *
 * @author lihui
 * @version 1.0
 * @date 2019/3/20 21:09
 */
@Controller
@RequestMapping("/parameter")
public class ParameterController {

    @Resource
    private ParameterService parameterService;

    /**
     * 跳转首页
     *
     * @return permissions_manage.jsp
     */
    @RequestMapping("/toIndex.do")
    public String toIndex(Model model) {
        return "system/role_manage";
    }

    /**
     * 加载数据
     *
     * @return role.jsp
     */
    @RequestMapping("/index.do")
    @ResponseBody
    public String index(int page) {
        PageHelper.startPage(page, 9);
        List<Parameter> parameterList = parameterService.selectAll();
        PageInfo<Parameter> pageInfo = new PageInfo<>(parameterList);
        return JsonHelper.toJSONString(pageInfo);
    }

    /**
     * 搜索
     *
     * @param page      page
     * @param paramName 名称
     * @return json
     */
    @RequestMapping("/search.do")
    @ResponseBody
    public String fuzzyQueryByDescription(int page, String paramName) {
        PageHelper.startPage(page, 9);
        List<Parameter> parameterList = parameterService.fuzzyQueryByName(paramName);
        PageInfo<Parameter> pageInfo = new PageInfo<>(parameterList);
        return JsonHelper.toJSONString(pageInfo);
    }

    /**
     * 添加
     *
     * @param parameter parameter
     * @return s/e
     */
    @RequestMapping("/add.do")
    @ResponseBody
    public String add(Parameter parameter) {
        if (parameterService.addRole(parameter) < 0) {
            return "error";
        }
        return "success";
    }

    /**
     * 跳转编辑
     *
     * @param id 主键
     * @return roleInfo
     */
    @RequestMapping("/toEdit.do")
    @ResponseBody
    public String toEdit(Integer id) {
        Parameter parameter = parameterService.selectByPrimaryKey(id);
        return JsonHelper.toJSONString(parameter);
    }

    /**
     * 编辑
     *
     * @param parameter parameter
     * @return s/e
     */
    @RequestMapping("/edit.do")
    @ResponseBody
    public String edit(Parameter parameter) {
        if (parameterService.update(parameter) < 0) {
            return "error";
        }
        return "success";
    }

    /**
     * 删除
     *
     * @param id id
     * @return s/e
     */
    @RequestMapping("/remove.do")
    @ResponseBody
    public String remove(Integer id) {
        if (parameterService.remove(id) < 0) {
            return "error";
        }
        return "success";
    }

    /**
     * 详情
     *
     * @param id id
     * @return 详情信息
     */
    @RequestMapping("/details.do")
    @ResponseBody
    public String details(Integer id) {
        Parameter parameter = parameterService.selectByPrimaryKey(id);
        return JsonHelper.toJSONString(parameter);
    }

}
