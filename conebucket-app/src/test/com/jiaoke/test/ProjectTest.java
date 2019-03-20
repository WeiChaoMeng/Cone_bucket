package com.jiaoke.test;

import com.jiaoke.util.SpringHelper;
import com.jiaoke.web.dao.ProjectLocationMapper;
import org.junit.Before;
import org.junit.Test;

/**
 * @author lihui
 * @version 1.0
 * @date 2019/3/18 10:37
 */
public class ProjectTest {

//    private ProjectMessageMapper projectMessageMapper;
//    private ConeBucketMessageMapper coneBucketMessageMapper;
    private ProjectLocationMapper projectLocationMapper;

    @Before
    public void setUp() {
        projectLocationMapper = SpringHelper.getBean("projectLocationMapper");
    }

    @Test
    public void testUser() {
        int i = projectLocationMapper.deleteByProId(10);
        System.out.println(i);
    }
}
