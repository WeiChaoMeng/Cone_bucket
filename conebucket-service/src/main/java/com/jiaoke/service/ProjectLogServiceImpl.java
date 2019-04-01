package com.jiaoke.service;

import com.jiaoke.bean.ProjectLog;
import com.jiaoke.util.DateUtil;
import com.jiaoke.web.dao.ProjectLogMapper;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import javax.xml.crypto.Data;
import java.util.List;

/**
 * 工程日志
 *
 * @author lihui
 * @version 1.0
 * @date 2019/3/15 15:00
 */
@Service
public class ProjectLogServiceImpl implements ProjectLogService {

    @Resource
    private ProjectLogMapper projectLogMapper;

    @Override
    public List<ProjectLog> selectAll() {
        List<ProjectLog> projectLogList = projectLogMapper.selectAll();
        for (ProjectLog projectLog : projectLogList) {
            projectLog.setOperationTimeStr(DateUtil.dateConvertYYYYMMDDHHMMSS(projectLog.getOperationTime()));
        }
        return projectLogList;
    }
}
