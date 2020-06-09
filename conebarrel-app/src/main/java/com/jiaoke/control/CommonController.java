package com.jiaoke.control;

import com.jiaoke.bean.*;
import com.jiaoke.service.*;
import com.jiaoke.util.JsonHelper;
import org.activiti.engine.history.HistoricProcessInstance;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import java.util.List;

/**
 * 公共类
 *
 * @author Melone
 * @version 1.0
 * @date 2019/3/13 14:18
 */
@Controller
public class CommonController {

    @Resource
    private RoleInfoService roleInfoService;

    @Resource
    private PermissionService permissionService;

    @Resource
    private ProjectMessageService projectMessageService;

    @Resource
    private ProjectTypeService projectTypeService;

    @Resource
    private ProjectStatusService projectStatusService;

    @Resource
    private ProjectScheduleService projectScheduleService;

    @Resource
    private Activiti activiti;

    /**
     * 浏览器版本校验
     *
     * @return jsp
     */
    @RequestMapping("/")
    public String index() {
        return "login";
    }

    /**
     * 登录
     *
     * @return jsp
     */
    @RequestMapping("/login.do")
    public String login() {
        return "login";
    }

    /**
     * 版本过低页面
     *
     * @return jsp
     */
    @RequestMapping("/version.do")
    public String version() {
        return "version";
    }

    /**
     * 登录成功后进入系统首页
     *
     * @return main.jsp
     */
    @RequestMapping("/toHome.do")
    public String toHome() {
        return "home";
    }

    /**
     * 智慧锥桶首页
     *
     * @return main.jsp
     */
    @RequestMapping("/toConeBarrelHome.do")
    public String toMain() {
        return "final_main";
    }

    /**
     * 智慧锥桶页(对外)
     *
     * @return main.jsp
     */
    @RequestMapping("/toWisdomConeBarrel.do")
    public String toConeBarrelHome() {
        return "cone_barrel_home";
    }

    /*------------------------工程查询------------------------------*/
    /**
     * 工程查询
     *
     * @return main.jsp
     */
    @RequestMapping("/toProjectEnquiry.do")
    public String homePagesModel(Model model) {
        //工程状态
        List<ProjectStatus> projectStatusList = projectStatusService.selectAll();
        //工程进度
        List<ProjectSchedule> projectScheduleList = projectScheduleService.selectAll();
        //工程类型
        List<ProjectType> projectTypeList = projectTypeService.selectAll();
        //所有工程展示在地图
        List<ProjectMessage> projectMessageList = projectMessageService.selectAllData();
        model.addAttribute("projectStatusList", projectStatusList);
        model.addAttribute("projectScheduleList", projectScheduleList);
        model.addAttribute("projectTypeList", projectTypeList);
        model.addAttribute("projectMessageList", JsonHelper.toJSONString(projectMessageList));
        return "project/final_project_enquiry";
    }

    /*------------------------工程管理------------------------------*/
    /**
     * 跳转工程管理首页
     *
     * @return project_manage.jsp
     */
    @RequestMapping("/toProjectMessageIndex.do")
    public String toIndex(Model model) {
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
        return "project/final_project_manage";
    }

    /*----------------------------设备管理------------------------------*/
    /**
     * 锥桶管理
     *
     * @return cone_bucket_manage.jsp
     */
    @RequestMapping("/toConeBarrelManage.do")
    public String toConeBarrelManage(Model model, int page) {
        model.addAttribute("currentPage", page);
        return "bucket/final_cone_barrel_manage";
    }

    /*------------------------系统管理------------------------------*/
    /**
     * 跳转用户首页
     *
     * @return user.jsp
     */
    @RequestMapping("/toUserIndex.do")
    public String toUserIndex(Model model) {
        //加载角色列表
        List<RoleInfo> roleInfoList = roleInfoService.selectAll();
        model.addAttribute("roleInfoList", roleInfoList);
        return "system/final_user";
    }

    /**
     *  跳转角色首页
     *
     * @return role.jsp
     */
    @RequestMapping("/toRoleIndex.do")
    public String toRoleIndex(Model model) {
        //加载权限列表
        List<Permission> permissionList = permissionService.selectAll();
        model.addAttribute("permissionList", permissionList);
        return "system/final_role";
    }

    /**
     * 跳转权限首页
     *
     * @return permissions.jsp
     */
    @RequestMapping("/toPermissionsIndex.do")
    public String toPermissionsIndex() {
        return "system/final_permissions";
    }

    /**
     * 参数管理
     *
     * @return parameter.jsp
     */
    @RequestMapping("/toParameterIndex.do")
    public String toParameter() {
        return "system/final_parameter";
    }

    /*----------------------------日志管理-------------------------------------*/

    /**
     * 工程日志
     *
     * @return engineering_log.jsp
     */
    @RequestMapping("/toEngineeringLogIndex.do")
    public String toEngineeringLogIndex() {
        return "log/final_engineering_log";
    }

    /**
     * 锥桶日志
     *
     * @return engineering_log.jsp
     */
    @RequestMapping("/toConeBarrelLogIndex.do")
    public String toConeBarrelLogIndex() {
        return "log/final_cone_barrel_log";
    }

    /**
     * 预警日志
     *
     * @return alert_log.jsp
     */
    @RequestMapping("/toWarningLogIndex.do")
    public String toWarningLogIndex() {
        return "log/final_warning_log";
    }



    /*------------------历史方法--------------------*/

    /**
     * 参数管理
     *
     * @return parameter_configure.jsp
     */
    @RequestMapping("/parameterConfigure.do")
    public String parameterConfigure() {
        return "system/parameter_configure";
    }

    /**
     * 锥桶管理
     *
     * @return cone_bucket_manage.jsp
     */
    @RequestMapping("/coneBucketManage.do")
    public String coneBucketManage() {
        return "bucket/cone_bucket_manage";
    }

    /**
     * 工程日志
     *
     * @return engineering_log.jsp
     */
    @RequestMapping("/engineeringLog.do")
    public String engineeringLog() {
        return "log/engineering_log";
    }

    /**
     * 锥桶日志
     *
     * @return engineering_log.jsp
     */
    @RequestMapping("/coneBucketLog.do")
    public String coneBucketLog() {
        return "log/cone_bucket_log";
    }

    /**
     * 预警日志
     *
     * @return alert_log.jsp
     */
    @RequestMapping("/alertLog.do")
    public String alertLog() {
        return "log/alert_log";
    }


}
