package com.jiaoke.control;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.jiaoke.bean.RoleInfo;
import com.jiaoke.bean.UserInfo;
import com.jiaoke.service.RoleInfoService;
import com.jiaoke.service.UserInfoService;
import com.jiaoke.util.JsonHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.util.List;

/**
 * 用户
 *
 * @author lihui
 * @version 1.0
 * @date 2019/3/21 14:37
 */
@Controller
@RequestMapping("/userInfo")
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
     * 添加用户并绑定角色
     *
     * @param username 用户名
     * @param password 密码
     * @param phone    手机号
     * @param array    角色List
     * @return s/e
     */
    @RequestMapping("/add.do")
    @ResponseBody
    public String add(String username, String password, String phone, String[] array) {
        if (userInfoService.addUserInfo(username, password, phone, array) < 0) {
            return "error";
        }
        return "success";
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
}
