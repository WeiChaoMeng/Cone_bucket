package com.jiaoke.web.dao;

import com.jiaoke.bean.ConeBucketMessage;
import org.springframework.stereotype.Repository;
import tk.mybatis.mapper.common.Mapper;

import java.util.List;

/**
 * 锥桶信息
 *
 * @author lihui
 * @version 1.0
 * @date 2019/3/15 14:55
 */
@Repository
public interface ConeBucketMessageMapper extends Mapper<ConeBucketMessage> {

    /**
     * 根据锥桶编号查询
     *
     * @param coneBucketNum 锥桶编号
     * @return ConeBucketMessage
     */
    ConeBucketMessage selectByConeBucketNum(String coneBucketNum);

    /**
     * 插入数据并返回主键
     *
     * @param coneBucketMessage coneBucketMessage
     * @return int
     */
    int insertReturnPrimaryKey(ConeBucketMessage coneBucketMessage);

    /**
     * 根据工程id查询锥桶信息
     *
     * @param proId 工程id
     * @return list
     */
    List<ConeBucketMessage> selectByProId(Integer proId);
}
