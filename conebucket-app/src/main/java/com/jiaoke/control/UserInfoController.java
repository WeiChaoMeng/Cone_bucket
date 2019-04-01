package com.jiaoke.control;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.jiaoke.bean.RoleInfo;
import com.jiaoke.bean.UserInfo;
import com.jiaoke.bean.UserRole;
import com.jiaoke.service.RoleInfoService;
import com.jiaoke.service.UserInfoService;
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
 * 用户
 *
 * @author lihui
 * @version 1.0
 * @date 2019/3/21 14:37
 */
@Controller
@RequestMapping("/userInfo")
@RequiresPermissions("systemManage")
public class UserInfoController {

    @Resource
    private RoleInfoService roleInfoService;

    @Resource
    private UserInfoService userInfoService;

    /**
     * 跳转用户首页
     *
     * @return user_info.jsp
     */
    @RequestMapping("/toIndex.do")
    public String toIndex(Model model) {
        //加载角色列表
        List<RoleInfo> roleInfoList = roleInfoService.selectAll();
        model.addAttribute("roleInfoList", roleInfoList);
        return "system/user_manage";
    }

    /**
     * 加载数据
     *
     * @return json
     */
    @RequestMapping("/index.do")
    @ResponseBody
    public String index(int page) {
        PageHelper.startPage(page, 9);
        List<UserInfo> userInfoList = userInfoService.selectAll();
        PageInfo<UserInfo> pageInfo = new PageInfo<>(userInfoList);
        return JsonHelper.toJSONString(pageInfo);
    }

    /**
     * 搜索
     *
     * @param page     page
     * @param userName 用户名称
     * @return json
     */
    @RequestMapping("/search.do")
    @ResponseBody
    public String fuzzyQuery(int page, String userName) {
        PageHelper.startPage(page, 9);
        List<UserInfo> userInfoList = userInfoService.fuzzyQuery(userName);
        PageInfo<UserInfo> pageInfo = new PageInfo<>(userInfoList);
        return JsonHelper.toJSONString(pageInfo);
    }

    /**
     * 添加用户
     *
     * @param userInfo userInfo
     * @return s/e
     */
    @RequestMapping("/add.do")
    @ResponseBody
    public String add(UserInfo userInfo) {
        if (userInfoService.addUserInfo(userInfo) < 0) {
            return "error";
        }
        return "success";
    }

    /**
     * 用户绑定角色
     *
     * @param id    用户id
     * @param array 角色List
     * @return s/e
     */
    @RequestMapping("/bindingRoles.do")
    @ResponseBody
    public String bindingRoles(Integer id, String[] array) {
        if (userInfoService.bindingRoles(id, array) < 0) {
            return "error";
        }
        return "success";
    }

    /**
     * 获取所有角色接已绑定的角色
     *
     * @param id 用户id
     * @return list
     */
    @RequestMapping("/possessRole.do")
    @ResponseBody
    public String queryPossessRole(Integer id) {
        HashMap<String, Object> map = new HashMap<>(16);
        List<RoleInfo> possessRoleInfoList = roleInfoService.queryPossessRole(id);
        List<RoleInfo> roleInfoList = roleInfoService.selectAll();
        map.put("possessRoleInfoList", possessRoleInfoList);
        map.put("roleInfoList", roleInfoList);
        return JsonHelper.toJSONString(map);
    }

    /**
     * 删除用户和关联的角色
     *
     * @param id 用户id
     * @return s/e
     */
    @RequestMapping("/remove.do")
    @ResponseBody
    public String remove(Integer id) {
        if (userInfoService.remove(id) < 0) {
            return "error";
        }
        return "success";
    }

    /**
     * 详情
     *
     * @param id id
     * @return 用户详情及角色信息
     */
    @RequestMapping("/details.do")
    @ResponseBody
    public String details(Integer id) {
        Map<String, Object> map = userInfoService.details(id);
        return JsonHelper.toJSONString(map);
    }

    /**
     * 修改用户信息
     *
     * @param id 主键
     * @return userInfo
     */
    @RequestMapping("/toEdit.do")
    @ResponseBody
    public String toEdit(Integer id) {
        UserInfo userInfo = userInfoService.selectByPrimaryKey(id);
        return JsonHelper.toJSONString(userInfo);
    }

    /**
     * 提交修改用户信息
     *
     * @param userInfo userInfo
     * @return userInfo
     */
    @RequestMapping("/edit.do")
    @ResponseBody
    public String edit(UserInfo userInfo) {
        if (userInfoService.update(userInfo) < 0) {
            return "error";
        }
        return "success";
    }


}
