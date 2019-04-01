package com.jiaoke.control;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.jiaoke.bean.Permission;
import com.jiaoke.bean.RoleInfo;
import com.jiaoke.service.PermissionService;
import com.jiaoke.service.RoleInfoService;
import com.jiaoke.util.JsonHelper;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 角色
 *
 * @author lihui
 * @version 1.0
 * @date 2019/3/20 21:09
 */
@Controller
@RequestMapping("/roleInfo")
@RequiresPermissions("systemManage")
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
     * 添加角色
     *
     * @param roleInfo roleInfo
     * @return s/e
     */
    @RequestMapping("/add.do")
    @ResponseBody
    public String add(RoleInfo roleInfo) {
        if (roleInfoService.addRole(roleInfo) < 0) {
            return "error";
        }
        return "success";
    }

    /**
     * 编辑角色
     *
     * @param id 主键
     * @return roleInfo
     */
    @RequestMapping("/toEdit.do")
    @ResponseBody
    public String toEdit(Integer id) {
        RoleInfo roleInfo = roleInfoService.selectByPrimaryKey(id);
        return JsonHelper.toJSONString(roleInfo);
    }

    /**
     * 编辑角色
     *
     * @param roleInfo roleInfo
     * @return s/e
     */
    @RequestMapping("/edit.do")
    @ResponseBody
    public String edit(RoleInfo roleInfo) {
        if (roleInfoService.update(roleInfo) < 0) {
            return "error";
        }
        return "success";
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

    /**
     * 查询所有角色
     *
     * @return list
     */
    @RequestMapping("/selectAll.do")
    @ResponseBody
    public String selectAll() {
        List<RoleInfo> roleInfoList = roleInfoService.selectAll();
        return JsonHelper.toJSONString(roleInfoList);
    }

    /**
     * 详情
     *
     * @param id id
     * @return 角色详情及权限信息
     */
    @RequestMapping("/details.do")
    @ResponseBody
    public String details(Integer id) {
        Map<String, Object> map = roleInfoService.details(id);
        return JsonHelper.toJSONString(map);
    }

    /**
     * 获取所有角色接已绑定的角色
     *
     * @param id 用户id
     * @return list
     */
    @RequestMapping("/possessPermission.do")
    @ResponseBody
    public String queryPossessRole(Integer id) {
        HashMap<String, Object> map = new HashMap<>(16);
        List<Permission> possessPermissionList = permissionService.queryPossessPermission(id);
        List<Permission> permissionList = permissionService.selectAll();
        map.put("possessPermissionList", possessPermissionList);
        map.put("permissionList", permissionList);
        return JsonHelper.toJSONString(map);
    }

    /**
     * 角色绑定权限
     *
     * @param id    用户id
     * @param array 角色List
     * @return s/e
     */
    @RequestMapping("/bindingPermission.do")
    @ResponseBody
    public String bindingRoles(Integer id, String[] array) {
        if (roleInfoService.bindingPermission(id, array) < 0) {
            return "error";
        }
        return "success";
    }

}
