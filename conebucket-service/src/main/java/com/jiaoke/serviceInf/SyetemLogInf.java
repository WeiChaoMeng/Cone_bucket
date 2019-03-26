/**
 * FileName: SyetemLogInf
 * Author:   Melone
 * Date:     2019/3/25 12:31
 * History:
 * <author>    <time>     <version>   <desc>
 * 作者姓名     修改时间    版本号        描述
 **/
package com.jiaoke.serviceInf;

import java.util.Map;

/**
 *  <一句话功能描述>
 *
 * @author: Melone
 * @create: 2019/3/25 12:31
 * @Description:
 */
public interface SyetemLogInf {


    Map<String,String> getConeBucketLastTimeBydeviceId(String deviceId);

    int addConeBucketTime(String deviceId, String s, String eventDesc, String locRoadName, String startDataTime, String endDataTime);
}
