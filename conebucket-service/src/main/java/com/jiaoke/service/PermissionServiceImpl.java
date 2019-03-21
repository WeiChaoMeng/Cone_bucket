package com.jiaoke.service;

import com.jiaoke.bean.Permission;
import com.jiaoke.web.dao.PermissionMapper;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * 权限
 *
 * @author lihui
 * @version 1.0
 * @date 2019/3/15 15:00
 */
@Service
public class PermissionServiceImpl implements PermissionService {

    @Resource
    private PermissionMapper permissionMapper;

    @Override
    public List<Permission> fuzzyQueryByDescription(String description) {
        return permissionMapper.fuzzyQueryByDescription(description);
    }

    @Override
    public List<Permission> selectAll() {
        return permissionMapper.selectAll();
    }
}
