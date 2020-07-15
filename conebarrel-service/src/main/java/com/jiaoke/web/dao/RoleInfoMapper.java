package com.jiaoke.web.dao;

import com.jiaoke.bean.RoleInfo;
import org.springframework.stereotype.Repository;
import tk.mybatis.mapper.common.Mapper;

import java.util.List;

/**
 * 角色
 *
 * @author lihui
 * @version 1.0
 * @date 2019/3/15 14:55
 */
@Repository
public interface RoleInfoMapper extends Mapper<RoleInfo> {
    /**
     * 根据角色名称模糊查询
     *
     * @param roleName 角色名称
     * @return list
     */
    List<RoleInfo> fuzzyQueryByRoleName(String roleName);

    /**
     * 根据用户id查询
     *
     * @param userId 用户id
     * @return list
     */
    List<RoleInfo> selectByUserId(Integer userId);
}
