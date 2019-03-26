package com.jiaoke.web.dao;

import com.jiaoke.bean.UserRole;
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
public interface UserRoleMapper extends Mapper<UserRole> {

    /**
     * 角色绑定权限
     *
     * @param userId 用户id
     * @param array  角色id
     * @return list
     */
    int userBindingRole(@Param("userId") Integer userId, @Param("array") String[] array);

    /**
     * 根据用户id删除
     *
     * @param userId 用户id
     * @return 影响行数
     */
    int deleteByUserId(Integer userId);
}
