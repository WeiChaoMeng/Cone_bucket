package com.jiaoke.service;

import com.jiaoke.bean.ConeBucketType;
import com.jiaoke.web.dao.ConeBucketTypeMapper;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * 锥桶类型
 *
 * @author lihui
 * @version 1.0
 * @date 2019/3/15 15:00
 */
@Service
public class ConeBucketTypeServiceImpl implements ConeBucketTypeService {

    @Resource
    private ConeBucketTypeMapper coneBucketTypeMapper;


    public List<ConeBucketType> selectAll() {
        return coneBucketTypeMapper.selectAll();
    }
}
