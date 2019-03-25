package com.jiaoke.service;

import com.jiaoke.bean.RoleInfo;

import java.util.List;

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
     * @param roleName    角色名称
     * @param description 角色说明
     * @param array       权限List
     * @return 影响行数
     */
    int addRole(String roleName, String description, String[] array);

    /**
     * 删除角色
     *
     * @param id id
     * @return 影响行数
     */
    int remove(Integer id);
}
