package com.jiaoke.service;

import com.jiaoke.bean.ProjectLocation;
import com.jiaoke.web.dao.ProjectLocationMapper;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * 工程经纬度表
 *
 * @author lihui
 * @version 1.0
 * @date 2019/3/15 14:34
 */
@Service
public class ProjectLocationServiceImpl implements ProjectLocationService {

    @Resource
    private ProjectLocationMapper projectLocationMapper;


    public List<ProjectLocation> selectAll() {
        return projectLocationMapper.selectAll();
    }

    public int insert(ProjectLocation projectLocation) {
        return projectLocationMapper.insert(projectLocation);
    }
}
