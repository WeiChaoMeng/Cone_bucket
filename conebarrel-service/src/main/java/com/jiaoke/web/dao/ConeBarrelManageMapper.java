package com.jiaoke.web.dao;

import com.jiaoke.bean.ConeBarrelManage;
import org.springframework.stereotype.Repository;
import tk.mybatis.mapper.common.Mapper;

import java.util.List;

/**
 * 锥桶管理
 *
 * @author lihui
 * @version 1.0
 * @date 2020-5-7 15:40
 */
@Repository
public interface ConeBarrelManageMapper extends Mapper<ConeBarrelManage> {

    /**
     * 根据设备Id查询
     *
     * @return list
     */
    List<ConeBarrelManage> selectAllDeviceId();

    /**
     * 根据工程id查询锥桶信息
     *
     * @param proId 工程id
     * @return list
     */
    List<ConeBarrelManage> selectByProId(Integer proId);
}
