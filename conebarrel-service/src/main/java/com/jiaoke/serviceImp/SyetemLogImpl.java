/**
 * FileName: SyetemLogImpl
 * author:   Melone
 * Date:     2019/3/25 12:31
 * History:
 * <author>    <time>     <version>   <desc>
 * 作者姓名     修改时间    版本号        描述
 **/
package com.jiaoke.serviceImp;

import com.jiaoke.serviceInf.SyetemLogInf;
import com.jiaoke.web.dao.SyetemLogDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.Map;

/**
 *  <一句话功能描述>
 *
 * @author: Melone
 * @create: 2019/3/25 12:31
 * @Description:
 */
@Service
public class SyetemLogImpl implements SyetemLogInf {

    @Resource
    private SyetemLogDao syetemLogDao;

    @Override
    public Map<String, String> getConeBucketLastTimeBydeviceId(String deviceId) {
        return syetemLogDao.selectConeBucketLastTimeBydeviceId(deviceId);
    }

    @Override
    public int addConeBucketTime(String deviceId, String s, String eventDesc, String locRoadName, String startDataTime, String endDataTime) {
        return syetemLogDao.insertConeBucketTime(deviceId,s,eventDesc,locRoadName,startDataTime,endDataTime);
    }

    @Override
    public void editConeBucketBydeviceId(String id, String endTime) {
        syetemLogDao.updataConeBucketBydeviceId(id,endTime);
    }
}
