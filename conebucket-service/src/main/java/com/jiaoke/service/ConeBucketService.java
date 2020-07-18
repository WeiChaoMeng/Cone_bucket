package com.jiaoke.service;

import com.jiaoke.bean.ConeBucket;

import java.util.List;

/**
 * 锥桶管理
 *
 * @author lihui
 */
public interface ConeBucketService {

    /**
     * 添加锥桶
     *
     * @param deviceId       设备ID
     * @param coneBucketType 锥桶类型
     * @return int
     */
    String add(String deviceId, String coneBucketType);

    /**
     * 查询全部数据
     *
     * @return list
     */
    List<ConeBucket> selectAll();

    /**
     * 删除
     *
     * @param deviceId 设备ID
     * @return int
     */
    int delete(String deviceId);

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
     * @param ids ids
     * @return list
     */
    List<ConeBucket> locationById(String[] ids);

    /**
     * 查询所有锥桶位置信息
     *
     * @return list
     */
    List<ConeBucket> allConeBucketPosition();

    /**
     * 更新锥桶信息
     *
     * @return int
     */
    int updateConeBucketInfo();
}
