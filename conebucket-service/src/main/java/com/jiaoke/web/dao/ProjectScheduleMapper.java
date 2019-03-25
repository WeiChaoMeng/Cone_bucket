package com.jiaoke.web.dao;

import com.jiaoke.bean.ProjectSchedule;
import org.springframework.stereotype.Repository;
import tk.mybatis.mapper.common.Mapper;

/**
 * 工程进度
 *
 * @author lihui
 * @version 1.0
 * @date 2019/3/15 14:55
 */
@Repository
public interface ProjectScheduleMapper extends Mapper<ProjectSchedule> {

}
