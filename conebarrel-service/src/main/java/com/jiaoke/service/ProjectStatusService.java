package com.jiaoke.service;

import com.jiaoke.bean.ProjectStatus;

import java.util.List;

/**
 * 工程状态
 *
 * @author lihui
 * @version 1.0
 * @date 2019/3/15 15:00
 */
public interface ProjectStatusService {

    /**
     * 查询全部
     *
     * @return list
     */
    List<ProjectStatus> selectAll();
}
