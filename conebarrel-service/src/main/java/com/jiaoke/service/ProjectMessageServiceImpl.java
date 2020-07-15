package com.jiaoke.service;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.jiaoke.bean.*;
import com.jiaoke.util.DateUtil;
import com.jiaoke.util.RandomUtil;
import com.jiaoke.web.dao.*;
import org.apache.shiro.SecurityUtils;
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
    private ProjectBarrelMapper getProjectBarrelMapper;

    @Resource
    private ProjectBarrelMapper projectBarrelMapper;

    @Resource
    private ProjectLocationMapper projectLocationMapper;

    @Resource
    private ConeBucketMessageMapper coneBucketMessageMapper;

    @Resource
    private ProjectLogMapper projectLogMapper;

    @Override
    public int insertSelective(ProjectMessage projectMessage) {
        //添加工程成功后工程日志记录
//        ProjectLog projectLog = new ProjectLog();
//        UserInfo userInfo = (UserInfo) SecurityUtils.getSubject().getPrincipal();
//        projectLog.setOperationUser(userInfo.getUsername());
//        projectLog.setLogType("新增工程");
//        projectLog.setLogContent(projectMessage.getProName());
//        projectLog.setOperationTime(new Date());


        //设置工程编号
        projectMessage.setProNum(RandomUtil.random());
        projectMessage.setProStartTime(DateUtil.stringConvertYYYYMMDD(projectMessage.getProStartTimeStr()));
        projectMessage.setProEndTime(DateUtil.stringConvertYYYYMMDD(projectMessage.getProEndTimeStr()));
        projectMessage.setProStatus(0);
        projectMessage.setProSchedule(0);

        //插入工程并返回主键
        int projectMessageInsertReturn = projectMessageMapper.insertReturnPrimaryKey(projectMessage);
//        if (projectMessageInsertReturn < 0) {
//            //插入工程日志
//            projectLog.setState("失败");
//            projectLogMapper.insertSelective(projectLog);
//            return 0;
//        }
//        //插入工程日志
//        projectLog.setState("成功");
//        projectLogMapper.insertSelective(projectLog);

        if (!"".equals(projectMessage.getProScope())) {
            //插入工程经纬度表
            List<ProjectLocation> list = new ArrayList<>();
            JSONArray jsonArray = JSON.parseArray(projectMessage.getProScope());
            for (int i = 0; i < jsonArray.size(); i++) {
                JSONObject parseObject = JSON.parseObject(jsonArray.get(i).toString());

                ProjectLocation projectLocation = new ProjectLocation();
                projectLocation.setProId(projectMessage.getId());
                projectLocation.setLatitude(parseObject.getString("lat"));
                projectLocation.setLongitude(parseObject.getString("lon"));
                list.add(projectLocation);
            }

            int projectLocationInsert = projectLocationMapper.insertByBatch(list);
            if (projectLocationInsert < 0) {
                return 0;
            }
        }

        //插入工程锥桶信息表，2表示有锥桶
        if (projectMessage.getContainConeBucket() == 2){
            String coneBucketNum = projectMessage.getConeBucketNum();
            if (!"".equals(coneBucketNum)){
                if (coneBucketNum.contains(",")){
                    String[] split = coneBucketNum.split(",");
                    for (String s : split) {
                        ProjectBarrel projectBarrel = new ProjectBarrel();
                        projectBarrel.setProId(projectMessage.getId());
                        projectBarrel.setConeBarrelId(s);
                        int projectBarrelInsert = projectBarrelMapper.insertSelective(projectBarrel);
                        if (projectBarrelInsert < 0) {
                            return 0;
                        }
                    }

                }else {
                    ProjectBarrel projectBarrel = new ProjectBarrel();
                    projectBarrel.setProId(projectMessage.getId());
                    projectBarrel.setConeBarrelId(coneBucketNum);
                    int projectBarrelInsert = projectBarrelMapper.insertSelective(projectBarrel);
                    if (projectBarrelInsert < 0) {
                        return 0;
                    }
                }
            }
        }

        //插入工程锥桶信息表，2表示有锥桶
//        if (projectMessage.getContainConeBucket() == 2) {
//            //拆分录入的锥桶编号
//            String coneBucketNum = projectMessage.getConeBucketNum();
//            String[] strings = coneBucketNum.split(",");
//            for (int i = 0; i < strings.length; i++) {
//                //查询锥桶是否已经存在
//                ConeBucketMessage coneBucket = coneBucketMessageMapper.selectByConeBucketNum(strings[i]);
//
//                //不存在则将锥桶录入锥桶管理表
//                if (coneBucket == null) {
//                    //插入锥桶信息表并返回主键
//                    ConeBucketMessage coneBucketMessage = new ConeBucketMessage();
//                    coneBucketMessage.setConeBucketType(projectMessage.getConeBucketType());
//                    coneBucketMessage.setConeBucketNum(strings[i]);
//                    coneBucketMessage.setCreateTime(new Date());
//                    int coneBucketMessageInsert = coneBucketMessageMapper.insertReturnPrimaryKey(coneBucketMessage);
//                    if (coneBucketMessageInsert < 0) {
//                        return 0;
//                    }
//
//
//                    //插入工程锥桶表
//                    ProjectConeBucket projectConeBucket = new ProjectConeBucket();
//                    projectConeBucket.setProId(projectMessage.getId());
//                    projectConeBucket.setConeBucketId(coneBucketMessage.getId());
//                    int projectConeBucketInsert = projectConeBucketMapper.insert(projectConeBucket);
//                    if (projectConeBucketInsert < 0) {
//                        return 0;
//                    }
//
//                } else {
//                    //如果存在直接插入工程锥桶表
//                    ProjectConeBucket projectConeBucket = new ProjectConeBucket();
//                    projectConeBucket.setProId(projectMessage.getId());
//                    projectConeBucket.setConeBucketId(coneBucket.getId());
//                    int projectConeBucketinsert = projectConeBucketMapper.insert(projectConeBucket);
//                    if (projectConeBucketinsert < 0) {
//                        return 0;
//                    }
//                }
//            }
//        }
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
        //添加工程成功后工程日志记录
        String projectName = projectMessageMapper.selectProjectName(id);
//        ProjectLog projectLog = new ProjectLog();
//        UserInfo userInfo = (UserInfo) SecurityUtils.getSubject().getPrincipal();
//        projectLog.setOperationUser(userInfo.getUsername());
//        projectLog.setLogType("删除工程");
//        projectLog.setLogContent(projectName);
//        projectLog.setOperationTime(new Date());

        //删除工程信息
        int deleteProject = projectMessageMapper.deleteByPrimaryKey(id);
        if (deleteProject >= 0) {
//            projectLog.setState("成功");
//            projectLogMapper.insertSelective(projectLog);

            //删除工程锥桶关联表
            getProjectBarrelMapper.deleteByProId(id);
            //删除工程经纬度表
            projectLocationMapper.deleteByProId(id);
            return 1;
        }
//        projectLog.setState("失败");
//        projectLogMapper.insertSelective(projectLog);
        return -1;
    }

    @Override
    public int updateById(ProjectMessage projectMessage) {
        projectMessage.setProStartTime(DateUtil.stringConvertYYYYMMDD(projectMessage.getProStartTimeStr()));
        projectMessage.setProEndTime(DateUtil.stringConvertYYYYMMDD(projectMessage.getProEndTimeStr()));

        //工程日志
//        ProjectLog projectLog = new ProjectLog();
//        UserInfo userInfo = (UserInfo) SecurityUtils.getSubject().getPrincipal();
//        projectLog.setOperationUser(userInfo.getUsername());
//        projectLog.setLogType("修改工程");
//        projectLog.setLogContent(projectMessage.getProName());
//        projectLog.setOperationTime(new Date());
        //更新工程信息表
        if (projectMessageMapper.updateById(projectMessage) < 0) {
//            projectLog.setState("失败");
//            projectLogMapper.insertSelective(projectLog);
            return -1;
        }
//        projectLog.setState("成功");
//        projectLogMapper.insertSelective(projectLog);

        //删除工程经纬度表信息
        if (projectLocationMapper.deleteByProId(projectMessage.getId()) < 0) {
            return -1;
        }

        //插入工程经纬度表
        if (!"".equals(projectMessage.getProScope())) {
            List<ProjectLocation> list = new ArrayList<>();
            JSONArray jsonArray = JSON.parseArray(projectMessage.getProScope());
            for (int i = 0; i < jsonArray.size(); i++) {
                JSONObject parseObject = JSON.parseObject(jsonArray.get(i).toString());
                ProjectLocation projectLocation = new ProjectLocation();
                projectLocation.setProId(projectMessage.getId());
                projectLocation.setLatitude(parseObject.getString("lat"));
                projectLocation.setLongitude(parseObject.getString("lon"));
                list.add(projectLocation);
            }

            int projectLocationInsert = projectLocationMapper.insertByBatch(list);
            if (projectLocationInsert < 0) {
                return -1;
            }
        }

        //删除工程关联的锥桶表
        if (projectBarrelMapper.deleteByProId(projectMessage.getId()) < 0) {
            return -1;
        }

        //如果锥桶编号为空直接返回修改成功
        if ("".equals(projectMessage.getConeBucketNum())){
            return 1;
        }

        //插入工程锥桶信息表，2表示有锥桶
        String coneBucketNum = projectMessage.getConeBucketNum();
        if (!"".equals(coneBucketNum)){
            if (coneBucketNum.contains(",")){
                String[] split = coneBucketNum.split(",");
                for (String s : split) {
                    ProjectBarrel projectBarrel = new ProjectBarrel();
                    projectBarrel.setProId(projectMessage.getId());
                    projectBarrel.setConeBarrelId(s);
                    int projectBarrelInsert = projectBarrelMapper.insertSelective(projectBarrel);
                    if (projectBarrelInsert < 0) {
                        return 0;
                    }
                }

            }else {
                ProjectBarrel projectBarrel = new ProjectBarrel();
                projectBarrel.setProId(projectMessage.getId());
                projectBarrel.setConeBarrelId(coneBucketNum);
                int projectBarrelInsert = projectBarrelMapper.insertSelective(projectBarrel);
                if (projectBarrelInsert < 0) {
                    return 0;
                }
            }
        }



        //拆分录入的锥桶编号
//        String coneBucketNum = projectMessage.getConeBucketNum();
//        String[] strings = coneBucketNum.split(",");
//        for (int i = 0; i < strings.length; i++) {
//            //查询锥桶是否已经存在
//            ConeBucketMessage coneBucket = coneBucketMessageMapper.selectByConeBucketNum(strings[i]);
//
//            //不存在则将锥桶录入锥桶管理表
//            if (coneBucket == null) {
//                //插入锥桶信息表并返回主键
//                ConeBucketMessage coneBucketMessage = new ConeBucketMessage();
//                coneBucketMessage.setConeBucketType(projectMessage.getConeBucketType());
//                coneBucketMessage.setConeBucketNum(strings[i]);
//                coneBucketMessage.setCreateTime(new Date());
//                int coneBucketMessageInsert = coneBucketMessageMapper.insertReturnPrimaryKey(coneBucketMessage);
//                if (coneBucketMessageInsert < 0) {
//                    return -1;
//                }
//
//                //插入工程锥桶表
//                ProjectConeBucket projectConeBucket = new ProjectConeBucket();
//                projectConeBucket.setProId(projectMessage.getId());
//                projectConeBucket.setConeBucketId(coneBucketMessage.getId());
//                int projectConeBucketInsert = projectConeBucketMapper.insert(projectConeBucket);
//                if (projectConeBucketInsert < 0) {
//                    return -1;
//                }
//
//            } else {
//                //更新锥桶信息
//                coneBucket.setConeBucketType(projectMessage.getConeBucketType());
//                coneBucketMessageMapper.updateByPrimaryKeySelective(coneBucket);
//                //如果存在直接插入工程锥桶表
//                ProjectConeBucket projectConeBucket = new ProjectConeBucket();
//                projectConeBucket.setProId(projectMessage.getId());
//                projectConeBucket.setConeBucketId(coneBucket.getId());
//                int projectConeBucketinsert = projectConeBucketMapper.insert(projectConeBucket);
//                if (projectConeBucketinsert < 0) {
//                    return -1;
//                }
//            }
//        }

        return 1;
    }

    @Override
    public List<ProjectMessage> getProMessageByCondition(String proName, String proSchedule, String proType, String proStatus) {

        List<ProjectMessage> projectMessageList = projectMessageMapper.selectProMessageByCondition(proName, proSchedule, proType, proStatus);
        for (ProjectMessage projectMessage : projectMessageList) {
            projectMessage.setProStartTimeStr(DateUtil.dateConvertYYYYMMDD(projectMessage.getProStartTime()));
            projectMessage.setProEndTimeStr(DateUtil.dateConvertYYYYMMDD(projectMessage.getProEndTime()));
        }
        return projectMessageList;
    }

    @Override
    public List<ProjectMessage> selectByBusinessKey(List<Integer> ids, String proName, String proSchedule, String proType, String proStatus) {
        List<ProjectMessage> projectMessageList = projectMessageMapper.selectByBusinessKey(ids, proName, proSchedule, proType, proStatus);
        if (projectMessageList != null) {
            for (ProjectMessage projectMessage : projectMessageList) {
                projectMessage.setProStartTimeStr(DateUtil.dateConvertYYYYMMDD(projectMessage.getProStartTime()));
                projectMessage.setProEndTimeStr(DateUtil.dateConvertYYYYMMDD(projectMessage.getProEndTime()));
            }
        }
        return projectMessageList;
    }

    @Override
    public int updateProStatus(Integer id, Integer status) {
//        //工程日志记录
//        ProjectLog projectLog = new ProjectLog();
//        //查询工程名称
//        String projectName = projectMessageMapper.selectProjectName(id);
//        projectLog.setLogContent(projectName);
//        //当前登录人
//        UserInfo userInfo = (UserInfo) SecurityUtils.getSubject().getPrincipal();
//        projectLog.setOperationUser(userInfo.getUsername());
//        if (status == 1) {
//            projectLog.setLogType("施工上报");
//        } else if (status == 2) {
//            projectLog.setLogType("内部审批");
//        }
//        projectLog.setOperationTime(new Date());
//        projectLog.setState("成功");
//        projectLogMapper.insertSelective(projectLog);
        return projectMessageMapper.updateProStatus(id, status);
    }

    @Override
    public List<ProjectMessage> selectNotReported() {
        List<ProjectMessage> projectMessageList = projectMessageMapper.selectNotReported();
        for (ProjectMessage projectMessage : projectMessageList) {
            projectMessage.setProStartTimeStr(DateUtil.dateConvertYYYYMMDD(projectMessage.getProStartTime()));
            projectMessage.setProEndTimeStr(DateUtil.dateConvertYYYYMMDD(projectMessage.getProEndTime()));
        }
        return projectMessageList;
    }

    @Override
    public int count(Integer status) {
        return projectMessageMapper.count(status);
    }

    @Override
    public int updateProSchedule(Integer id, Integer schedule) {
        //工程日志记录
//        ProjectLog projectLog = new ProjectLog();
        //查询工程名称
//        String projectName = projectMessageMapper.selectProjectName(id);
//        projectLog.setLogContent(projectName);
        //当前登录人
//        UserInfo userInfo = (UserInfo) SecurityUtils.getSubject().getPrincipal();
//        projectLog.setOperationUser(userInfo.getUsername());
//        if (schedule == 1) {
////            projectLog.setLogType("工程进场");
//        } else if (schedule == 2) {
////            projectLog.setLogType("工程完工");
//        }
//        projectLog.setOperationTime(new Date());
//        projectLog.setState("成功");
//        projectLogMapper.insertSelective(projectLog);
        return projectMessageMapper.updateProSchedule(id, schedule);
    }
}
