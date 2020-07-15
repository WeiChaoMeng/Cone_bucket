package com.jiaoke.bean;

import javax.persistence.*;

/**
 * 工程锥桶信息表
 *
 * @author lihui
 * @version 1.0
 * @date 2019/3/15 14:55
 */
@Table(name = "project_cone_bucket")
public class ProjectConeBucket {

    /**
     * 主键
     */
    @Id
    @Column(name = "id")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    /**
     * 工程id
     */
    private Integer proId;

    /**
     * 关联锥桶id
     */
    private Integer coneBucketId;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getProId() {
        return proId;
    }

    public void setProId(Integer proId) {
        this.proId = proId;
    }

    public Integer getConeBucketId() {
        return coneBucketId;
    }

    public void setConeBucketId(Integer coneBucketId) {
        this.coneBucketId = coneBucketId;
    }
}
