package com.jiaoke.bean;

import javax.persistence.Column;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;
import java.util.Date;

/**
 * 锥桶管理
 *
 * @author lihui
 * @version 1.0
 * @date 2019/3/20 20:58
 */
@Table(name = "cone_bucket")
public class ConeBucket {

    /**
     * 主键
     */
    @Id
    @Column(name = "id")
    private String id;

    /**
     * 设备名称
     */
    private String name;

    /**
     * 设备所属公司
     */
    private String company;

    /**
     * 设备最后在线时间
     */
    private String lastTime;

    /**
     * 目前位置,经度、纬度，为0表示不在线，且离线很久了
     */
    private String lastLocation;

    /**
     * 速度，当速度为0的时候，表示设备静止或者离线很久了
     */
    private String speed;

    /**
     * 根据当前经纬度，返回设备发送回来的坐标点数，当点数大于某个值的时候，说明设备静止了（进入施工作业区）。
     */
    private String points;

    /**
     * 锥桶类型
     */
    private String coneBucketTypeId;

    /**
     * 设备所在路线信息
     */
    private RoadInfo roadInfo;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getCompany() {
        return company;
    }

    public void setCompany(String company) {
        this.company = company;
    }

    public String getLastTime() {
        return lastTime;
    }

    public void setLastTime(String lastTime) {
        this.lastTime = lastTime;
    }

    public String getLastLocation() {
        return lastLocation;
    }

    public void setLastLocation(String lastLocation) {
        this.lastLocation = lastLocation;
    }

    public String getSpeed() {
        return speed;
    }

    public void setSpeed(String speed) {
        this.speed = speed;
    }

    public String getPoints() {
        return points;
    }

    public void setPoints(String points) {
        this.points = points;
    }

    public String getConeBucketTypeId() {
        return coneBucketTypeId;
    }

    public void setConeBucketTypeId(String coneBucketTypeId) {
        this.coneBucketTypeId = coneBucketTypeId;
    }

    public RoadInfo getRoadInfo() {
        return roadInfo;
    }

    public void setRoadInfo(RoadInfo roadInfo) {
        this.roadInfo = roadInfo;
    }
}
