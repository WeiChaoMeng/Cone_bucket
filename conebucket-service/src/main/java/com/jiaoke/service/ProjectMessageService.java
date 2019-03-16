package com.jiaoke.service;

import com.jiaoke.bean.ProjectMessage;

/**
 * 项目管理
 *
 * @author lihui
 * @version 1.0
 * @date 2019/3/15 14:34
 */
public interface ProjectMessageService {

    /**
     * 选择性插入
     *
     * @param projectMessage projectMessage
     * @return 影响行数
     */
    int insertSelective(ProjectMessage projectMessage);
}
