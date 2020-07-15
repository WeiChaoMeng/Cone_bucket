package com.jiaoke.service;

import com.jiaoke.bean.ProjectLog;

import java.util.List;

/**
 * 工程日志
 *
 * @author lihui
 * @version 1.0
 * @date 2019/3/15 15:00
 */
public interface ProjectLogService {

    /**
     * 查询全部
     *
     * @return list
     */
    List<ProjectLog> selectAll();
}
