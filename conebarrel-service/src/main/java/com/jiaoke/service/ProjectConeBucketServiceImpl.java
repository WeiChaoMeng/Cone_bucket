package com.jiaoke.service;

import com.jiaoke.bean.ProjectConeBucket;
import com.jiaoke.web.dao.ProjectConeBucketMapper;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * 工程锥桶信息表
 *
 * @author lihui
 * @version 1.0
 * @date 2019/3/15 14:34
 */
@Service
public class ProjectConeBucketServiceImpl implements ProjectConeBucketService {

    @Resource
    private ProjectConeBucketMapper projectConeBucketMapper;


    public List<ProjectConeBucket> selectAll() {
        return projectConeBucketMapper.selectAll();
    }

    public int insert(ProjectConeBucket projectConeBucket) {
        return projectConeBucketMapper.insert(projectConeBucket);
    }
}
