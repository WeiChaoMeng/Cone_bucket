package com.jiaoke.service;

import com.jiaoke.bean.ConeBucketType;

import java.util.List;

/**
 * 锥桶类型
 *
 * @author lihui
 * @version 1.0
 * @date 2019/3/15 15:00
 */
public interface ConeBucketTypeService {

    /**
     * 查询全部
     *
     * @return list
     */
    List<ConeBucketType> selectAll();
}
