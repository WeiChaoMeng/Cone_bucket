package com.jiaoke.service;

import com.jiaoke.bean.UserInfo;

import java.util.List;

/**
 * 用户
 *
 * @author lihui
 * @version 1.0
 * @date 2019/3/15 15:00
 */
public interface UserInfoService {

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
     * 添加角色并绑定权限
     *
     * @param username 用户名
     * @param password 密码
     * @param phone    手机号
     * @param array    角色List
     * @return 影响行数
     */
    int addUserInfo(String username, String password,String phone, String[] array);

    /**
     * 删除
     *
     * @param id id
     * @return 影响行数
     */
    int remove(Integer id);
}
