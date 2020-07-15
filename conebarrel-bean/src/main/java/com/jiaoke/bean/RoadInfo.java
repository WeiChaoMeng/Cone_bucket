package com.jiaoke.bean;

import javax.persistence.Column;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * 锥桶设备所在路线信息
 *
 * @author lihui
 * @version 1.0
 * @date 2020-7-13 12:18
 */
@Table(name = "road_info")
public class RoadInfo {

    private String roadId;
    private String roadName;
    private String stake;
    private String isUp;
    private String dis;
    @Id
    @Column(name = "cone_bucket_id")
    private String coneBucketId;

    public String getRoadId() {
        return roadId;
    }

    public void setRoadId(String roadId) {
        this.roadId = roadId;
    }

    public String getRoadName() {
        return roadName;
    }

    public void setRoadName(String roadName) {
        this.roadName = roadName;
    }

    public String getStake() {
        return stake;
    }

    public void setStake(String stake) {
        this.stake = stake;
    }

    public String getIsUp() {
        return isUp;
    }

    public void setIsUp(String isUp) {
        this.isUp = isUp;
    }

    public String getDis() {
        return dis;
    }

    public void setDis(String dis) {
        this.dis = dis;
    }

    public String getConeBucketId() {
        return coneBucketId;
    }

    public void setConeBucketId(String coneBucketId) {
        this.coneBucketId = coneBucketId;
    }
}
