/**
 * FileName: LogMessage
 * author:   Melone
 * Date:     2019/3/29 11:29
 * History:
 * <author>    <time>     <version>   <desc>
 * 作者姓名     修改时间    版本号        描述
 **/
package com.jiaoke.bean;

import lombok.Data;

/**
 *  <一句话功能描述>
 *
 * @author: Melone
 * @create: 2019/3/29 11:29
 * @Description:
 */
@Data
public class LogMessage {

    private int id;
    private String coneBucketNum;
    private String coneBucketName;
    private String coneBucketStatus;
    private String roadName;
    private String startTime;
    private String endTime;
}
