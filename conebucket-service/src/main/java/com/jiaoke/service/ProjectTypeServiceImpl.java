package com.jiaoke.service;

import com.jiaoke.bean.ProjectType;
import com.jiaoke.web.dao.ProjectTypeMapper;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * 工程类型
 *
 * @author lihui
 * @version 1.0
 * @date 2019/3/15 15:00
 */
@Service
public class ProjectTypeServiceImpl implements ProjectTypeService {

    @Resource
    private ProjectTypeMapper projectTypeMapper;


    public List<ProjectType> selectAll() {
        return projectTypeMapper.selectAll();
    }
}
