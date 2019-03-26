package com.jiaoke.web.dao;

import com.jiaoke.bean.ProjectStatus;
import org.springframework.stereotype.Repository;
import tk.mybatis.mapper.common.Mapper;

/**
 * 工程状态
 *
 * @author lihui
 * @version 1.0
 * @date 2019/3/15 14:55
 */
@Repository
public interface ProjectStatusMapper extends Mapper<ProjectStatus> {

}
