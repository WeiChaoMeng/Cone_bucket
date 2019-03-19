package com.jiaoke.service;

import com.jiaoke.bean.ConeBucketMessage;

import java.util.List;

/**
 * 锥桶信息
 *
 * @author lihui
 * @version 1.0
 * @date 2019/3/15 15:00
 */
public interface ConeBucketMessageService {

    /**
     * 根据工程id查询锥桶信息
     *
     * @param proId 工程id
     * @return list
     */
    List<ConeBucketMessage> selectByProId(Integer proId);
}
