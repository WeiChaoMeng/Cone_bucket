package com.jiaoke.web.dao;

import com.jiaoke.bean.Parameter;
import org.springframework.stereotype.Repository;
import tk.mybatis.mapper.common.Mapper;

import java.util.List;

/**
 * 参数
 *
 * @author lihui
 * @version 1.0
 * @date 2019/3/15 14:55
 */
@Repository
public interface ParameterMapper extends Mapper<Parameter> {
    /**
     * 根据角色名称模糊查询
     *
     * @param paramName 名称
     * @return list
     */
    List<Parameter> fuzzyQueryByName(String paramName);
}
