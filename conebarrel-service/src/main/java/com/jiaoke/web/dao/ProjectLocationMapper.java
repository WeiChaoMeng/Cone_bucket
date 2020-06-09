package com.jiaoke.web.dao;

import com.jiaoke.bean.ProjectLocation;
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
public interface ProjectLocationMapper extends Mapper<ProjectLocation> {

    /**
     * 批量插入
     *
     * @param projectLocation projectLocation
     * @return int
     */
    int insertByBatch(List<ProjectLocation> projectLocation);

    /**
     * 根据工程id查询
     *
     * @param proId 工程id
     * @return list
     */
    List<ProjectLocation> selectByProId(Integer proId);

    /**
     * 根据工程id删除
     *
     * @param proId 工程id
     * @return 影响行数
     */
    int deleteByProId(Integer proId);
}
