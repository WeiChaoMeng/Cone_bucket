package com.jiaoke.web.dao;

import com.jiaoke.bean.RolePermission;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;
import tk.mybatis.mapper.common.Mapper;

/**
 * 角色-权限
 *
 * @author lihui
 * @version 1.0
 * @date 2019/3/15 14:55
 */
@Repository
public interface RolePermissionMapper extends Mapper<RolePermission> {

    /**
     * 角色绑定权限
     *
     * @param roleId 角色id
     * @param array  权限id
     * @return list
     */
    int roleBindingPermission(@Param("roleId") Integer roleId, @Param("array") String[] array);

    /**
     * 根据角色id删除
     *
     * @param roleId 角色id
     * @return 影响行数
     */
    int deleteByRoleId(Integer roleId);
}
