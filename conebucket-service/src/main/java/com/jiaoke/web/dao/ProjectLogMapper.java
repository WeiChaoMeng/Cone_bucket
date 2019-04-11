package com.jiaoke.web.dao;

import com.jiaoke.bean.ProjectLog;
import org.springframework.stereotype.Repository;
import tk.mybatis.mapper.common.Mapper;

import java.util.List;

/**
 * 项目日志
 *
 * @author lihui
 * @version 1.0
 * @date 2019/3/15 14:55
 */
@Repository
public interface ProjectLogMapper extends Mapper<ProjectLog> {

    /**
     * 查询所有数据
     *
     * @return list
     */
    List<ProjectLog> selectAllData();
}
