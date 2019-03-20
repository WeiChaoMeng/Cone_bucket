package com.jiaoke.control;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.jiaoke.bean.*;
import com.jiaoke.service.*;
import com.jiaoke.util.JsonHelper;
import org.activiti.engine.history.HistoricProcessInstance;
import org.activiti.engine.task.Task;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

/**
 * 工程管理
 *
 * @author lihui
 * @version 1.0
 * @date 2019/3/15 14:43
 */
@Controller
@RequestMapping("/projectMessage")
public class ProjectMessageController {

    @Resource
    private ProjectMessageService projectMessageService;

    @Resource
    private ConeBucketTypeService coneBucketTypeService;

    @Resource
    private ProjectTypeService projectTypeService;

    @Resource
    private ConeBucketMessageService coneBucketMessageService;

    @Resource
    private ProjectLocationService projectLocationService;

    @Resource
    private Activiti activiti;

    /**
     * 跳转工程管理首页
     *
     * @return project_manage.jsp
     */
    @RequestMapping("/toIndex.do")
    public String toIndex() {
        return "project/project_manage";
    }

    /**
     * 跳转添加工程
     *
     * @return add.jsp
     */
    @RequestMapping("/toAdd.do")
    public String addEngineering(Model model) {
        //查询锥桶类型
        List<ConeBucketType> coneBucketTypeList = coneBucketTypeService.selectAll();
        //查询工程类型
        List<ProjectType> projectTypeList = projectTypeService.selectAll();

        model.addAttribute("coneBucketTypeList", coneBucketTypeList);
        model.addAttribute("projectTypeList", projectTypeList);
        return "project/add";
    }

    /**
     * 选择性插入数据
     *
     * @return 影响行数
     */
    @RequestMapping("/add.do")
    @ResponseBody
    public String insertSelective(ProjectMessage projectMessage) {
        if (projectMessageService.insertSelective(projectMessage) > 0) {
            return "success";
        }
        return "error";
    }

    /**
     * 查询工程页面加载数据
     *
     * @return list
     */
    @RequestMapping("/projectQueryIndex.do")
    @ResponseBody
    public String selectAll(int page) {
        PageHelper.startPage(page, 10);
        List<ProjectMessage> projectMessageList = projectMessageService.selectAllData();
        PageInfo<ProjectMessage> pageInfo = new PageInfo<ProjectMessage>(projectMessageList);
        return JsonHelper.toJSONString(pageInfo);
    }


    /**
     * 跳转工程详情页
     *
     * @return details.jsp
     */
    @RequestMapping("/toDetails.do")
    public String toDetails(Integer id, Model model) {
        model.addAttribute("id", id);
        return "project/details";
    }

    /**
     * 获取工程详情
     *
     * @param id 工程id
     * @return 工程信息
     */
    @RequestMapping("/details.do")
    @ResponseBody
    public String details(Integer id) {
        HashMap<String, Object> map = new HashMap<String, Object>(16);
        ProjectMessage projectMessage = projectMessageService.selectById(id);
        List<ConeBucketMessage> coneBucketMessageList = coneBucketMessageService.selectByProId(id);
        map.put("projectMessage", projectMessage);
        map.put("coneBucketMessageList", coneBucketMessageList);
        return JsonHelper.toJSONString(map);
    }

    /**
     * 根据主键删除
     *
     * @param id 主键
     * @return s/e
     */
    @RequestMapping("/remove.do")
    @ResponseBody
    public String remove(Integer id) {
        if (projectMessageService.remove(id) > 0) {
            return "success";
        }
        return "error";
    }

    @RequestMapping("/toEdit.do")
    public String toEdit(Integer id, Model model) {
        System.out.println(id);
        //工程信息
        ProjectMessage projectMessage = projectMessageService.selectById(id);
        //工程锥桶信息
        List<ConeBucketMessage> coneBucketMessageList = projectMessage.getConeBucketMessage();
        String coneBucketNum = "";
        for (int i = 0; i < coneBucketMessageList.size(); i++) {
            coneBucketNum += coneBucketMessageList.get(i).getConeBucketNum();
            if (coneBucketMessageList.size() - 1 != i) {
                coneBucketNum += ",";
            }
        }
        //工程经纬度
        List<ProjectLocation> projectLocationList = projectMessage.getProjectLocation();

        //查询锥桶类型
        List<ConeBucketType> coneBucketTypeList = coneBucketTypeService.selectAll();
        //查询工程类型
        List<ProjectType> projectTypeList = projectTypeService.selectAll();

        model.addAttribute("coneBucketTypeList", coneBucketTypeList);
        model.addAttribute("projectLocationList", JsonHelper.toJSONString(projectLocationList));
        model.addAttribute("projectTypeList", projectTypeList);
        model.addAttribute("projectMessage", projectMessage);
        model.addAttribute("coneBucketNum", coneBucketNum);
        return "project/edit";
    }

    /**
     * 修改工程信息
     *
     * @param projectMessage projectMessage
     * @return e/s
     */
    @RequestMapping("/edit.do")
    @ResponseBody
    public String edit(ProjectMessage projectMessage) {
        if (projectMessageService.updateById(projectMessage) < 0) {
            return "error";
        }
        return "success";
    }

