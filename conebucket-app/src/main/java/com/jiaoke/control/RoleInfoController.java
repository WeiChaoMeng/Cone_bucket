package com.jiaoke.control;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.jiaoke.bean.Permission;
import com.jiaoke.bean.RoleInfo;
import com.jiaoke.service.PermissionService;
import com.jiaoke.service.RoleInfoService;
import com.jiaoke.util.JsonHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.util.List;

/**
 * 角色
 *
 * @author lihui
 * @version 1.0
 * @date 2019/3/20 21:09
 */
@Controller
@RequestMapping("/roleInfo")
public class RoleInfoController {

    @Resource
    private RoleInfoService roleInfoService;

    @Resource
    private PermissionService permissionService;

    /**
     * 跳转权限首页
     *
     * @return permissions_manage.jsp
     */
    @RequestMapping("/toIndex.do")
    public String toIndex(Model model) {
        List<Permission> permissionList = permissionService.selectAll();
        model.addAttribute("permissionList", permissionList);
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
        List<RoleInfo> roleInfoList = roleInfoService.selectAll();
        PageInfo<RoleInfo> pageInfo = new PageInfo<>(roleInfoList);
        return JsonHelper.toJSONString(pageInfo);
    }

    /**
     * 搜索
     *
     * @param page     page
     * @param roleName 角色名称
     * @return json
     */
    @RequestMapping("/search.do")
    @ResponseBody
    public String fuzzyQueryByDescription(int page, String roleName) {
        PageHelper.startPage(page, 9);
        List<RoleInfo> roleInfoList = roleInfoService.fuzzyQueryByRoleName(roleName);
        PageInfo<RoleInfo> pageInfo = new PageInfo<>(roleInfoList);
        return JsonHelper.toJSONString(pageInfo);
    }

    /**
     * 添加角色并绑定权限
     *
     * @param roleName    角色名称
     * @param description 角色说明
     * @param array       权限List
     * @return s/e
     */
    @RequestMapping("/add.do")
    @ResponseBody
    public String add(String roleName, String description, String[] array) {
        if (roleInfoService.addRole(roleName, description, array) < 0) {
            return "error";
        }
        return "success";
    }

    @RequestMapping("/edit.do")
    @ResponseBody
    public String edit() {
        return "";
    }


    /**
     * 删除角色和关联的权限
     *
     * @param id 角色id
     * @return s/e
     */
    @RequestMapping("/remove.do")
    @ResponseBody
    public String remove(Integer id) {
        if (roleInfoService.remove(id) < 0) {
            return "error";
        }
        return "success";
    }
}
