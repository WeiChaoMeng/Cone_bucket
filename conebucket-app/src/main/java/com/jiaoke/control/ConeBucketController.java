package com.jiaoke.control;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.jiaoke.bean.ConeBucket;
import com.jiaoke.service.ConeBucketService;
import com.jiaoke.util.JsonHelper;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.util.List;

/**
 * 锥桶管理
 *
 * @author lihui
 * @version 1.0
 * @date 2020-7-10 11:17
 */
@Controller
@RequestMapping(value = "/coneBucket")
public class ConeBucketController {

    @Resource
    private ConeBucketService coneBucketService;

    /**
     * 跳转锥桶首页
     *
     * @return jsp
     */
    @RequestMapping(value = "/toIndex")
    public String toIndex(Model model, int page) {
        model.addAttribute("currentPage", JsonHelper.toJSONString(page));
        return "bucket/cone_bucket";
    }

    /**
     * 加载锥桶数据
     *
     * @param page page
     * @return list
     */
    @RequestMapping(value = "/loadData")
    @ResponseBody
    public String loadData(int page) {
        PageHelper.startPage(page, 9);
        List<ConeBucket> coneBucketList = coneBucketService.selectAll();
        PageInfo<ConeBucket> pageInfo = new PageInfo<>(coneBucketList);
        return JsonHelper.toJSONString(pageInfo);
    }

    /**
     * 添加锥桶
     *
     * @param deviceId 设备ID
     * @return s/c
     */
    @RequestMapping(value = "/add")
    @ResponseBody
    public String add(String deviceId, String coneBucketType) {
        String msg = coneBucketService.add(deviceId, coneBucketType);
        return JsonHelper.toJSONString(msg);
    }

    /**
     * 删除
     *
     * @param deviceId 设备id
     * @return s/e
     */
    @RequestMapping(value = "/delete")
    @ResponseBody
    public String delete(String deviceId) {
        if (coneBucketService.delete(deviceId) < 0) {
            return "error";
        } else {
            return "success";
        }
    }

    /**
     * 根据ID查询
     *
     * @param ids ids
     * @return s/e
     */
    @RequestMapping(value = "/batchSelect")
    @ResponseBody
    public String batchSelect(String[] ids){
        List<ConeBucket> coneBucketList = coneBucketService.locationById(ids);
        return JsonHelper.toJSONString(coneBucketList);
    }

    /**
     * 查询全部锥桶信息
     *
     * @return s/e
     */
    @RequestMapping(value = "/allConeBucketPosition")
    @ResponseBody
    public String allConeBucketPosition(){
        List<ConeBucket> coneBucketList = coneBucketService.allConeBucketPosition();
        return JsonHelper.toJSONString(coneBucketList);
    }

    /**
     * 1000 毫秒= 1 秒
     */
    @Scheduled(fixedDelay = 240000)
    public void t() {
        coneBucketService.updateConeBucketInfo();
    }
}
