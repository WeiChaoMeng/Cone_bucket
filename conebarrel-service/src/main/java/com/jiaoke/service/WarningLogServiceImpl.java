package com.jiaoke.service;

import com.jiaoke.bean.WarningLog;
import com.jiaoke.util.DateUtil;
import com.jiaoke.web.dao.WarningLogMapper;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * 预警日志
 *
 * @author lihui
 * @version 1.0
 * @date 2019/3/15 15:00
 */
@Service
public class WarningLogServiceImpl implements WarningLogService {

    @Resource
    private WarningLogMapper warningLogMapper;

    @Override
    public List<WarningLog> selectAll() {
        List<WarningLog> warningLogList = warningLogMapper.selectAll();
        for (WarningLog warningLog : warningLogList) {
            warningLog.setOperationTimeStr(DateUtil.dateConvertYYYYMMDDHHMMSS(warningLog.getOperationTime()));
        }
        return warningLogList;
    }
}
