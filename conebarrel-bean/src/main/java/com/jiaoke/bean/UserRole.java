package com.jiaoke.bean;

import javax.persistence.Column;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * 用户-角色关联表
 *
 * @author lihui
 * @version 1.0
 * @date 2019/3/20 20:50
 */
@Table(name = "user_role")
public class UserRole {

    /**
     * 主键
     */
    @Id
    @Column(name = "id")
    private Integer id;

    /**
     * 用户id
     */
    private Integer userInfoId;

    /**
     * 角色id
     */
    private Integer roleInfoId;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getUserInfoId() {
        return userInfoId;
    }

    public void setUserInfoId(Integer userInfoId) {
        this.userInfoId = userInfoId;
    }

    public Integer getRoleInfoId() {
        return roleInfoId;
    }

    public void setRoleInfoId(Integer roleInfoId) {
        this.roleInfoId = roleInfoId;
    }
}
