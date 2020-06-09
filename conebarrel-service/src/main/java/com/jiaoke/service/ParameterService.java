package com.jiaoke.service;

import com.jiaoke.bean.Parameter;

import java.util.List;

/**
 * 参数
 *
 * @author lihui
 * @version 1.0
 * @date 2019/3/15 15:00
 */
public interface ParameterService {

    /**
     * 查询全部
     *
     * @return list
     */
    List<Parameter> selectAll();

    /**
     * 模糊查询
     *
     * @param paramName 名称
     * @return list
     */
    List<Parameter> fuzzyQueryByName(String paramName);

    /**
     * 添加
     *
     * @param parameter parameter
     * @return 影响行数
     */
    int addRole(Parameter parameter);

    /**
     * 删除
     *
     * @param id id
     * @return 影响行数
     */
    int remove(Integer id);

    /**
     * 根据主键查询
     *
     * @param id 主键
     * @return roleInfo
     */
    Parameter selectByPrimaryKey(Integer id);

    /**
     * 更新
     *
     * @param parameter parameter
     * @return int
     */
    int update(Parameter parameter);
}
