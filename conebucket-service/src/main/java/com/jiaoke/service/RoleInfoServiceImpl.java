package com.jiaoke.service;

import com.jiaoke.bean.RoleInfo;
import com.jiaoke.util.DateUtil;
import com.jiaoke.web.dao.RoleInfoMapper;
import com.jiaoke.web.dao.RolePermissionMapper;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.Date;
import java.util.List;

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
    public int addRole(String roleName, String description, String[] array) {
        RoleInfo roleInfo = new RoleInfo();
        roleInfo.setRoleName(roleName);
        roleInfo.setDescription(description);
        roleInfo.setCreateTime(new Date());

        //添加角色
        if (roleInfoMapper.insertReturnPrimaryKey(roleInfo) < 0) {
            return -1;
        }

        //新增角色绑定权限
        if (rolePermissionMapper.roleBindingPermission(roleInfo.getId(), array) < 0) {
            return -1;
        }

        return 1;
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
}
