/**
 * FileName: LogManagerInf
 * Author:   Melone
 * Date:     2019/3/29 11:10
 * History:
 * <author>    <time>     <version>   <desc>
 * 作者姓名     修改时间    版本号        描述
 **/
package com.jiaoke.serviceInf;

import com.jiaoke.bean.LogMessage;
import com.jiaoke.bean.PageBean;

import java.util.List;
import java.util.Map;

/**
 *  <一句话功能描述>
 *
 * @author: Melone
 * @create: 2019/3/29 11:10
 * @Description:
 */
public interface LogManagerInf {


    PageBean<LogMessage> getAllConeBucketLog(int i, String url);
}
