package com.jiaoke.service;

import com.jiaoke.bean.ProjectStatus;
import com.jiaoke.web.dao.ProjectStatusMapper;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * 工程状态
 *
 * @author lihui
 * @version 1.0
 * @date 2019/3/15 15:00
 */
@Service
public class ProjectStatusServiceImpl implements ProjectStatusService {

    @Resource
    private ProjectStatusMapper projectStatusMapper;

    @Override
    public List<ProjectStatus> selectAll() {
        return projectStatusMapper.selectAll();
    }
}
