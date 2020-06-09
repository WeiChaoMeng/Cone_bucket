package com.jiaoke.service;

import com.jiaoke.bean.ConeBarrelManage;

import java.util.List;
import java.util.Map;

/**
 * 锥桶管理
 *
 * @author lihui
 * @version 1.0
 * @date 2020-5-7 15:40
 */
public interface ConeBarrelManageService {

    /**
     * 添加锥桶
     *
     * @param keyWd    key
     * @param platform 服务平台
     * @return map
     */
    Map<String, Object> addConeBarrel(String keyWd, String platform);

    /**
     * 查询全部
     *
     * @return list
     */
    List<ConeBarrelManage> getAll();

    List<ConeBarrelManage> selectAllDeviceId();

    /**
     * 更新锥桶状态
     *
     * @return list
     */
    List<ConeBarrelManage> updateConeBarrelState();
}
