package com.jiaoke.web.dao;

import com.jiaoke.bean.ProjectConeBucket;
import org.springframework.stereotype.Repository;
import tk.mybatis.mapper.common.Mapper;

/**
 * 工程锥桶信息表
 *
 * @author lihui
 * @version 1.0
 * @date 2019/3/15 14:34
 */
@Repository
public interface ProjectConeBucketMapper extends Mapper<ProjectConeBucket> {

    /**
     * 根据工程id删除
     *
     * @param proId 工程id
     * @return 影响函数
     */
    int deleteByProId(Integer proId);
}
