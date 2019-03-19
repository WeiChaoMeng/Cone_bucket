/**
 * FileName: ConeBucketManagerServiceImp
 * author:   Melone
 * Date:     2019/3/17 20:53
 * History:
 * <author>    <time>     <version>   <desc>
 * 作者姓名     修改时间    版本号        描述
 **/
package com.jiaoke.serviceImp;

import com.jiaoke.serviceInf.ConeBucketManagerServiceInf;
import com.jiaoke.web.dao.ConeBucketManagerDao;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;

/**
 *  <一句话功能描述>
 *
 * @author: Melone
 * @create: 2019/3/17 20:53
 * @Description:
 */
@Service
public class ConeBucketManagerServiceImp implements ConeBucketManagerServiceInf {

    @Resource
    private ConeBucketManagerDao coneBucketManagerDao;

    @Override
    public int addConeBucket(String diseaseNumber, String roadName) {
        int id = coneBucketManagerDao.insertConeBucket(diseaseNumber,roadName);
        return id;
    }

    @Override
    public List<Map<String, Object>> getAllConeBucket() {
        return coneBucketManagerDao.selectAllConeBucket();
    }

    @Override
    public int removeConeBucketById(String[] idArray) {
        return coneBucketManagerDao.delectConeBucketById(idArray);
    }
}
