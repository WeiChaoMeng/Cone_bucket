package com.jiaoke.service;

import com.jiaoke.bean.ProjectConeBucket;

import java.util.List;

/**
 * 工程锥桶信息表
 *
 * @author lihui
 * @version 1.0
 * @date 2019/3/15 15:00
 */
public interface ProjectConeBucketService {

    /**
     * 查询全部
     *
     * @return list
     */
    List<ProjectConeBucket> selectAll();

    /**
     * 插入
     *
     * @return 影响行数
     */
    int insert(ProjectConeBucket projectConeBucket);
}
