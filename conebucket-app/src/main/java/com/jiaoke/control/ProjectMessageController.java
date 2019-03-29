package com.jiaoke.control;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.jiaoke.bean.*;
import com.jiaoke.service.*;
import com.jiaoke.util.JsonHelper;
import com.jiaoke.web.dao.ProjectScheduleMapper;
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
import java.util.Map;

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
    private ProjectStatusService projectStatusService;

    @Resource
    private ProjectScheduleService projectScheduleService;

    @Resource
    private Activiti activiti;

    /**
     * 跳转工程管理首页
     *
     * @return project_manage.jsp
     */
    @RequestMapping("/toIndex.do")
    public String toIndex(Model model) {
        //流程节点数量
        //未上报数量
        int notReported = projectMessageService.count(0);
        //未审批数量
        int industryApprovalNumber = activiti.getTaskNumber("industryApproval");
        //未确认数量
        int policeConfirmationNumber = activiti.getTaskNumber("policeConfirmation");
        //工程实施数量
        int projectImplementNumber = activiti.getTaskNumber("projectImplementation");
        //已完成数量
        List<HistoricProcessInstance> completed = activiti.queryHistoricProcessInstance();

        //筛选下拉框内容
        //工程状态
        List<ProjectStatus> projectStatusList = projectStatusService.selectAll();
        //工程进度
        List<ProjectSchedule> projectScheduleList = projectScheduleService.selectAll();
        //工程类型
        List<ProjectType> projectTypeList = projectTypeService.selectAll();

        model.addAttribute("industryApprovalNumber", industryApprovalNumber);
        model.addAttribute("policeConfirmationNumber", policeConfirmationNumber);
        model.addAttribute("projectImplementNumber", projectImplementNumber);
        model.addAttribute("completed", completed.size());
        model.addAttribute("projectStatusList", projectStatusList);
        model.addAttribute("projectScheduleList", projectScheduleList);
        model.addAttribute("projectTypeList", projectTypeList);
        model.addAttribute("notReported", notReported);
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
     * 跳转查询工程首页
     *
     * @return project_manage.jsp
     */
    @RequestMapping("/toProjectQueryIndex.do")
    public String toProjectQueryIndex(Model model) {
        //工程状态
        List<ProjectStatus> projectStatusList = projectStatusService.selectAll();
        //工程进度
        List<ProjectSchedule> projectScheduleList = projectScheduleService.selectAll();
        //工程类型
        List<ProjectType> projectTypeList = projectTypeService.selectAll();
        model.addAttribute("projectStatusList", projectStatusList);
        model.addAttribute("projectScheduleList", projectScheduleList);
        model.addAttribute("projectTypeList", projectTypeList);
        return "project/project_query";
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
    @RequestMapping(value = "/getProMessageByCondition.do", method = RequestMethod.POST)
    @ResponseBody
    public String getProMessageByCondition(@RequestParam("page") int page,
                                           @RequestParam("proName") String proName,
                                           @RequestParam("proSchedule") String proSchedule,
                                           @RequestParam("proType") String proType,
                                           @RequestParam("proStatus") String proStatus) {
        PageHelper.startPage(page, 10);
        List<ProjectMessage> projectMessageList = projectMessageService.getProMessageByCondition(proName, proSchedule, proType, proStatus);
        PageInfo<ProjectMessage> pageInfo = new PageInfo<ProjectMessage>(projectMessageList);
        return JsonHelper.toJSONString(pageInfo);

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
     * 加载未上报工程
     *
     * @return list
     */
    @RequestMapping("/notReported.do")
    @ResponseBody
    public String notReported(@RequestParam("page") int page,
                              @RequestParam("proName") String proName,
                              @RequestParam("proSchedule") String proSchedule,
                              @RequestParam("proType") String proType,
                              @RequestParam("proStatus") String proStatus) {
        HashMap<String, Object> map = new HashMap<>(16);
        PageHelper.startPage(page, 8);
        List<ProjectMessage> projectMessageList = projectMessageService.getProMessageByCondition(proName, proSchedule, proType, proStatus);
        PageInfo<ProjectMessage> pageInfo = new PageInfo<>(projectMessageList);

        //流程节点数量
        //未上报数量
        int notReported = projectMessageService.count(0);
        map.put("notReported", notReported);
        //未审批数量
        int industryApprovalNumber = activiti.getTaskNumber("industryApproval");
        map.put("industryApprovalNumber", industryApprovalNumber);
        //未确认数量
        int policeConfirmationNumber = activiti.getTaskNumber("policeConfirmation");
        map.put("policeConfirmationNumber", policeConfirmationNumber);
        //工程实施数量
        int projectImplementNumber = activiti.getTaskNumber("projectImplementation");
        map.put("projectImplementNumber", projectImplementNumber);
        //已完成数量
        List<HistoricProcessInstance> completed = activiti.queryHistoricProcessInstance();
        map.put("completed", completed.size());
        map.put("pageInfo", pageInfo);
        return JsonHelper.toJSONString(map);
    }

    /**
     * 工程上报
     *
     * @param id     工程id
     * @param status 状态
     * @return s
     */
    @RequestMapping("/projectReport.do")
    @ResponseBody
    public String projectReport(Integer id, Integer status) {
        //启动流程实例
        String processInstanceId = activiti.startProcessInstance("project_message", id.toString());
        if (activiti.queryTaskIdByProcessInstanceId(processInstanceId) != null) {
            //修改工程状态
            if (projectMessageService.updateProStatus(id, status) >= 0) {
                return "success";
            }
            return "error";
        }
        return "error";
    }

    /**
     * 根据Assignee获取任务
     *
     * @param page page
     * @return json
     */
    @RequestMapping("/getTaskByAssignee.do")
    @ResponseBody
    public String getTaskByAssignee(@RequestParam("assignee") String assignee,
                                    @RequestParam("page") int page,
                                    @RequestParam("proName") String proName,
                                    @RequestParam("proSchedule") String proSchedule,
                                    @RequestParam("proType") String proType,
                                    @RequestParam("proStatus") String proStatus) {

        List<Integer> list = new ArrayList<>();
        HashMap<String, String> hashMap = new HashMap<>(16);
        HashMap<String, Object> map = new HashMap<>(16);

        //流程节点数量
        //未上报数量
        int notReported = projectMessageService.count(0);
        map.put("notReported", notReported);
        //未审批数量
        int industryApprovalNumber = activiti.getTaskNumber("industryApproval");
        map.put("industryApprovalNumber", industryApprovalNumber);
        //未确认数量
        int policeConfirmationNumber = activiti.getTaskNumber("policeConfirmation");
        map.put("policeConfirmationNumber", policeConfirmationNumber);
        //工程实施数量
        int projectImplementNumber = activiti.getTaskNumber("projectImplementation");
        map.put("projectImplementNumber", projectImplementNumber);
        //已完成数量
        List<HistoricProcessInstance> completed = activiti.queryHistoricProcessInstance();
        map.put("completed", completed.size());

        List<Task> taskList = activiti.queryTask(assignee);
        if (taskList.size() < 1) {
            map.put("pageInfo", "");
            return JsonHelper.toJSONString(map);
        }
        for (Task task : taskList) {
            //根据taskId查询businessKey
            String businessKey = activiti.queryBusinessKey(task.getProcessInstanceId());
            list.add(Integer.valueOf(businessKey));
            hashMap.put(task.getId(), businessKey);
        }

        PageHelper.startPage(page, 8);
        List<ProjectMessage> projectMessageList = projectMessageService.selectByBusinessKey(list, proName, proSchedule, proType, proStatus);

        for (Map.Entry<String, String> entry : hashMap.entrySet()) {
            for (ProjectMessage projectMessage : projectMessageList) {
                if (projectMessage.getId().equals(Integer.valueOf(entry.getValue()))) {
                    projectMessage.setTaskId(entry.getKey());
                }
            }
        }

        PageInfo<ProjectMessage> pageInfo = new PageInfo<>(projectMessageList);
        map.put("pageInfo", pageInfo);
        return JsonHelper.toJSONString(map);
    }

    /**
     * 竣工完成
     *
     * @param page page
     * @return json
     */
    @RequestMapping("/completion.do")
    @ResponseBody
    public String completion(@RequestParam("page") int page,
                             @RequestParam("proName") String proName,
                             @RequestParam("proSchedule") String proSchedule,
                             @RequestParam("proType") String proType,
                             @RequestParam("proStatus") String proStatus) {

        List<Integer> list = new ArrayList<>();
        HashMap<String, Object> map = new HashMap<>(16);
        //查询已审批完成的工程
        List<HistoricProcessInstance> historicProcessInstanceList = activiti.queryHistoricProcessInstance();
        for (HistoricProcessInstance historicProcessInstance : historicProcessInstanceList) {
            list.add(Integer.valueOf(historicProcessInstance.getBusinessKey()));
        }

        PageHelper.startPage(page, 8);
        //根据业务主键查询已完成工程
        List<ProjectMessage> projectMessageList = projectMessageService.selectByBusinessKey(list, proName, proSchedule, proType, proStatus);
        PageInfo<ProjectMessage> pageInfo = new PageInfo<>(projectMessageList);
        //流程节点数量
        //未上报数量
        int notReported = projectMessageService.count(0);
        map.put("notReported", notReported);
        //未审批数量
        int industryApprovalNumber = activiti.getTaskNumber("industryApproval");
        map.put("industryApprovalNumber", industryApprovalNumber);
        //未确认数量
        int policeConfirmationNumber = activiti.getTaskNumber("policeConfirmation");
        map.put("policeConfirmationNumber", policeConfirmationNumber);
        //工程实施数量
        int projectImplementNumber = activiti.getTaskNumber("projectImplementation");
        map.put("projectImplementNumber", projectImplementNumber);
        //已完成数量
        List<HistoricProcessInstance> completed = activiti.queryHistoricProcessInstance();
        map.put("completed", completed.size());
        map.put("pageInfo", pageInfo);
        return JsonHelper.toJSONString(map);
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

    /**
     * 项目进场
     *
     * @param id       id
     * @param schedule schedule
     * @return s
     */
    @RequestMapping("/startWork.do")
    @ResponseBody
    public String startWork(Integer id, Integer schedule) {
        if (projectMessageService.updateProSchedule(id, schedule) >= 0) {
            return "success";
        }
        return "error";
    }

    /**
     * 工程实施完工
     *
     * @param taskId taskId
     * @return s
     */
    @RequestMapping("/implementationPerform.do")
    @ResponseBody
    public String implementationPerform(String taskId, Integer id, Integer schedule) {
        activiti.finishCurrentTaskByTaskId(taskId);
        if (projectMessageService.updateProSchedule(id, schedule) >= 0) {
            return "success";
        }
        return "error";
    }


}
