package com.jiaoke.bean;

import javax.persistence.*;

/**
 * 工程类型
 *
 * @author lihui
 * @version 1.0
 * @date 2019/3/15 14:55
 */
@Table(name = "project_type")
public class ProjectType {

    /**
     * 主键
     */
    @Id
    @Column(name = "id")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    /**
     * 类型名称
     */
    private String typeName;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getTypeName() {
        return typeName;
    }

    public void setTypeName(String typeName) {
        this.typeName = typeName;
    }
}
