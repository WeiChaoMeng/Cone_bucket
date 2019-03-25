package com.jiaoke.service;

import com.jiaoke.bean.UserInfo;
import com.jiaoke.util.DateUtil;
import com.jiaoke.web.dao.UserInfoMapper;
import com.jiaoke.web.dao.UserRoleMapper;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.Date;
import java.util.List;

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
    public int addUserInfo(String username, String password,String phone, String[] array) {
        UserInfo userInfo = new UserInfo();
        userInfo.setUsername(username);
        userInfo.setPassword(password);
        userInfo.setPhone(phone);
        userInfo.setRegisterTime(new Date());

        //添加用户
        if (userInfoMapper.insertReturnPrimaryKey(userInfo) < 0) {
            return -1;
        }

        //新增用户绑定角色
        if (userRoleMapper.userBindingRole(userInfo.getId(), array) < 0) {
            return -1;
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
}