    /**
     * 功能描述: <br>
     * <根据条件查询工程>
     * 条件查询
     *
     * @param proName proName
     * @param proType proType
     * @return json
     * @auther Melone
     * @date 2019/3/19 14:05
     */
    @ResponseBody
    @RequestMapping(value = "/getProMessageByCondition.do", method = RequestMethod.POST)
    public String getProMessageByCondition(@RequestParam("page") int page,
                                           @RequestParam("proName") String proName,
                                           @RequestParam("proType") String proType) {


        PageHelper.startPage(page, 10);
        List<ProjectMessage> projectMessageList = projectMessageService.getProMessageByCondition(proName, proType);
        PageInfo<ProjectMessage> pageInfo = new PageInfo<>(projectMessageList);
        return JsonHelper.toJSONString(pageInfo);

    }

    /**
     * 加载未上报工程
     *
     * @return list
     */
    @RequestMapping("/notReported.do")
    @ResponseBody
    public String notReported(int page) {
        PageHelper.startPage(page, 10);
        List<ProjectMessage> projectMessageList = projectMessageService.selectNotReported();
        PageInfo<ProjectMessage> pageInfo = new PageInfo<>(projectMessageList);
        return JsonHelper.toJSONString(pageInfo);
    }

    /**
     * 工程上报
     *
     * @param id 工程id
     * @return s
     */
    @RequestMapping("/projectReport.do")
    @ResponseBody
    public String projectReport(Integer id) {
        String processInstanceId = activiti.startProcessInstance("projectMessage", id.toString());
        if (activiti.queryTaskIdByProcessInstanceId(processInstanceId) != null) {
            //修改工程状态
            if (projectMessageService.updateProStatus(id, 1) >= 0) {
                return "success";
            }
            return "error";
        }
        return "error";
    }

    /**
     * 行业审批
     *
     * @param page page
     * @return json
     */
    @RequestMapping("/industryApproval.do")
    @ResponseBody
    public String industryApproval(int page) {
        PageHelper.startPage(page, 10);
        //查询行业审批任务
        List<Task> taskList = activiti.queryTask("industryApproval");
        List<ProjectMessage> list = new ArrayList<>();
        for (Task task : taskList) {
            //根据ProcessInstanceId查询businessKey
            String businessKey = activiti.queryBusinessKey(task.getProcessInstanceId());
            ProjectMessage projectMessage = projectMessageService.selectByBusinessKey(Integer.valueOf(businessKey));
            projectMessage.setTaskId(task.getId());
            list.add(projectMessage);
        }
        PageInfo<ProjectMessage> pageInfo = new PageInfo<>(list);
        return JsonHelper.toJSONString(pageInfo);
    }

    /**
     * 交警确认
     *
     * @param page page
     * @return json
     */
    @RequestMapping("/policeConfirm.do")
    @ResponseBody
    public String policeConfirm(int page) {
        //查询行业审批任务
        List<Task> taskList = activiti.queryTask("policeConfirmation");
        List<ProjectMessage> arrayList = new ArrayList<>();
        for (Task task : taskList) {
            //根据ProcessInstanceId查询businessKey
            String processInstanceId = task.getProcessInstanceId();
            String businessKey = activiti.queryBusinessKey(processInstanceId);
            ProjectMessage projectMessage = projectMessageService.selectByBusinessKey(Integer.valueOf(businessKey));
            projectMessage.setTaskId(task.getId());
            arrayList.add(projectMessage);
        }
        PageHelper.startPage(page, 10);
        PageInfo<ProjectMessage> pageInfo = new PageInfo<>(arrayList);
        return JsonHelper.toJSONString(pageInfo);
    }


    /**
     * 竣工完成
     *
     * @param page page
     * @return json
     */
    @RequestMapping("/completion.do")
    @ResponseBody
    public String completion(int page) {
        List<ProjectMessage> arrayList = new ArrayList<>();
        //查询已审批完成的工程
        List<HistoricProcessInstance> historicProcessInstanceList = activiti.queryHistoricProcessInstance();
        for (HistoricProcessInstance historicProcessInstance : historicProcessInstanceList) {
            //根据业务主键查询已完成工程
            ProjectMessage projectMessage = projectMessageService.selectByBusinessKey(Integer.valueOf(historicProcessInstance.getBusinessKey()));
            arrayList.add(projectMessage);
        }
        PageHelper.startPage(page, 10);
        PageInfo<ProjectMessage> pageInfo = new PageInfo<>(arrayList);
        return JsonHelper.toJSONString(pageInfo);
    }

    /**
     * 行业通过处理
     *
     * @param taskId taskId
     * @return s
     */
    @RequestMapping("/policePerform.do")
    @ResponseBody
    public String policePerform(String taskId, Integer id, Integer status) {
        activiti.finishCurrentTaskByTaskId(taskId);
        //修改工程状态
        if (projectMessageService.updateProStatus(id, status) >= 0) {
            return "success";
        }
        return "error";
    }

    /**
     * 交警通过处理
     *
     * @param taskId taskId
     * @return s
     */
    @RequestMapping("/industryPerform.do")
    @ResponseBody
    public String industryPerform(String taskId, Integer id, Integer status) {
        activiti.finishCurrentTaskByTaskId(taskId);
        if (projectMessageService.updateProStatus(id, status) >= 0) {
            return "success";
        }
        return "error";
    }
}
