/**
 * FileName: LogManagerDao
 * Author:   Melone
 * Date:     2019/3/29 11:12
 * History:
 * <author>    <time>     <version>   <desc>
 * 作者姓名     修改时间    版本号        描述
 **/
package com.jiaoke.web.dao;

import com.jiaoke.bean.LogMessage;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

/**
 *  <一句话功能描述>
 *
 * @author: Melone
 * @create: 2019/3/29 11:12
 * @Description:
 */
public interface LogManagerDao {

    int selectLogDataCount();

    List<LogMessage> selectLogDataByLimte(@Param("pageFirstNum") int pageFirstNum, @Param("eachPageDataNum") int eachPageDataNum);
}
