package com.jiaoke.web.dao;

import com.jiaoke.bean.WarningLog;
import org.springframework.stereotype.Repository;
import tk.mybatis.mapper.common.Mapper;

/**
 * 预警日志
 *
 * @author lihui
 * @version 1.0
 * @date 2019/3/15 14:55
 */
@Repository
public interface WarningLogMapper extends Mapper<WarningLog> {
}
