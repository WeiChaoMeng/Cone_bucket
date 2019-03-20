/**
 * FileName: UserManagerServiceImpl
 * author:   Melone
 * Date:     2019/3/19 18:42
 * History:
 * <author>    <time>     <version>   <desc>
 * 作者姓名     修改时间    版本号        描述
 **/
package com.jiaoke.serviceImp;

import com.jiaoke.serviceInf.UserManagerServiceInf;
import com.jiaoke.web.dao.UserManagerDao;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

/**
 *  <一句话功能描述>
 *
 * @author: Melone
 * @create: 2019/3/19 18:42
 * @Description:
 */
@Service
public class UserManagerServiceImpl implements UserManagerServiceInf {

    @Resource
    private UserManagerDao userManagerDao;

    @Override
    public int addUser(String userName, String password, String phone) {
        return userManagerDao.insertUser(userName,password,phone);
    }
}
