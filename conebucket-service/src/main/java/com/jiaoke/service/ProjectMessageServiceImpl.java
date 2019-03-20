package com.jiaoke.service;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.jiaoke.bean.ConeBucketMessage;
import com.jiaoke.bean.ProjectConeBucket;
import com.jiaoke.bean.ProjectLocation;
import com.jiaoke.bean.ProjectMessage;
import com.jiaoke.util.DateUtil;
import com.jiaoke.util.RandomUtil;
import com.jiaoke.web.dao.ConeBucketMessageMapper;
import com.jiaoke.web.dao.ProjectConeBucketMapper;
import com.jiaoke.web.dao.ProjectLocationMapper;
import com.jiaoke.web.dao.ProjectMessageMapper;
import org.activiti.engine.task.Task;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

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

    @Resource
    private ProjectConeBucketMapper projectConeBucketMapper;

    @Resource
    private ProjectLocationMapper projectLocationMapper;

    @Resource
    private ConeBucketMessageMapper coneBucketMessageMapper;

    @Override
    public int insertSelective(ProjectMessage projectMessage) {
        //设置工程编号
        projectMessage.setProNum(RandomUtil.random());
        projectMessage.setProStartTime(DateUtil.stringConvertYYYYMMDD(projectMessage.getProStartTimeStr()));
        projectMessage.setProEndTime(DateUtil.stringConvertYYYYMMDD(projectMessage.getProEndTimeStr()));
        projectMessage.setProStatus(0);
        projectMessage.setProSchedule(0);

        //插入工程并返回主键
        int projectMessageInsertReturn = projectMessageMapper.insertReturnPrimaryKey(projectMessage);
        if (projectMessageInsertReturn < 0) {
            return 0;
        }


        //插入工程经纬度表
        List<ProjectLocation> list = new ArrayList<ProjectLocation>();
        JSONArray jsonArray = JSON.parseArray(projectMessage.getProScope());
        for (int i = 0; i < jsonArray.size(); i++) {
            JSONObject parseObject = JSON.parseObject(jsonArray.get(i).toString());

            ProjectLocation projectLocation = new ProjectLocation();
            projectLocation.setProId(projectMessage.getId());
            projectLocation.setLatitude(parseObject.getString("lat"));
            projectLocation.setLongitude(parseObject.getString("lng"));
            list.add(projectLocation);
        }

        int projectLocationInsert = projectLocationMapper.insertByBatch(list);
        if (projectLocationInsert < 0) {
            return 0;
        }

        //插入工程锥桶信息表，2表示有锥桶
        if (projectMessage.getContainConeBucket() == 2) {
            //拆分录入的锥桶编号
            String coneBucketNum = projectMessage.getConeBucketNum();
            String[] strings = coneBucketNum.split(",");
            for (int i = 0; i < strings.length; i++) {
                //查询锥桶是否已经存在
                ConeBucketMessage coneBucket = coneBucketMessageMapper.selectByConeBucketNum(strings[i]);

                //不存在则将锥桶录入锥桶管理表
                if (coneBucket == null) {
                    //插入锥桶信息表并返回主键
                    ConeBucketMessage coneBucketMessage = new ConeBucketMessage();
                    coneBucketMessage.setConeBucketType(projectMessage.getConeBucketType());
                    coneBucketMessage.setConeBucketNum(strings[i]);
                    coneBucketMessage.setCreateTime(new Date());
                    int coneBucketMessageInsert = coneBucketMessageMapper.insertReturnPrimaryKey(coneBucketMessage);
                    if (coneBucketMessageInsert < 0) {
                        return 0;
                    }


                    //插入工程锥桶表
                    ProjectConeBucket projectConeBucket = new ProjectConeBucket();
                    projectConeBucket.setProId(projectMessage.getId());
                    projectConeBucket.setConeBucketId(coneBucketMessage.getId());
                    int projectConeBucketInsert = projectConeBucketMapper.insert(projectConeBucket);
                    if (projectConeBucketInsert < 0) {
                        return 0;
                    }

                } else {
                    //如果存在直接插入工程锥桶表
                    ProjectConeBucket projectConeBucket = new ProjectConeBucket();
                    projectConeBucket.setProId(projectMessage.getId());
                    projectConeBucket.setConeBucketId(coneBucket.getId());
                    int projectConeBucketinsert = projectConeBucketMapper.insert(projectConeBucket);
                    if (projectConeBucketinsert < 0) {
                        return 0;
                    }
                }
            }
        }
        return 1;
    }

    @Override
    public List<ProjectMessage> selectAllData() {
        List<ProjectMessage> projectMessageList = projectMessageMapper.selectAllData();
        for (ProjectMessage projectMessage : projectMessageList) {
            projectMessage.setProStartTimeStr(DateUtil.dateConvertYYYYMMDD(projectMessage.getProStartTime()));
            projectMessage.setProEndTimeStr(DateUtil.dateConvertYYYYMMDD(projectMessage.getProEndTime()));
        }
        return projectMessageList;
    }

    @Override
    public ProjectMessage selectById(Integer id) {
        ProjectMessage projectMessage = projectMessageMapper.selectById(id);
        projectMessage.setProStartTimeStr(DateUtil.dateConvertYYYYMMDD(projectMessage.getProStartTime()));
        projectMessage.setProEndTimeStr(DateUtil.dateConvertYYYYMMDD(projectMessage.getProEndTime()));
        return projectMessage;
    }

    @Override
    public int remove(Integer id) {
        //删除工程信息
        int projectMessage = projectMessageMapper.deleteByPrimaryKey(id);
        if (projectMessage >= 0) {
            //删除工程锥桶关联表
            projectConeBucketMapper.deleteByProId(id);
            //删除工程经纬度表
            projectConeBucketMapper.deleteByProId(id);
            return 1;
        }
        return -1;
    }

    @Override
    public int updateById(ProjectMessage projectMessage) {
        projectMessage.setProStartTime(DateUtil.stringConvertYYYYMMDD(projectMessage.getProStartTimeStr()));
        projectMessage.setProEndTime(DateUtil.stringConvertYYYYMMDD(projectMessage.getProEndTimeStr()));

        //更新工程信息表
        if (projectMessageMapper.updateById(projectMessage) < 0) {
            return -1;
        }

        //删除工程关联的锥桶表
        if (projectConeBucketMapper.deleteByProId(projectMessage.getId()) < 0) {
            return -1;
        }

        //拆分录入的锥桶编号
        String coneBucketNum = projectMessage.getConeBucketNum();
        String[] strings = coneBucketNum.split(",");
        for (int i = 0; i < strings.length; i++) {
            //查询锥桶是否已经存在
            ConeBucketMessage coneBucket = coneBucketMessageMapper.selectByConeBucketNum(strings[i]);

            //不存在则将锥桶录入锥桶管理表
            if (coneBucket == null) {
                //插入锥桶信息表并返回主键
                ConeBucketMessage coneBucketMessage = new ConeBucketMessage();
                coneBucketMessage.setConeBucketType(projectMessage.getConeBucketType());
                coneBucketMessage.setConeBucketNum(strings[i]);
                coneBucketMessage.setCreateTime(new Date());
                int coneBucketMessageInsert = coneBucketMessageMapper.insertReturnPrimaryKey(coneBucketMessage);
                if (coneBucketMessageInsert < 0) {
                    return -1;
                }

                //插入工程锥桶表
                ProjectConeBucket projectConeBucket = new ProjectConeBucket();
                projectConeBucket.setProId(projectMessage.getId());
                projectConeBucket.setConeBucketId(coneBucketMessage.getId());
                int projectConeBucketInsert = projectConeBucketMapper.insert(projectConeBucket);
                if (projectConeBucketInsert < 0) {
                    return -1;
                }

            } else {
                //如果存在直接插入工程锥桶表
                ProjectConeBucket projectConeBucket = new ProjectConeBucket();
                projectConeBucket.setProId(projectMessage.getId());
                projectConeBucket.setConeBucketId(coneBucket.getId());
                int projectConeBucketinsert = projectConeBucketMapper.insert(projectConeBucket);
                if (projectConeBucketinsert < 0) {
                    return -1;
                }
            }
        }

        return 1;
    }

    @Override
    public ProjectMessage selectByBusinessKey(Integer id) {
        ProjectMessage projectMessage = projectMessageMapper.selectByBusinessKey(id);
        projectMessage.setProStartTimeStr(DateUtil.dateConvertYYYYMMDD(projectMessage.getProStartTime()));
        projectMessage.setProEndTimeStr(DateUtil.dateConvertYYYYMMDD(projectMessage.getProEndTime()));
        return projectMessage;
    }
}
