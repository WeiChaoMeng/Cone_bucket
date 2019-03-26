package com.jiaoke.service;

import com.jiaoke.bean.ProjectSchedule;
import com.jiaoke.web.dao.ProjectScheduleMapper;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * 工程进度
 *
 * @author lihui
 * @version 1.0
 * @date 2019/3/15 15:00
 */
@Service
public class ProjectScheduleServiceImpl implements ProjectScheduleService {

    @Resource
    private ProjectScheduleMapper projectScheduleMapper;

    @Override
    public List<ProjectSchedule> selectAll() {
        return projectScheduleMapper.selectAll();
    }
}
