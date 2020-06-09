package com.jiaoke.control;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.jiaoke.bean.ConeBarrelManage;
import com.jiaoke.service.ConeBarrelManageService;
import com.jiaoke.util.JsonHelper;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 锥桶管理
 *
 * @author lihui
 * @version 1.0
 * @date 2020-5-7 10:13
 */
@Controller
@RequestMapping(value = "/coneBarrelManage")
public class ConeBarrelManageController {

    @Resource
    private ConeBarrelManageService coneBarrelManageService;

    /**
     * 添加锥桶
     *
     * @param keyWd    key
     * @param platform 服务平台，0-高德、1-内部监管
     * @return string
     */
    @RequestMapping(value = "/addConeBarrel")
    @ResponseBody
    public String addConeBarrel(String keyWd, String platform) {
        String gaoDe = "0";
        if (gaoDe.equals(platform)) {
            //高德平台
            return JsonHelper.toJSONString(coneBarrelManageService.addConeBarrel(keyWd, platform));
        } else {
            Map<String, Object> map = new HashMap<>(16);
            map.put("msg", "查询无此锥桶！");
            return JsonHelper.toJSONString(map);
        }
    }

    /**
     * 查询全部数据(分页)
     *
     * @param page page
     * @return data
     */
    @RequestMapping(value = "/getAllConeBarrelManage")
    @ResponseBody
    public String getAllConeBarrelManage(int page) {
        PageHelper.startPage(page, 14);
        List<ConeBarrelManage> barrelManageList = coneBarrelManageService.getAll();
        PageInfo<ConeBarrelManage> pageInfo = new PageInfo<>(barrelManageList);
        return JsonHelper.toJSONString(pageInfo);
    }

    /**
     * 查询全部数据(工程查询页面使用)
     *
     * @return data
     */
    @RequestMapping(value = "/gatAllData")
    @ResponseBody
    public String gatAllData() {
        List<ConeBarrelManage> barrelManageList = coneBarrelManageService.getAll();
        return JsonHelper.toJSONString(barrelManageList);
    }

    /**
     * 1000 毫秒= 1 秒
     */
    @Scheduled(fixedDelay = 30000)
    public void t() {
        System.out.println("定时任务");
        long startTime = System.currentTimeMillis();
        coneBarrelManageService.updateConeBarrelState();
        long endTime = System.currentTimeMillis();
        System.out.println("程序运行时间：" + (endTime - startTime) + "ms");
    }
}
