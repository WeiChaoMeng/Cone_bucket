package com.jiaoke.service;

import com.jiaoke.bean.Permission;
import com.jiaoke.bean.RoleInfo;
import com.jiaoke.bean.UserInfo;
import com.jiaoke.bean.UserRole;
import com.jiaoke.util.DateUtil;
import com.jiaoke.web.dao.PermissionMapper;
import com.jiaoke.web.dao.RoleInfoMapper;
import com.jiaoke.web.dao.UserInfoMapper;
import com.jiaoke.web.dao.UserRoleMapper;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 用户
 *
 * @author lihui
 * @version 1.0
 * @date 2019/3/15 15:00
 */
@Service
public class UserInfoServiceImpl implements UserInfoService {

    @Resource
    private UserInfoMapper userInfoMapper;

    @Resource
    private UserRoleMapper userRoleMapper;

    @Resource
    private RoleInfoMapper roleInfoMapper;

    @Resource
    private PermissionMapper permissionMapper;

    @Override
    public List<Permission> getPermissionsByUserInfoId(Integer userInfoId) {
        return permissionMapper.getPermissionsByUserInfoId(userInfoId);
    }

    @Override
    public UserInfo getUserInfoByUserName(String username) {
        return userInfoMapper.getUserInfoByUserName(username);
    }

    @Override
    public List<UserInfo> fuzzyQuery(String userName) {
        List<UserInfo> userInfoList = userInfoMapper.fuzzyQuery(userName);
        for (UserInfo info : userInfoList) {
            info.setRegisterTimeStr(DateUtil.dateConvertYYYYMMDDHHMMSS(info.getRegisterTime()));
        }
        return userInfoList;
    }

    @Override
    public List<UserInfo> selectAll() {
        return userInfoMapper.selectAll();
    }

    @Override
    public int addUserInfo(UserInfo userInfo) {
        userInfo.setRegisterTime(new Date());
        return userInfoMapper.insertSelective(userInfo);
    }

    @Override
    public int bindingRoles(Integer id, String[] array) {
        //删除绑定的角色
        if (userRoleMapper.deleteByUserId(id) < 0) {
            return -1;
        } else {
            if (userRoleMapper.userBindingRole(id, array) < 0) {
                return -1;
            }
        }
        return 1;
    }

    @Override
    public int remove(Integer id) {
        //删除角色
        if (userInfoMapper.deleteByPrimaryKey(id) < 0) {
            return -1;
        } else {
            //删除用户关联角色
            if (userRoleMapper.deleteByUserId(id) < 0) {
                return -1;
            }
        }
        return 1;
    }

    @Override
    public Map<String, Object> details(Integer id) {
        Map<String, Object> map = new HashMap<>();
        UserInfo userInfo = userInfoMapper.selectByPrimaryKey(id);
        List<RoleInfo> roleInfoList = roleInfoMapper.selectByUserId(id);
        map.put("userInfo", userInfo);
        map.put("roleInfoList", roleInfoList);
        return map;
    }

    @Override
    public UserInfo selectByPrimaryKey(Integer id) {
        return userInfoMapper.selectByPrimaryKey(id);
    }

    @Override
    public int update(UserInfo userInfo) {
        return userInfoMapper.updateByPrimaryKeySelective(userInfo);
    }
}
