/**
 * FileName: AppServiceImpl
 * author:   Melone
 * Date:     2019/3/16 15:08
 * History:
 * <author>    <time>     <version>   <desc>
 * 作者姓名     修改时间    版本号        描述
 **/
package com.jiaoke.serviceImp;

import com.jiaoke.dao.AppServiceDao;
import com.jiaoke.serviceInf.AppServiceInf;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;

/**
 *  <一句话功能描述>
 *
 * @author: Melone
 * @create: 2019/3/16 15:08
 * @Description:
 */
@Service
public class AppServiceImpl  implements AppServiceInf {

    @Resource
    private AppServiceDao appServiceDao;

    @Override
    public List<Map<String, Object>> getProgectByProgresAndproStatus(String progress, String proStatus) {

        return appServiceDao.selectProgectByProgresAndproStatus(progress,proStatus);
    }

    @Override
    public List<Map<String, Object>> getProLocationsByIdList(List<String> idList) {
        return appServiceDao.selectProLocationsByIdList(idList);
    }
}
