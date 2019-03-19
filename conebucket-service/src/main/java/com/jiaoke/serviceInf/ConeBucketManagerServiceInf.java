/**
 * FileName: ConeBucketManagerServiceInf
 * Author:   Melone
 * Date:     2019/3/17 20:52
 * History:
 * <author>    <time>     <version>   <desc>
 * 作者姓名     修改时间    版本号        描述
 **/
package com.jiaoke.serviceInf;

import java.util.List;
import java.util.Map;

/**
 *  <一句话功能描述>
 *
 * @author: Melone
 * @create: 2019/3/17 20:52
 * @Description:
 */
public interface ConeBucketManagerServiceInf {


    int addConeBucket(String diseaseNumber, String roadName);

    List<Map<String, Object>> getAllConeBucket();

    int removeConeBucketById(String[] idArray);

    List<Map<String, Object>> getConeBucketByCondition(String cbn, String cbt);
}
