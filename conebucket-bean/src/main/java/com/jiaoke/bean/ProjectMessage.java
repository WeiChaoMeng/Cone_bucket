package com.jiaoke.bean;

import javax.persistence.*;
import java.util.Date;
import java.util.List;

/**
 * 项目管理
 *
 * @author lihui
 * @version 1.0
 * @date 2019/3/15 14:12
 */
@Table(name = "project_message")
public class ProjectMessage {

    /**
     * 主键
     */
    @Id
    @Column(name = "id")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    /**
     * 工程名称
     */
    private String proName;

    /*----关联project_type----*/
    /**
     * 工程类型
     */
    private Integer proType;
    @Transient
    private String proTypeStr;

    /**
     * 工程编号
     */
    private String proNum;

    /**
     * 监理单位
     */
    private String supervisorUnit;

    /**
     * 监理单位电话
     */
    private String supervisorUnitPhone;

    /**
     * 施工单位
     */
    private String constructionUnit;

    /**
     * 施工单位电话
     */
    private String constructionUnitPhone;

    /**
     * 主管单位
     */
    private String governorUnit;

    /**
     * 主管单位电话
     */
    private String governorUnitPhone;

    /**
     * 工程进度
     */
    @Transient
    private Integer proSchedule;
    @Transient
    private String proScheduleStr;

    /**
     * 工程状态
     */
    @Transient
    private Integer proStatus;
    @Transient
    private String proStatusStr;

    /**
     * 工程位置
     */
    private String proLocation;

    /**
     * 工程概述
     */
    private String proSummarize;

    /**
     * 工程开始时间
     */
    private Date proStartTime;

    @Transient
    private String proStartTimeStr;

    /**
     * 工程结束时间
     */
    private Date proEndTime;

    @Transient
    private String proEndTimeStr;

    /**
     * 流程上报时间
     */
    @Transient
    private Date reportedTime;

    /**
     * 流程审批时间
     */
    @Transient
    private Date approvalTime;

    /**
     * 流程确认时间
     */
    @Transient
    private Date notarizeTime;

    /*----工程锥桶信息表，关联cone_bucket_type----*/
    /**
     * 是否有锥桶
     */
    private Integer containConeBucket;
    /**
     * 锥桶类型
     */
    @Transient
    private Integer coneBucketType;

    /**
     * 锥桶编号
     */
    @Transient
    private String coneBucketNum;

    /*----工程经纬度表----*/
    /**
     * 工程范围
     */
    @Transient
    private String proScope;

    /**
     * 工程经纬度表
     */
    @Transient
    private List<ProjectLocation> projectLocation;

    /**
     * 工程锥桶表
     */
    @Transient
    private List<ConeBucketMessage> coneBucketMessage;

    /**
     * 工作流任务id
     */
    @Transient
    private String taskId;

    public String getTaskId() {
        return taskId;
    }

    public void setTaskId(String taskId) {
        this.taskId = taskId;
    }

    public List<ConeBucketMessage> getConeBucketMessage() {
        return coneBucketMessage;
    }

    public void setConeBucketMessage(List<ConeBucketMessage> coneBucketMessage) {
        this.coneBucketMessage = coneBucketMessage;
    }

    public List<ProjectLocation> getProjectLocation() {
        return projectLocation;
    }

