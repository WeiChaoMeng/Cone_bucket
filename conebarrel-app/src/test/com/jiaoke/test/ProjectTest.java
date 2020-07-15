package com.jiaoke.test;

import com.jiaoke.bean.ProjectLog;
import com.jiaoke.util.SpringHelper;
import com.jiaoke.web.dao.ProjectLogMapper;
import com.jiaoke.web.dao.ProjectMessageMapper;
import org.junit.Before;
import org.junit.Test;

import java.util.List;

/**
 * @author lihui
 * @version 1.0
 * @date 2019/3/18 10:37
 */
public class ProjectTest {

//    private ProjectMessageMapper projectMessageMapper;
//    private ConeBucketMessageMapper coneBucketMessageMapper;
//    private ProjectLocationMapper projectLocationMapper;
    private ProjectLogMapper projectLogMapper;

    @Before
    public void setUp() {
        projectLogMapper = SpringHelper.getBean("projectLogMapper");
    }

    @Test
    public void testUser() {
        List<ProjectLog> projectLogList = projectLogMapper.selectAllData();
        for (ProjectLog projectLog : projectLogList) {
            System.out.println(projectLog.getLogType() + projectLog.getLogContent() + projectLog.getOperationUser() + projectLog.getId() + projectLog.getState());
        }
    }
}
