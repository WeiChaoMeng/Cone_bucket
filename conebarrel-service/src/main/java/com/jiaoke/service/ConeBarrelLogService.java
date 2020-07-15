package com.jiaoke.service;

import com.jiaoke.bean.ConeBarrelLog;

import java.util.List;

/**
 * 锥桶日志
 *
 * @author lihui
 * @version 1.0
 * @date 2019/3/15 15:00
 */
public interface ConeBarrelLogService {

    /**
     * 查询全部
     *
     * @return list
     */
    List<ConeBarrelLog> selectAll();
}