    public void setProjectLocation(List<ProjectLocation> projectLocation) {
        this.projectLocation = projectLocation;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getProName() {
        return proName;
    }

    public void setProName(String proName) {
        this.proName = proName;
    }

    public Integer getProType() {
        return proType;
    }

    public void setProType(Integer proType) {
        this.proType = proType;
    }

    public String getProNum() {
        return proNum;
    }

    public void setProNum(String proNum) {
        this.proNum = proNum;
    }

    public String getSupervisorUnit() {
        return supervisorUnit;
    }

    public void setSupervisorUnit(String supervisorUnit) {
        this.supervisorUnit = supervisorUnit;
    }

    public String getSupervisorUnitPhone() {
        return supervisorUnitPhone;
    }

    public void setSupervisorUnitPhone(String supervisorUnitPhone) {
        this.supervisorUnitPhone = supervisorUnitPhone;
    }

    public String getConstructionUnit() {
        return constructionUnit;
    }

    public void setConstructionUnit(String constructionUnit) {
        this.constructionUnit = constructionUnit;
    }

    public String getConstructionUnitPhone() {
        return constructionUnitPhone;
    }

    public void setConstructionUnitPhone(String constructionUnitPhone) {
        this.constructionUnitPhone = constructionUnitPhone;
    }

    public String getGovernorUnit() {
        return governorUnit;
    }

    public void setGovernorUnit(String governorUnit) {
        this.governorUnit = governorUnit;
    }

    public String getGovernorUnitPhone() {
        return governorUnitPhone;
    }

    public void setGovernorUnitPhone(String governorUnitPhone) {
        this.governorUnitPhone = governorUnitPhone;
    }

    public Integer getProSchedule() {
        return proSchedule;
    }

    public void setProSchedule(Integer proSchedule) {
        this.proSchedule = proSchedule;
    }

    public Integer getProStatus() {
        return proStatus;
    }

    public void setProStatus(Integer proStatus) {
        this.proStatus = proStatus;
    }

    public String getProLocation() {
        return proLocation;
    }

    public void setProLocation(String proLocation) {
        this.proLocation = proLocation;
    }

    public String getProSummarize() {
        return proSummarize;
    }

    public void setProSummarize(String proSummarize) {
        this.proSummarize = proSummarize;
    }

    public Date getProStartTime() {
        return proStartTime;
    }

    public void setProStartTime(Date proStartTime) {
        this.proStartTime = proStartTime;
    }

    public String getProStartTimeStr() {
        return proStartTimeStr;
    }

    public void setProStartTimeStr(String proStartTimeStr) {
        this.proStartTimeStr = proStartTimeStr;
    }

    public Date getProEndTime() {
        return proEndTime;
    }

    public void setProEndTime(Date proEndTime) {
        this.proEndTime = proEndTime;
    }

    public String getProEndTimeStr() {
        return proEndTimeStr;
    }

    public void setProEndTimeStr(String proEndTimeStr) {
        this.proEndTimeStr = proEndTimeStr;
    }

    public Date getReportedTime() {
        return reportedTime;
    }

    public void setReportedTime(Date reportedTime) {
        this.reportedTime = reportedTime;
    }

    public Date getApprovalTime() {
        return approvalTime;
    }

    public void setApprovalTime(Date approvalTime) {
        this.approvalTime = approvalTime;
    }

    public Date getNotarizeTime() {
        return notarizeTime;
    }

    public void setNotarizeTime(Date notarizeTime) {
        this.notarizeTime = notarizeTime;
    }

    public Integer getContainConeBucket() {
        return containConeBucket;
    }

    public void setContainConeBucket(Integer containConeBucket) {
        this.containConeBucket = containConeBucket;
    }

    public Integer getConeBucketType() {
        return coneBucketType;
    }

    public void setConeBucketType(Integer coneBucketType) {
        this.coneBucketType = coneBucketType;
    }

    public String getConeBucketNum() {
        return coneBucketNum;
    }

    public void setConeBucketNum(String coneBucketNum) {
        this.coneBucketNum = coneBucketNum;
    }

    public String getProScope() {
        return proScope;
    }

    public void setProScope(String proScope) {
        this.proScope = proScope;
    }

    public String getProScheduleStr() {
        return proScheduleStr;
    }

    public void setProScheduleStr(String proScheduleStr) {
        this.proScheduleStr = proScheduleStr;
    }

    public String getProStatusStr() {
        return proStatusStr;
    }

    public void setProStatusStr(String proStatusStr) {
        this.proStatusStr = proStatusStr;
    }

    public String getProTypeStr() {
        return proTypeStr;
    }

    public void setProTypeStr(String proTypeStr) {
        this.proTypeStr = proTypeStr;
    }
}
