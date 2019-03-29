/**
 * FileName: SyetemLogDao
 * Author:   Melone
 * Date:     2019/3/25 12:32
 * History:
 * <author>    <time>     <version>   <desc>
 * 作者姓名     修改时间    版本号        描述
 **/
package com.jiaoke.web.dao;

import com.hazelcast.spi.annotation.PrivateApi;
import org.apache.ibatis.annotations.Param;

import java.util.Map;

/**
 *  <一句话功能描述>
 *
 * @author: Melone
 * @create: 2019/3/25 12:32
 * @Description:
 */
public interface SyetemLogDao {

    Map<String, String> selectConeBucketLastTimeBydeviceId(@Param("deviceId") String deviceId);

    int insertConeBucketTime(@Param("deviceId") String deviceId, @Param("type") String type,@Param("eventDesc") String eventDesc,@Param("locRoadName") String locRoadName,@Param("startDataTime") String startDataTime,@Param("endDataTime") String endDataTime);

    void updataConeBucketBydeviceId(@Param("id") String id,@Param("endTime") String endTime);
}
