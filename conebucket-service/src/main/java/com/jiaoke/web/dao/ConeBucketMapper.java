package com.jiaoke.web.dao;

import com.jiaoke.bean.ConeBucket;
import org.springframework.stereotype.Repository;
import tk.mybatis.mapper.common.Mapper;

import java.util.List;

/**
 * 锥桶管理
 *
 * @author lihui
 * @date 2020-07-10
 */
@Repository
public interface ConeBucketMapper extends Mapper<ConeBucket> {

    /**
     * 根据工程id查询锥桶信息
     *
     * @param proId 工程id
     * @return list
     */
    List<ConeBucket> selectByProId(Integer proId);

    /**
     * 根据id查询锥桶位置信息
     *
     * @param id id
     * @return c
     */
    ConeBucket locationById(String id);

    /**
     * 查询所有锥桶位置信息
     *
     * @return list
     */
    List<ConeBucket> allConeBucketPosition();
}
