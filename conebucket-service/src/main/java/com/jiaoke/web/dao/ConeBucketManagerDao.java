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

import java.util.List;
import java.util.Map;

/**
 *  <一句话功能描述>
 *
 * @author: Melone
 * @create: 2019/3/17 21:26
 * @Description:
 */
public interface ConeBucketManagerDao {


    int insertConeBucket(@Param("diseaseNumber") String diseaseNumber, @Param("roadName")String roadName);

    List<Map<String, Object>> selectAllConeBucket();

    int delectConeBucketById(@Param("idArray") String[] idArray);

    List<Map<String, Object>> selectConeBucketByCondition(@Param("cbn")String cbn, @Param("cbt")String cbt);

    Map<String, String> selectGoogleConeBucketById(@Param("deviceId")String deviceId);

    List<Map<String, String>> selectConeBucketLogByConeBucketNum(@Param("coneBucketNum") String coneBucketNum);
}
