package com.codegenerate.ownermanage.controller;

import java.io.InputStream;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import com.ibusiness.common.service.CommonBusiness;
import net.sf.json.JSONObject;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import org.springframework.web.multipart.MultipartFile;
import com.ibusiness.common.export.ExcelCommon;
import com.ibusiness.common.export.TableModel;
import com.ibusiness.common.service.FormulaCommon;

import com.ibusiness.security.util.SpringSecurityUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import org.activiti.engine.impl.interceptor.Command;
import org.activiti.engine.task.Task;
import org.apache.commons.io.IOUtils;

import com.ibusiness.common.model.ConfSelectItem;
import com.ibusiness.bpm.cmd.ProcessInstanceDiagramCmd;
import com.ibusiness.bpm.service.BpmComBusiness;
import com.ibusiness.core.spring.MessageHelper;
import com.ibusiness.common.page.PropertyFilter;
import com.ibusiness.common.page.Page;
import com.ibusiness.common.util.CommonUtils;
import com.ibusiness.security.util.SpringSecurityUtils;

import com.codegenerate.ownermanage.entity.Owner_infoEntity;
import com.codegenerate.ownermanage.service.Owner_infoService;
import com.codegenerate.ownermanage.entity.Owner_familyEntity;
import com.codegenerate.ownermanage.service.Owner_familyService;

/**   
 * @Title: Controller
 * @Description: 业主表页面
 * @author JiangBo
 *
 */
@Controller
@RequestMapping("owner_info")
public class Owner_infoController {

    private MessageHelper messageHelper;
    private Owner_infoService owner_infoService;
        private Owner_familyService owner_familyService;
   /**
     * 列表
     */
    @RequestMapping("owner_info-list")
    public String list(@ModelAttribute Page page,  @RequestParam Map<String, Object> parameterMap, Model model) {
        // 查询条件Filter过滤器
        List<PropertyFilter> propertyFilters = PropertyFilter.buildFromMap(parameterMap);
        // 根据条件查询数据
        page = owner_infoService.pagedQuery(page, propertyFilters);
        model.addAttribute("page", page);
        // 返回JSP
        return "codegenerate/ownermanage/owner_info-list.jsp";
    }
    /**
     * 新建一条流程, 进入流程表单信息页面
     * @param id
     * @param model
     * @return
     */
    @RequestMapping("owner_info-input")
    public String input(@ModelAttribute Page page,  @RequestParam(value = "id", required = false) String id, Model model) {
        Owner_infoEntity entity = null;
        if (!CommonUtils.isNull(id)) {
            entity = owner_infoService.get(id);
        } else {
            entity = new Owner_infoEntity();
        }
        // 默认值公式
        entity = (Owner_infoEntity) new FormulaCommon().defaultValue(entity, "IB_OWNER_INFO");
        
        model.addAttribute("model", entity);
        // 子表信息
        Map<String, Object> map = new HashMap<String, Object>();
        List<PropertyFilter> propertyFilters = PropertyFilter.buildFromMap(map);
        propertyFilters.add(new PropertyFilter("EQS_parentid", id));
        // 根据条件查询数据
	        page = owner_familyService.pagedQuery(page, propertyFilters);
	        model.addAttribute("page", page);
        
        // 在controller中设置页面控件用的数据
                Map<String, com.ibusiness.component.form.entity.ConfFormTableColumn> ownersexFTCMap= CommonBusiness.getInstance().getFormTableColumnMap("IB_OWNER_INFO", "ownerInfo");List<com.ibusiness.common.model.ConfSelectItem> ownersexItems = (List<com.ibusiness.common.model.ConfSelectItem>) CommonUtils.getListFromJson(ownersexFTCMap.get("OWNERSEX").getConfSelectInfo(), com.ibusiness.common.model.ConfSelectItem.class);model.addAttribute("ownersexItems", ownersexItems);
                Map<String, com.ibusiness.component.form.entity.ConfFormTableColumn> houseidFTCMap= CommonBusiness.getInstance().getFormTableColumnMap("IB_OWNER_INFO", "ownerInfo");JSONObject houseidJsonObj = JSONObject.fromObject(houseidFTCMap.get("HOUSEID").getConfSelectInfo());String houseidSql = houseidJsonObj.getString("sql");List<Map<String,Object>> houseidList = com.ibusiness.core.spring.ApplicationContextHelper.getBean(com.ibusiness.common.service.CommonBaseService.class).getJdbcTemplate().queryForList(houseidSql);List<ConfSelectItem> houseidItems = new java.util.ArrayList<ConfSelectItem>();for (Map<String,Object> mapBean : houseidList) {    ConfSelectItem confSelectItem = new ConfSelectItem();    confSelectItem.setKey(mapBean.get("vKey").toString());    confSelectItem.setValue(mapBean.get("vValue").toString());    houseidItems.add(confSelectItem);}model.addAttribute("houseidItems", houseidItems);
                Map<String, com.ibusiness.component.form.entity.ConfFormTableColumn> roomidFTCMap= CommonBusiness.getInstance().getFormTableColumnMap("IB_OWNER_INFO", "ownerInfo");JSONObject roomidJsonObj = JSONObject.fromObject(roomidFTCMap.get("ROOMID").getConfSelectInfo());String roomidSql = roomidJsonObj.getString("sql");List<Map<String,Object>> roomidList = com.ibusiness.core.spring.ApplicationContextHelper.getBean(com.ibusiness.common.service.CommonBaseService.class).getJdbcTemplate().queryForList(roomidSql);List<ConfSelectItem> roomidItems = new java.util.ArrayList<ConfSelectItem>();for (Map<String,Object> mapBean : roomidList) {    ConfSelectItem confSelectItem = new ConfSelectItem();    confSelectItem.setKey(mapBean.get("vKey").toString());    confSelectItem.setValue(mapBean.get("vValue").toString());    roomidItems.add(confSelectItem);}model.addAttribute("roomidItems", roomidItems);
        return "codegenerate/ownermanage/owner_info-input.jsp";
    }
    
