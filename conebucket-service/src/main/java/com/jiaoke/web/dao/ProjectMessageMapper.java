package com.jiaoke.web.dao;

import com.jiaoke.bean.ProjectMessage;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;
import tk.mybatis.mapper.common.Mapper;

import java.util.List;

/**
 * 工程经纬度表
 *
 * @author lihui
 * @version 1.0
 * @date 2019/3/15 14:34
 */
@Repository
public interface ProjectMessageMapper extends Mapper<ProjectMessage> {

    /**
     * 插入数据并返回主键
     *
     * @param projectMessage projectMessage
     * @return 主键
     */
    int insertReturnPrimaryKey(ProjectMessage projectMessage);

    /**
     * 查询全部数据
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
     * 根据主键更新
     *
     * @param projectMessage projectMessage
     * @return 影响行数
     */
    int updateById(ProjectMessage projectMessage);

    /**
     * 条件查询
     *
     * @param proName proName
     * @param proType proType
     * @return list
     */
    List<ProjectMessage> selectProMessageByCondition(@Param("proName") String proName,
                                                     @Param("proType") String proType);

    /**
     * 根据BusinessKey查询
     *
     * @param id id
     * @return projectMessage
     */
    ProjectMessage selectByBusinessKey(Integer id);

    /**
     * 查询未上报
     *
     * @return list
     */
    List<ProjectMessage> selectNotReported();

    /**
     * 更新工程状态
     *
     * @param id     主键
     * @param status 状态码
     * @return
     */
    int updateProStatus(@Param("id") Integer id, @Param("status") Integer status);
}
