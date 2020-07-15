package com.jiaoke.service;

import com.jiaoke.bean.ProjectSchedule;

import java.util.List;

/**
 * 工程进度
 *
 * @author lihui
 * @version 1.0
 * @date 2019/3/15 15:00
 */
public interface ProjectScheduleService {

    /**
     * 查询全部
     *
     * @return list
     */
    List<ProjectSchedule> selectAll();
}
