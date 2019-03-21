package com.jiaoke.service;

import com.jiaoke.bean.RoleInfo;
import com.jiaoke.util.DateUtil;
import com.jiaoke.web.dao.RoleInfoMapper;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
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
}
