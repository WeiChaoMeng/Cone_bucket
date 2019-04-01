package com.jiaoke.test;

import com.jiaoke.util.SpringHelper;
import com.jiaoke.web.dao.ProjectMessageMapper;
import org.junit.Before;
import org.junit.Test;

/**
 * @author lihui
 * @version 1.0
 * @date 2019/3/18 10:37
 */
public class ProjectTest {

    private ProjectMessageMapper projectMessageMapper;
//    private ConeBucketMessageMapper coneBucketMessageMapper;
//    private ProjectLocationMapper projectLocationMapper;

    @Before
    public void setUp() {
        projectMessageMapper = SpringHelper.getBean("projectMessageMapper");
    }

    @Test
    public void testUser() {
        String projectName = projectMessageMapper.selectProjectName(21);
        System.out.println(projectName);
    }
}
