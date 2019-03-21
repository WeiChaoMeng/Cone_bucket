package com.jiaoke.web.dao;

import com.jiaoke.bean.Permission;
import org.springframework.stereotype.Repository;
import tk.mybatis.mapper.common.Mapper;

import java.util.List;

/**
 * 权限
 *
 * @author lihui
 * @version 1.0
 * @date 2019/3/15 14:55
 */
@Repository
public interface PermissionMapper extends Mapper<Permission> {
    /**
     * 根据权限描述模糊查询
     *
     * @param description 权限描述
     * @return list
     */
    List<Permission> fuzzyQueryByDescription(String description);
}
