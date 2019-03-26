package com.jiaoke.bean;

import javax.persistence.*;

/**
 * 工程状态
 *
 * @author lihui
 * @version 1.0
 * @date 2019/3/15 14:55
 */
@Table(name = "project_status")
public class ProjectStatus {

    /**
     * 主键
     */
    @Id
    @Column(name = "id")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    /**
     * 状态名称
     */
    private String statusName;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getStatusName() {
        return statusName;
    }

    public void setStatusName(String statusName) {
        this.statusName = statusName;
    }
}
