package com.jiaoke.service;

import com.jiaoke.bean.Parameter;
import com.jiaoke.util.DateUtil;
import com.jiaoke.web.dao.ParameterMapper;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.Date;
import java.util.List;

/**
 * 参数
 *
 * @author lihui
 * @version 1.0
 * @date 2019/3/15 15:00
 */
@Service
public class ParameterServiceImpl implements ParameterService {

    @Resource
    private ParameterMapper parameterMapper;

    @Override
    public List<Parameter> fuzzyQueryByName(String paramName) {
        List<Parameter> parameterList = parameterMapper.fuzzyQueryByName(paramName);
        for (Parameter parameter : parameterList) {
            parameter.setCreateTimeStr(DateUtil.dateConvertYYYYMMDDHHMMSS(parameter.getCreateTime()));
        }
        return parameterList;
    }

    @Override
    public List<Parameter> selectAll() {
        return parameterMapper.selectAll();
    }

    @Override
    public int addRole(Parameter parameter) {
        parameter.setCreateTime(new Date());
        return parameterMapper.insertSelective(parameter);
    }

    @Override
    public int remove(Integer id) {
        //删除角色
        if (parameterMapper.deleteByPrimaryKey(id) < 0) {
            return -1;
        } else {
            return 1;
        }
    }

    @Override
    public Parameter selectByPrimaryKey(Integer id) {
        return parameterMapper.selectByPrimaryKey(id);
    }

    @Override
    public int update(Parameter parameter) {
        return parameterMapper.updateByPrimaryKeySelective(parameter);
    }
}
