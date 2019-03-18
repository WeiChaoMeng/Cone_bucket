/**
 * FileName: ConeBucketManagerDao
 * Author:   Melone
 * Date:     2019/3/17 21:26
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
 * @create: 2019/3/17 21:26
 * @Description:
 */
public interface ConeBucketManagerDao {


    int insertConeBucket(@Param("diseaseNumber") String diseaseNumber, @Param("roadName")String roadName);
}
