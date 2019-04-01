package com.jiaoke.control;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.jiaoke.bean.Permission;
import com.jiaoke.bean.ProjectMessage;
import com.jiaoke.service.PermissionService;
import com.jiaoke.util.JsonHelper;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.util.List;

/**
 * 权限
 *
 * @author lihui
 * @version 1.0
 * @date 2019/3/20 21:09
 */
@Controller
@RequestMapping("/permission")
@RequiresPermissions("systemManage")
public class PermissionController {

    @Resource
    private PermissionService permissionService;

    /**
     * 跳转权限首页
     *
     * @return permissions_manage.jsp
     */
    @RequestMapping("/toIndex.do")
    public String toIndex() {
        return "system/permissions_manage";
    }

    /**
     * 加载数据
     *
     * @return permissions_manage.jsp
     */
    @RequestMapping("/index.do")
    @ResponseBody
    public String index(int page) {
        PageHelper.startPage(page, 9);
        List<Permission> permissionList = permissionService.selectAll();
        PageInfo<Permission> pageInfo = new PageInfo<>(permissionList);
        return JsonHelper.toJSONString(pageInfo);
    }

    /**
     * 搜索
     *
     * @param page        page
     * @param description 权限描述
     * @return json
     */
    @RequestMapping("/search.do")
    @ResponseBody
    public String fuzzyQueryByDescription(int page, String description) {
        PageHelper.startPage(page, 9);
        List<Permission> permissionList = permissionService.fuzzyQueryByDescription(description);
        PageInfo<Permission> pageInfo = new PageInfo<>(permissionList);
        return JsonHelper.toJSONString(pageInfo);
    }
}
