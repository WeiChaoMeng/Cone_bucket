package com.jiaoke.bean;

import javax.persistence.*;
import java.util.Date;

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

    /**
     * 工程类型
     */
    private Integer proType;

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
     * 锥桶类型
     */
    private String coneBucketType;

    /**
     * 锥桶编号
     */
    private String coneBucketNum;

    /**
     * 工程进度
     */
    @Transient
    private Integer proSchedule;

    /**
     * 工程状态
     */
    @Transient
    private Integer proStatus;

    /**
     * 工程位置
     */
    private String proLocation;

    /**
     * 工程概述
     */
    private String proSummarize;

    /**
     * 工程范围
     */
    private String proScope;

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

    public String getConeBucketType() {
        return coneBucketType;
    }

    public void setConeBucketType(String coneBucketType) {
        this.coneBucketType = coneBucketType;
    }

    public String getConeBucketNum() {
        return coneBucketNum;
    }

    public void setConeBucketNum(String coneBucketNum) {
        this.coneBucketNum = coneBucketNum;
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

    public String getProScope() {
        return proScope;
    }

    public void setProScope(String proScope) {
        this.proScope = proScope;
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
}
