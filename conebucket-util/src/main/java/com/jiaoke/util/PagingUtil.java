/**
 * FileName: PagingUtil
 * author:   Melone
 * Date:     2019/3/29 11:27
 * History:
 * <author>    <time>     <version>   <desc>
 * 作者姓名     修改时间    版本号        描述
 **/
package com.jiaoke.util;

import javax.servlet.http.HttpServletRequest;

/**
 *  <一句话功能描述>
 *
 * @author: Melone
 * @create: 2019/3/29 11:27
 * @Description:
 */
public class PagingUtil {

    public static String getUrl(HttpServletRequest request) {
        String c = request.getContextPath();
        String q = request.getQueryString();
        String s = request.getServletPath();
        if (q != null && !q.trim().isEmpty()) {
            if (q.contains("currentPageNum=")) {
                int i = q.indexOf("currentPageNum=");
                q = q.substring(0, i);
            }
        }else {
            q ="";
        }
        String url = s + "?" + q;
        return url;
    }

}
