package com.jiaoke.bean;

import javax.persistence.*;
import java.util.Date;

/**
 * 锥桶类型
 *
 * @author lihui
 * @version 1.0
 * @date 2019/3/15 14:55
 */
@Table(name = "cone_bucket_message")
public class ConeBucketMessage {

    /**
     * 主键
     */
    @Id
    @Column(name = "id")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    /**
     * 锥桶类型
     */
    private Integer coneBucketType;
    @Transient
    private String coneBucketTypeStr;

    /**
     * 锥桶编号
     */
    private String coneBucketNum;

    /**
     * 创建时间
     */
    private Date createTime;


    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
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

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public String getConeBucketTypeStr() {
        return coneBucketTypeStr;
    }

    public void setConeBucketTypeStr(String coneBucketTypeStr) {
        this.coneBucketTypeStr = coneBucketTypeStr;
    }
}
