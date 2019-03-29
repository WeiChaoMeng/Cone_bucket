/**
 * FileName: LogManagerImpl
 * author:   Melone
 * Date:     2019/3/29 11:10
 * History:
 * <author>    <time>     <version>   <desc>
 * 作者姓名     修改时间    版本号        描述
 **/
package com.jiaoke.serviceImp;

import com.jiaoke.bean.LogMessage;
import com.jiaoke.bean.PageBean;
import com.jiaoke.serviceInf.LogManagerInf;
import com.jiaoke.web.dao.LogManagerDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;

/**
 *  <一句话功能描述>
 *
 * @author: Melone
 * @create: 2019/3/29 11:10
 * @Description:
 */
@Service
public class LogManagerImpl implements LogManagerInf {

    @Resource
    private LogManagerDao logManagerdao;

    /**
     *
     * 功能描述: <br>
     *  <分页查询方法，返回分页数据>
     * @param
     * @return
     * @auther Melone
     * @date 2019/3/29 11:40
     */
    @Override
    public PageBean<LogMessage> getAllConeBucketLog(int currentPageNum, String url) {

        if ( 0 == currentPageNum ) return null;

        int count = logManagerdao.selectLogDataCount();

        PageBean<LogMessage> pageBean = new PageBean<LogMessage>();
        pageBean.setCurrentPageNum(currentPageNum);
        pageBean.setEachPageDataNum(15);
        pageBean.setDataCountNum(count);
        pageBean.setPageCount(pageBean.getEachPageDataNum(),pageBean.getDataCountNum());
        pageBean.setPageFirstNum(pageBean.getEachPageDataNum(),currentPageNum);
        pageBean.setPageData(logManagerdao.selectLogDataByLimte(pageBean.getPageFirstNum(),pageBean.getEachPageDataNum()));
        pageBean.setUrl(url);

        return pageBean;
    }
}
