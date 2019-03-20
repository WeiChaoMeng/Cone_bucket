package com.jiaoke.control;

import org.activiti.engine.HistoryService;
import org.activiti.engine.RepositoryService;
import org.activiti.engine.RuntimeService;
import org.activiti.engine.TaskService;
import org.activiti.engine.history.HistoricProcessInstance;
import org.activiti.engine.runtime.ProcessInstance;
import org.activiti.engine.task.Task;
import org.springframework.stereotype.Component;

import javax.annotation.Resource;
import java.util.List;

/**
 * @author lihui
 * @version 1.0
 * @date 2019/3/19 13:51
 */

@Component("activiti")
public class Activiti {

    @Resource
    private RepositoryService repositoryService;

    @Resource
    private RuntimeService runtimeService;

    @Resource
    private TaskService taskService;

    @Resource
    private HistoryService historyService;

    /**
     * 开启流程实例
     *
     * @param processDefinitionKey key
     * @param businessKey          businessKey
     * @return processInstanceId
     */
    public String startProcessInstance(String processDefinitionKey, String businessKey) {
        ProcessInstance processInstance = runtimeService.startProcessInstanceByKey(processDefinitionKey, businessKey);
        return processInstance.getRootProcessInstanceId();
    }

    /**
     * 根据Assignee查询任务
     *
     * @return taskList
     */
    public List<Task> queryTask(String assignee) {
        return taskService.createTaskQuery().taskAssignee(assignee).list();
    }

    /**
     * 根据processInstanceId查询业务键
     *
     * @return businessKey
     */
    public String queryBusinessKey(String processInstanceId) {
        HistoricProcessInstance historicProcessInstance = historyService.createHistoricProcessInstanceQuery().processInstanceId(processInstanceId).singleResult();
        return historicProcessInstance.getBusinessKey();
    }

    /**
     * 通过流程实例Id获取任务Id
     *
     * @param processInstanceId 流程实例ID
     * @return Task
     */
    public Task queryTaskIdByProcessInstanceId(String processInstanceId) {
        return taskService.createTaskQuery().processInstanceId(processInstanceId).singleResult();
    }

    /**
     * 已完成的流程实例
     *
     * @return Task
     */
    public List<HistoricProcessInstance> queryHistoricProcessInstance() {
        return historyService.createHistoricProcessInstanceQuery().finished().list();
    }

    /**
     * 已完成的流程实例
     *
     * @return Task
     */
    public void finishCurrentTaskByTaskId(String taskId) {
        this.taskService.complete(taskId);
    }


}
