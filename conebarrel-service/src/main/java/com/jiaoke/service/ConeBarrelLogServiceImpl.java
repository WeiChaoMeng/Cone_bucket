package com.jiaoke.service;

import com.jiaoke.bean.ConeBarrelLog;
import com.jiaoke.web.dao.ConeBarrelLogMapper;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * 锥桶日志
 *
 * @author lihui
 * @version 1.0
 * @date 2019/3/15 15:00
 */
@Service
public class ConeBarrelLogServiceImpl implements ConeBarrelLogService {

    @Resource
    private ConeBarrelLogMapper coneBarrelLogMapper;

    @Override
    public List<ConeBarrelLog> selectAll() {
        return coneBarrelLogMapper.selectAll();
    }
}
