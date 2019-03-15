package com.jiaoke.service;

import com.jiaoke.bean.ProjectType;

import java.util.List;

/**
 * 工程类型
 *
 * @author lihui
 * @version 1.0
 * @date 2019/3/15 15:00
 */
public interface ProjectTypeService {

    /**
     * 查询全部
     *
     * @return list
     */
    List<ProjectType> selectAll();
}
