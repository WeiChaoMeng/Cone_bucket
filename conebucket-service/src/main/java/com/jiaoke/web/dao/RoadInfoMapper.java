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

    /**
     * 根据id查询
     *
     * @param id id
     * @return r
     */
    RoadInfo selectById(String id);

    /**
     * 根据id查询道路id
     *
     * @param coneBucketId coneBucketId
     * @return r
     */
    RoadInfo selectRoadIdById(String coneBucketId);
}
