package com.jiaoke.web.dao;

import com.jiaoke.bean.RoleInfo;
import com.jiaoke.bean.RolePermission;
import com.jiaoke.bean.UserInfo;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;
import tk.mybatis.mapper.common.Mapper;

import java.util.List;

/**
 * 用户
 *
 * @author lihui
 * @version 1.0
 * @date 2019/3/15 14:55
 */
@Repository
public interface UserInfoMapper extends Mapper<UserInfo> {

    /**
     * 模糊查询
     *
     * @param userName 用户名称
     * @return list
     */
    List<UserInfo> fuzzyQuery(String userName);

    /**
     * 获取用户信息根据用户名称
     *
     * @param username username
     * @return UserInfo
     */
    UserInfo getUserInfoByUserName(String username);
}
