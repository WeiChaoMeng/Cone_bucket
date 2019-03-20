/**
 * FileName: UserManagerServiceInf
 * Author:   Melone
 * Date:     2019/3/19 18:42
 * History:
 * <author>    <time>     <version>   <desc>
 * 作者姓名     修改时间    版本号        描述
 **/
package com.jiaoke.serviceInf;

/**
 *  <一句话功能描述>
 *
 * @author: Melone
 * @create: 2019/3/19 18:42
 * @Description:
 */
public interface UserManagerServiceInf {

    /**
     *
     * 功能描述: <br>
     *  <添加用户>
     * @param
     * @return
     * @auther Melone
     * @date 2019/3/19 19:21
     */
    int addUser(String userName,String password,String phone);
}
