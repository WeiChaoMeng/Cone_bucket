package com.jiaoke.service;

import com.jiaoke.bean.Permission;

import java.util.List;

/**
 * 权限
 *
 * @author lihui
 * @version 1.0
 * @date 2019/3/15 15:00
 */
public interface PermissionService {

    /**
     * 查询全部
     *
     * @return list
     */
    List<Permission> selectAll();

    /**
     * 根据权限描述模糊查询
     *
     * @param description 权限描述
     * @return list
     */
    List<Permission> fuzzyQueryByDescription(String description);
}