    /**
     * 子表新建
     */
    @RequestMapping("owner_family-input")
    public String owner_familyInput(@RequestParam(value = "flowId", required = false) String flowId, @RequestParam("id") String id, @RequestParam("subId") String subId, Model model) {
        Owner_familyEntity entity = owner_familyService.get(subId);
        model.addAttribute("model", entity);
        model.addAttribute("parentid", id);
        model.addAttribute("flowId", flowId);
        return "codegenerate/ownermanage/owner_family-input.jsp";
    }
    /**
     * 保存主表
     * 
     * @return
     * @throws Exception
     */
    @RequestMapping("owner_info-save")
    public String saveDraft(@ModelAttribute Owner_infoEntity entity, RedirectAttributes redirectAttributes) throws Exception {
        // 再进行数据复制
        String id = entity.getId();
        if (CommonUtils.isNull(id)) {
            entity.setId(UUID.randomUUID().toString());
            owner_infoService.insert(entity);
            id = entity.getId();
        } else {
            owner_infoService.update(entity);
        }
        messageHelper.addFlashMessage(redirectAttributes, "core.success.save", "保存成功");
        return "redirect:/owner_info/owner_info-input.do?id=" + id;
    }
    /**
     * 子表保存
     */
    @RequestMapping("owner_family-save")
    public String subSave(@ModelAttribute Owner_familyEntity entity, @RequestParam(value = "flowId", required = false) String flowId, @RequestParam(value = "parentid", required = false) String parentid, RedirectAttributes redirectAttributes) throws Exception {
        String id = entity.getId();
        if (CommonUtils.isNull(id)) {
            id = UUID.randomUUID().toString();
            entity.setId(id);
            entity.setParentid(parentid);
            owner_familyService.insert(entity);
        } else {
            owner_familyService.update(entity);
        }
        messageHelper.addFlashMessage(redirectAttributes, "core.success.save", "保存成功");
        return "redirect:/owner_info/owner_info-input.do?id=" + entity.getParentid();
    }
    /**
     * 子表 excel导出
     */
    @SuppressWarnings("unchecked")
    @RequestMapping("owner_family-export")
    public void excelOwner_familyExport(@ModelAttribute Page page, @RequestParam Map<String, Object> parameterMap, HttpServletResponse response) {
        List<PropertyFilter> propertyFilters = PropertyFilter.buildFromMap(parameterMap);
        page = owner_familyService.pagedQuery(page, propertyFilters);
        List<Owner_familyEntity> beans = (List<Owner_familyEntity>) page.getResult();

        TableModel tableModel = new TableModel();
        // excel文件名
        tableModel.setExcelName("业主表页面"+CommonUtils.getInstance().getCurrentDateTime());
        // 列名
        tableModel.addHeaders();
        tableModel.setTableName("IB_OWNER_INFO");
        tableModel.setData(beans);
        try {
            new ExcelCommon().exportExcel(response, tableModel);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    /**
     * 子表 excel导入
     */
    @RequestMapping("owner_family-importExcel")
    public String importOwner_familyExport(@RequestParam("attachment") MultipartFile attachment, @RequestParam(value = "parentid", required = false) String parentid, HttpServletResponse response) {
        try {
            File file = new File("test.xls"); 
            attachment.transferTo(file);
            // 
            TableModel tableModel = new TableModel();
            // 列名
            tableModel.addHeaders();
            // 导入
            new ExcelCommon().uploadExcel(file, tableModel, "com.codegenerate.ownermanage.entity.Owner_familyEntity");
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "redirect:/owner_info/owner_info-input.do?id=" + parentid;
    }
    /**
     * 删除一条流程信息
     * @param selectedItem
     * @param redirectAttributes
     * @return
     */
    @RequestMapping("owner_info-remove")
    public String remove(@RequestParam("selectedItem") List<String> selectedItem, @RequestParam(value = "flowId", required = false) String flowId, RedirectAttributes redirectAttributes) {
        List<Owner_infoEntity> entitys = owner_infoService.findByIds(selectedItem);
        for (Owner_infoEntity entity : entitys) {
            owner_infoService.remove(entity);
        }
        messageHelper.addFlashMessage(redirectAttributes, "core.success.delete", "删除成功");

        return "redirect:/owner_info/owner_info-list.do?flowId=" + flowId;
    }
    
    // ======================================================================
    @Resource
    public void setMessageHelper(MessageHelper messageHelper) {
        this.messageHelper = messageHelper;
    }
    @Resource
    public void setOwner_infoService(Owner_infoService owner_infoService) {
        this.owner_infoService = owner_infoService;
    }
        @Resource
	    public void setOwner_familyService(Owner_familyService owner_familyService) {
	        this.owner_familyService = owner_familyService;
	    }
}
