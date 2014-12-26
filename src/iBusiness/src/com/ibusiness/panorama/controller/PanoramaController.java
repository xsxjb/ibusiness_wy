package com.ibusiness.panorama.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.annotation.Resource;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.activiti.engine.ProcessEngine;
import org.activiti.engine.RepositoryService;
import org.activiti.engine.repository.Deployment;
import org.activiti.engine.repository.ProcessDefinition;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ibusiness.bpm.dao.BpmFlowNodeDao;
import com.ibusiness.bpm.dao.BpmProcessDao;
import com.ibusiness.bpm.dao.BpmProcessVersionDao;
import com.ibusiness.bpm.entity.BpmFlowNode;
import com.ibusiness.bpm.entity.BpmNodeColums;
import com.ibusiness.bpm.entity.BpmNodeTable;
import com.ibusiness.bpm.entity.BpmProcess;
import com.ibusiness.bpm.entity.BpmProcessVersion;
import com.ibusiness.bpm.service.BpmComBusiness;
import com.ibusiness.bpm.service.BpmNodeColumsService;
import com.ibusiness.common.util.CommonUtils;
import com.ibusiness.flowchart.entity.ConfFlowChart;
import com.ibusiness.flowchart.service.FlowChartService;

/**
 * 全景图
 * 
 * @author JiangBo
 * 
 */
@Controller
@RequestMapping("panorama")
public class PanoramaController {

    
    /**
     * 流程图信息初始化
     * 
     * @param flowId
     * @return
     */
    @RequestMapping("panorama-init")
    public String initFlowChart(Model model) {
        
        return "ibusiness/panorama/panorama-show.jsp";
    }

    // ======================================================================
//    @Resource
//    public void setFlowChartService(FlowChartService flowChartService) {
//        this.flowChartService = flowChartService;
//    }
}
