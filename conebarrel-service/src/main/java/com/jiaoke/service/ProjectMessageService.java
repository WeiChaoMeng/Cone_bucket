package com.jiaoke.service;

import com.jiaoke.bean.ProjectMessage;

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
     *
     * @param proName     proName
     * @param proSchedule proSchedule
     * @param proType     proType
     * @param proStatus   proStatus
     * @return list
     */
    List<ProjectMessage> getProMessageByCondition(String proName, String proSchedule, String proType, String proStatus);

    /**
     * 根据businessKey查询
     *
     * @param ids         idList
     * @param proName     proName
     * @param proSchedule proSchedule
     * @param proType     proType
     * @param proStatus   proStatus
     * @return list
     */
    List<ProjectMessage> selectByBusinessKey(List<Integer> ids, String proName, String proSchedule, String proType, String proStatus);

    /**
     * 更新工程状态
     *
     * @param id     主键
     * @param status 状态码
     * @return
     */
    int updateProStatus(Integer id, Integer status);

    /**
     * 查询未上报
     *
     * @return list
     */
    List<ProjectMessage> selectNotReported();

    /**
     * 根据工程状态统计总数
     *
     * @param status 工程状态
     * @return int
     */
    int count(Integer status);

    /**
     * 更新项目进度
     *
     * @param id       id
     * @param schedule 进度
     * @return int
     */
    int updateProSchedule(Integer id, Integer schedule);
}
