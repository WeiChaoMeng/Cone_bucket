package com.jiaoke.service;

import com.jiaoke.bean.Permission;
import com.jiaoke.bean.RoleInfo;
import com.jiaoke.bean.UserInfo;
import com.jiaoke.util.DateUtil;
import com.jiaoke.web.dao.PermissionMapper;
import com.jiaoke.web.dao.RoleInfoMapper;
import com.jiaoke.web.dao.RolePermissionMapper;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import javax.management.relation.Role;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 角色
 *
 * @author lihui
 * @version 1.0
 * @date 2019/3/15 15:00
 */
@Service
public class RoleInfoServiceImpl implements RoleInfoService {

    @Resource
    private RoleInfoMapper roleInfoMapper;

    @Resource
    private RolePermissionMapper rolePermissionMapper;

    @Resource
    private PermissionMapper permissionMapper;

    @Override
    public List<RoleInfo> fuzzyQueryByRoleName(String roleName) {
        List<RoleInfo> roleInfoList = roleInfoMapper.fuzzyQueryByRoleName(roleName);
        for (RoleInfo roleInfo : roleInfoList) {
            roleInfo.setCreateTimeStr(DateUtil.dateConvertYYYYMMDDHHMMSS(roleInfo.getCreateTime()));
        }
        return roleInfoList;
    }

    @Override
    public List<RoleInfo> selectAll() {
        return roleInfoMapper.selectAll();
    }

    @Override
    public int addRole(RoleInfo roleInfo) {
        roleInfo.setCreateTime(new Date());
        return roleInfoMapper.insertSelective(roleInfo);
    }

    @Override
    public int remove(Integer id) {
        //删除角色
        if (roleInfoMapper.deleteByPrimaryKey(id) < 0) {
            return -1;
        } else {
            //删除角色关联的权限
            if (rolePermissionMapper.deleteByRoleId(id) < 0) {
                return -1;
            }
        }
        return 1;
    }

    @Override
    public List<RoleInfo> queryPossessRole(Integer id) {
        return roleInfoMapper.selectByUserId(id);
    }

    @Override
    public RoleInfo selectByPrimaryKey(Integer id) {
        return roleInfoMapper.selectByPrimaryKey(id);
    }

    @Override
    public int update(RoleInfo roleInfo) {
        return roleInfoMapper.updateByPrimaryKeySelective(roleInfo);
    }

    @Override
    public Map<String, Object> details(Integer id) {
        Map<String, Object> map = new HashMap<>();
        RoleInfo roleInfo = roleInfoMapper.selectByPrimaryKey(id);
        List<Permission> permissionList = permissionMapper.selectByRoleId(id);
        map.put("roleInfo", roleInfo);
        map.put("permissionList", permissionList);
        return map;
    }

    @Override
    public int bindingPermission(Integer id, String[] array) {
        //删除绑定的权限
        if (rolePermissionMapper.deleteByRoleId(id) < 0) {
            return -1;
        } else {
            if (rolePermissionMapper.roleBindingPermission(id, array) < 0) {
                return -1;
            }
        }
        return 1;
    }
}
