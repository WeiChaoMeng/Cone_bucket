package com.jiaoke.bean;

import javax.persistence.Column;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;
import java.util.Date;

/**
 * 预警日志
 *
 * @author lihui
 * @version 1.0
 * @date 2019/3/20 20:50
 */
@Table(name = "warning_log")
public class WarningLog {

    /**
     * 主键
     */
    @Id
    @Column(name = "id")
    private Integer id;

    /**
     * 日志类型
     */
    private String logType;

    /**
     * 日志内容
     */
    private String logContent;

    /**
     * 操作人
     */
    private String operationUser;

    /**
     * 操作时间
     */
    private Date operationTime;
    @Transient
    private String operationTimeStr;

    /**
     * 状态
     */
    private String state;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getLogType() {
        return logType;
    }

    public void setLogType(String logType) {
        this.logType = logType;
    }

    public String getLogContent() {
        return logContent;
    }

    public void setLogContent(String logContent) {
        this.logContent = logContent;
    }

    public String getOperationUser() {
        return operationUser;
    }

    public void setOperationUser(String operationUser) {
        this.operationUser = operationUser;
    }

    public Date getOperationTime() {
        return operationTime;
    }

    public void setOperationTime(Date operationTime) {
        this.operationTime = operationTime;
    }

    public String getState() {
        return state;
    }

    public void setState(String state) {
        this.state = state;
    }

    public String getOperationTimeStr() {
        return operationTimeStr;
    }

    public void setOperationTimeStr(String operationTimeStr) {
        this.operationTimeStr = operationTimeStr;
    }
}
