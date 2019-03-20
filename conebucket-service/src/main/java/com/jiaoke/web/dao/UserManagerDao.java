/**
 * FileName: UserManagerDao
 * Author:   Melone
 * Date:     2019/3/19 18:49
 * History:
 * <author>    <time>     <version>   <desc>
 * 作者姓名     修改时间    版本号        描述
 **/
package com.jiaoke.web.dao;

import org.apache.ibatis.annotations.Param;

/**
 *  <一句话功能描述>
 *
 * @author: Melone
 * @create: 2019/3/19 18:49
 * @Description:
 */
public interface UserManagerDao {

    int insertUser(@Param("userName") String userName, @Param("password") String password,@Param("phone")  String phone);
}
