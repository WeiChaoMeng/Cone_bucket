package com.jiaoke.service;

import com.jiaoke.bean.ProjectMessage;
import org.activiti.engine.task.Task;

import java.util.List;

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

    /**
     * 查询全部工程
     *
     * @return list
     */
    List<ProjectMessage> selectAllData();

    /**
     * 根据主键查询
     *
     * @param id id
     * @return ProjectMessage
     */
    ProjectMessage selectById(Integer id);

    /**
     * 根据主键删除
     *
     * @param id 主键
     * @return 影响行数
     */
    int remove(Integer id);

    /**
     * 根据主键更新
     *
     * @param projectMessage projectMessage
     * @return 影响行数
     */
    int updateById(ProjectMessage projectMessage);

    /**
     * 条件查询
     * @param proName
     * @param proSchedule
     * @param proType
     * @param proStatus
     * @return
     */
    List<ProjectMessage> getProMessageByCondition(String proName, String proSchedule, String proType, String proStatus);
}
