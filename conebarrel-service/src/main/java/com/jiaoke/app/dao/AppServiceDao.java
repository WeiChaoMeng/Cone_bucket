/**
 * FileName: AppServiceDao
 * Author:   Melone
 * Date:     2019/3/16 15:10
 * History:
 * <author>    <time>     <version>   <desc>
 * 作者姓名     修改时间    版本号        描述
 **/
package com.jiaoke.app.dao;

import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

/**
 *  <一句话功能描述>
 *
 * @author: Melone
 * @create: 2019/3/16 15:10
 * @Description:
 */

public interface AppServiceDao {

    List<Map<String, Object>> selectProgectByProgresAndproStatus(@Param("progress") String progress, @Param("proStatus") String proStatus);

    List<Map<String, Object>> selectProLocationsByIdList(@Param("idList") List<String> idList);
}
