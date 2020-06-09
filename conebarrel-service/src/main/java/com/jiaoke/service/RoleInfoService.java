package com.jiaoke.service;

import com.jiaoke.bean.RoleInfo;

import java.util.List;
import java.util.Map;

/**
 * 角色
 *
 * @author lihui
 * @version 1.0
 * @date 2019/3/15 15:00
 */
public interface RoleInfoService {

    /**
     * 查询全部
     *
     * @return list
     */
    List<RoleInfo> selectAll();

    /**
     * 根据权限描述模糊查询
     *
     * @param description 权限描述
     * @return list
     */
    List<RoleInfo> fuzzyQueryByRoleName(String description);


    /**
     * 添加角色并绑定权限
     *
     * @param roleInfo roleInfo
     * @return 影响行数
     */
    int addRole(RoleInfo roleInfo);

    /**
     * 删除角色
     *
     * @param id id
     * @return 影响行数
     */
    int remove(Integer id);


    /**
     * 查询已有角色
     *
     * @param id 用户id
     * @return list
     */
    List<RoleInfo> queryPossessRole(Integer id);

    /**
     * 根据主键查询
     *
     * @param id 主键
     * @return roleInfo
     */
    RoleInfo selectByPrimaryKey(Integer id);

    /**
     * 更新角色信息
     *
     * @param roleInfo roleInfo
     * @return int
     */
    int update(RoleInfo roleInfo);

    /**
     * 角色详情
     *
     * @param id 角色id
     * @return userInfo
     */
    Map<String, Object> details(Integer id);

    /**
     * 绑定权限
     *
     * @param id    角色id
     * @param array 权限List
     * @return 影响行数
     */
    int bindingPermission(Integer id, String[] array);
}
