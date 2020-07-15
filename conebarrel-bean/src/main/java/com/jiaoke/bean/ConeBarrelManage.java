package com.jiaoke.bean;

import javax.persistence.Column;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * 锥桶管理
 *
 * @author lihui
 * @version 1.0
 * @date 2020-5-7 9:27
 */
@Table(name = "cone_barrel_manage")
public class ConeBarrelManage {

    /**
     * 主键
     */
    private String id;

    /**
     * 剩余电量
     */
    private String batteryPowerRemain;

    /**
     * 设备信息创建时间
     */
    private String createTime;

    /**
     * 设备唯一ID
     */
    @Id
    @Column(name = "device_id")
    private String deviceId;

    /**
     * 设备版本号
     */
    private String deviceVersion;

    /**
     * 设备按键状态 取值：0-正常通行、1-无法通行、2-影响通行、3-NA
     */
    private String keyState;

    /**
     * 设备最后上报时间
     */
    private String lastReportTime;

    /**
     * 设备坐标 维度 * 1000_000
     */
    private String lat;

    /**
     * 设备坐标 精度 * 1000_000
     */
    private String lng;

    /**
     * 记录更新时间
     */
    private String modifiedTime;

    /**
     * 关机解除上报。取值：0-正常、1-关机
     */
    private String offStat;

    /**
     * 设备使用状态，0 停用、1 起用 （顶用的设备不会给amap客户端 推送事件信息）
     */
    private String onlineSwitch;

    /**
     * 开机时长 单位：秒
     */
    private String openTime;

    /**
     * 设备指向。取值：0-360（东=0°，北=90°）  （部分设备有指向）
     */
    private String orient;

    /**
     * 状态码。取值：0-NAN、1-稳定有效、2-不稳定、3-定位无效 该字段 有服务端判断，当开机一定时间且坐标定位比较稳定后该字段会成为1（稳定有效）
     */
    private String roadType;

    /**
     * 源id
     */
    private String sourceId;

    /**
     * 状态标记
     */
    private String stateFlag;

    /**
     * 团队
     */
    private String team;

    /**
     * 服务平台
     */
    private String servicePlatform;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getBatteryPowerRemain() {
        return batteryPowerRemain;
    }

    public void setBatteryPowerRemain(String batteryPowerRemain) {
        this.batteryPowerRemain = batteryPowerRemain;
    }

    public String getCreateTime() {
        return createTime;
    }

    public void setCreateTime(String createTime) {
        this.createTime = createTime;
    }

    public String getDeviceId() {
        return deviceId;
    }

    public void setDeviceId(String deviceId) {
        this.deviceId = deviceId;
    }

    public String getDeviceVersion() {
        return deviceVersion;
    }

    public void setDeviceVersion(String deviceVersion) {
        this.deviceVersion = deviceVersion;
    }

    public String getKeyState() {
        return keyState;
    }

    public void setKeyState(String keyState) {
        this.keyState = keyState;
    }

    public String getLastReportTime() {
        return lastReportTime;
    }

    public void setLastReportTime(String lastReportTime) {
        this.lastReportTime = lastReportTime;
    }

    public String getLat() {
        return lat;
    }

    public void setLat(String lat) {
        this.lat = lat;
    }

    public String getLng() {
        return lng;
    }

    public void setLng(String lng) {
        this.lng = lng;
    }

    public String getModifiedTime() {
        return modifiedTime;
    }

    public void setModifiedTime(String modifiedTime) {
        this.modifiedTime = modifiedTime;
    }

    public String getOffStat() {
        return offStat;
    }

    public void setOffStat(String offStat) {
        this.offStat = offStat;
    }

    public String getOnlineSwitch() {
        return onlineSwitch;
    }

    public void setOnlineSwitch(String onlineSwitch) {
        this.onlineSwitch = onlineSwitch;
    }

    public String getOpenTime() {
        return openTime;
    }

    public void setOpenTime(String openTime) {
        this.openTime = openTime;
    }

    public String getOrient() {
        return orient;
    }

    public void setOrient(String orient) {
        this.orient = orient;
    }

    public String getRoadType() {
        return roadType;
    }

    public void setRoadType(String roadType) {
        this.roadType = roadType;
    }

    public String getSourceId() {
        return sourceId;
    }

    public void setSourceId(String sourceId) {
        this.sourceId = sourceId;
    }

    public String getStateFlag() {
        return stateFlag;
    }

    public void setStateFlag(String stateFlag) {
        this.stateFlag = stateFlag;
    }

    public String getTeam() {
        return team;
    }

    public void setTeam(String team) {
        this.team = team;
    }

    public String getServicePlatform() {
        return servicePlatform;
    }

    public void setServicePlatform(String servicePlatform) {
        this.servicePlatform = servicePlatform;
    }
}
