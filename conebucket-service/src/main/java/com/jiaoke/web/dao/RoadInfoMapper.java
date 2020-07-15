package com.jiaoke.web.dao;

import com.jiaoke.bean.RoadInfo;
import org.springframework.stereotype.Repository;
import tk.mybatis.mapper.common.Mapper;

/**
 * 锥桶路线信息表
 *
 * @author lihui
 * @date 2020-07-10
 */
@Repository
public interface RoadInfoMapper extends Mapper<RoadInfo> {
}
