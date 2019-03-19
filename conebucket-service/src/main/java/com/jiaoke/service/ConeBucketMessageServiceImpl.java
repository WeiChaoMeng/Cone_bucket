package com.jiaoke.service;

import com.jiaoke.bean.ConeBucketMessage;
import com.jiaoke.web.dao.ConeBucketMessageMapper;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * 锥桶信息
 *
 * @author lihui
 * @version 1.0
 * @date 2019/3/15 15:00
 */
@Service
public class ConeBucketMessageServiceImpl implements ConeBucketMessageService {

    @Resource
    private ConeBucketMessageMapper coneBucketMessageMapper;


    public List<ConeBucketMessage> selectByProId(Integer proId) {
        return coneBucketMessageMapper.selectByProId(proId);
    }
}
