package com.jiaoke.bean;

import javax.persistence.Column;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * 锥桶日志
 *
 * @author lihui
 * @version 1.0
 * @date 2019/3/20 20:50
 */
@Table(name = "cone_bucket_log")
public class ConeBarrelLog {

    /**
     * 主键
     */
    @Id
    @Column(name = "id")
    private Integer id;

    /**
     * 锥桶编号
     */
    private String coneBucketNum;

    /**
     * 锥桶类型
     */
    private String coneBucketType;

    /**
     * 锥桶状态
     */
    private String coneBucketStatus;

    /**
     * 路段名称
     */
    private String roadName;

    /**
     * 开始时间
     */
    private String startTime;

    /**
     * 结束时间
     */
    private String endTime;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getConeBucketNum() {
        return coneBucketNum;
    }

    public void setConeBucketNum(String coneBucketNum) {
        this.coneBucketNum = coneBucketNum;
    }

    public String getConeBucketType() {
        return coneBucketType;
    }

    public void setConeBucketType(String coneBucketType) {
        this.coneBucketType = coneBucketType;
    }

    public String getConeBucketStatus() {
        return coneBucketStatus;
    }

    public void setConeBucketStatus(String coneBucketStatus) {
        this.coneBucketStatus = coneBucketStatus;
    }

    public String getRoadName() {
        return roadName;
    }

    public void setRoadName(String roadName) {
        this.roadName = roadName;
    }

    public String getStartTime() {
        return startTime;
    }

    public void setStartTime(String startTime) {
        this.startTime = startTime;
    }

    public String getEndTime() {
        return endTime;
    }

    public void setEndTime(String endTime) {
        this.endTime = endTime;
    }
}
