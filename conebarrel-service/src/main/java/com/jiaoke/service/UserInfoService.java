package com.jiaoke.service;

import com.jiaoke.bean.Permission;
import com.jiaoke.bean.UserInfo;

import java.util.List;
import java.util.Map;

/**
 * 用户
 *
 * @author lihui
 * @version 1.0
 * @date 2019/3/15 15:00
 */
public interface UserInfoService {

    /**
     * 获取权限根据用户id
     *
     * @param userInfoId userInfoId
     * @return permission
     */
    List<Permission> getPermissionsByUserInfoId(Integer userInfoId);

    /**
     * 获取用户信息根据用户名称
     *
     * @param username username
     * @return UserInfo
     */
    UserInfo getUserInfoByUserName(String username);

    /**
     * 查询全部
     *
     * @return list
     */
    List<UserInfo> selectAll();

    /**
     * 模糊查询
     *
     * @param userName 用户名
     * @return list
     */
    List<UserInfo> fuzzyQuery(String userName);


    /**
     * 添加角色
     *
     * @param userInfo userInfo
     * @return 影响行数
     */
    int addUserInfo(UserInfo userInfo);

    /**
     * 添加角色并绑定权限
     *
     * @param id    用户id
     * @param array 角色List
     * @return 影响行数
     */
    int bindingRoles(Integer id, String[] array);

    /**
     * 删除
     *
     * @param id id
     * @return 影响行数
     */
    int remove(Integer id);

    /**
     * 用户详情
     *
     * @param id 用户id
     * @return userInfo
     */
    Map<String, Object> details(Integer id);

    /**
     * 根据主键查询
     *
     * @param id 主键
     * @return userInf
     */
    UserInfo selectByPrimaryKey(Integer id);

    /**
     * 更新用户信息
     *
     * @param userInfo userInfo
     * @return int
     */
    int update(UserInfo userInfo);
}
