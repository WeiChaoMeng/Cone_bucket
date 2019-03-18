package com.jiaoke.web.dao;

import com.jiaoke.bean.ProjectMessage;
import org.springframework.stereotype.Repository;
import tk.mybatis.mapper.common.Mapper;

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
}
