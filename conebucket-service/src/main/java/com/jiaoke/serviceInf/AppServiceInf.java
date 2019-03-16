/**
 * FileName: AppServiceInf
 * Author:   Melone
 * Date:     2019/3/16 15:03
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
 * @create: 2019/3/16 15:03
 * @Description:
 */

public interface AppServiceInf {

    List<Map<String, Object>> getProgectByProgresAndproStatus(String progress, String proStatus);

    List<Map<String, Object>> getProLocationsByIdList(List<String> idList);
}
