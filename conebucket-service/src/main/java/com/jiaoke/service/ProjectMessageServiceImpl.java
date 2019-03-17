package com.jiaoke.service;

import com.jiaoke.bean.ProjectMessage;
import com.jiaoke.web.dao.ProjectMessageMapper;
import com.jiaoke.util.DateUtil;
import com.jiaoke.util.RandomUtil;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

/**
 * 项目管理
 *
 * @author lihui
 * @version 1.0
 * @date 2019/3/15 14:34
 */
@Service
public class ProjectMessageServiceImpl implements ProjectMessageService {

    @Resource
    private ProjectMessageMapper projectMessageMapper;


    public int insertSelective(ProjectMessage projectMessage) {
        //设置工程编号
        projectMessage.setProNum(RandomUtil.random());
        projectMessage.setProStartTime(DateUtil.stringConvertYYYYMMDD(projectMessage.getProStartTimeStr()));
        projectMessage.setProEndTime(DateUtil.stringConvertYYYYMMDD(projectMessage.getProEndTimeStr()));

        return projectMessageMapper.insertSelective(projectMessage);
    }
}
