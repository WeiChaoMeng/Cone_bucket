package com.jiaoke.service;

import com.jiaoke.bean.ProjectLocation;

import java.util.List;

/**
 * 工程经纬度表
 *
 * @author lihui
 * @version 1.0
 * @date 2019/3/15 15:00
 */
public interface ProjectLocationService {

    /**
     * 查询全部
     *
     * @return list
     */
    List<ProjectLocation> selectAll();

    /**
     * 插入
     *
     * @return 影响行数
     */
    int insert(ProjectLocation projectLocation);
}
