package com.codegenerate.ownermanage.controller;

import java.util.List;
import java.util.Map;
import java.util.UUID;
import net.sf.json.JSONObject;

import javax.annotation.Resource;
import java.io.File;
import javax.servlet.http.HttpServletResponse;
import org.springframework.web.multipart.MultipartFile;
import com.ibusiness.common.export.ExcelCommon;
import com.ibusiness.common.export.TableModel;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.ibusiness.security.util.SpringSecurityUtils;
import com.ibusiness.common.model.ConfSelectItem;
import com.ibusiness.common.service.CommonBusiness;
import com.ibusiness.component.form.entity.ConfFormTableColumn;
import com.ibusiness.common.service.FormulaCommon;

import com.ibusiness.core.spring.MessageHelper;
import com.ibusiness.common.page.PropertyFilter;
import com.ibusiness.common.page.Page;
import com.ibusiness.common.util.CommonUtils;

import com.codegenerate.ownermanage.entity.CarparkEntity;
import com.codegenerate.ownermanage.service.CarparkService;

/**   
 * @Title: Controller
 * @Description: 车位/车库管理页面
 * @author JiangBo
 *
 */
@Controller
@RequestMapping("carpark")
public class CarparkController {

    private MessageHelper messageHelper;
    private CarparkService carparkService;
   /**
     * 列表
     */
    @RequestMapping("carpark-list")
    public String list(@ModelAttribute Page page, @RequestParam Map<String, Object> parameterMap, Model model) {
        // 查询条件Filter过滤器
        List<PropertyFilter> propertyFilters = PropertyFilter.buildFromMap(parameterMap);
        // 根据条件查询数据
        page = carparkService.pagedQuery(page, propertyFilters);
        model.addAttribute("page", page);
        // 返回JSP
        return "codegenerate/ownermanage/carpark-list.jsp";
    }
    
    /**
     * 插入
     * @param id
     * @param model
     * @return
     */
    @RequestMapping("carpark-input")
    public String input(@RequestParam(value = "id", required = false) String id, Model model) {
        CarparkEntity entity = null;
        if (!CommonUtils.isNull(id)) {
            entity = carparkService.get(id);
        } else {
            entity = new CarparkEntity();
        }
        
        // 默认值公式
        entity = (CarparkEntity) new FormulaCommon().defaultValue(entity, "IB_CARPARK");
        
        model.addAttribute("model", entity);
        
        // 在controller中设置页面控件用的数据
                Map<String, com.ibusiness.component.form.entity.ConfFormTableColumn> roomidFTCMap= CommonBusiness.getInstance().getFormTableColumnMap("IB_CARPARK", "carpark");JSONObject roomidJsonObj = JSONObject.fromObject(roomidFTCMap.get("ROOMID").getConfSelectInfo());String roomidSql = roomidJsonObj.getString("sql");List<Map<String,Object>> roomidList = com.ibusiness.core.spring.ApplicationContextHelper.getBean(com.ibusiness.common.service.CommonBaseService.class).getJdbcTemplate().queryForList(roomidSql);List<ConfSelectItem> roomidItems = new java.util.ArrayList<ConfSelectItem>();for (Map<String,Object> mapBean : roomidList) {    ConfSelectItem confSelectItem = new ConfSelectItem();    confSelectItem.setKey(mapBean.get("vKey").toString());    confSelectItem.setValue(mapBean.get("vValue").toString());    roomidItems.add(confSelectItem);}model.addAttribute("roomidItems", roomidItems);
        return "codegenerate/ownermanage/carpark-input.jsp";
    }

    /**
     * 保存
     * 
     * @return
     * @throws Exception
     */
    @RequestMapping("carpark-save")
    public String save(@ModelAttribute CarparkEntity entity, RedirectAttributes redirectAttributes) throws Exception {
        // 先进行校验
        // 再进行数据复制
        String id = entity.getId();
        if (CommonUtils.isNull(id)) {
            entity.setId(UUID.randomUUID().toString());
            carparkService.insert(entity);
        } else {
            carparkService.update(entity);
        }
        messageHelper.addFlashMessage(redirectAttributes, "core.success.save", "保存成功");
        return "redirect:/carpark/carpark-list.do";
    }
   /**
     * 删除
     * @param selectedItem
     * @param redirectAttributes
     * @return
     */
    @RequestMapping("carpark-remove")
    public String remove(@RequestParam("selectedItem") List<String> selectedItem, RedirectAttributes redirectAttributes) {
        List<CarparkEntity> entitys = carparkService.findByIds(selectedItem);
        for (CarparkEntity entity : entitys) {
            carparkService.remove(entity);
        }
        messageHelper.addFlashMessage(redirectAttributes, "core.success.delete", "删除成功");

        return "redirect:/carpark/carpark-list.do";
    }
    /**
     * excel导出
     */
    @SuppressWarnings("unchecked")
    @RequestMapping("carpark-export")
    public void excelExport(@ModelAttribute Page page, @RequestParam Map<String, Object> parameterMap, HttpServletResponse response) {
        List<PropertyFilter> propertyFilters = PropertyFilter.buildFromMap(parameterMap);
        page = carparkService.pagedQuery(page, propertyFilters);
        List<CarparkEntity> beans = (List<CarparkEntity>) page.getResult();

        TableModel tableModel = new TableModel();
        // excel文件名
        tableModel.setExcelName("车位/车库管理页面"+CommonUtils.getInstance().getCurrentDateTime());
        // 列名
        tableModel.addHeaders("id", "stallname", "area", "roomid", "rent", "describeremark");
        tableModel.setTableName("IB_CARPARK");
        tableModel.setData(beans);
        try {
            new ExcelCommon().exportExcel(response, tableModel);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    /**
     * excel导入
     */
    @RequestMapping("carpark-importExcel")
    public String importExport(@RequestParam("attachment") MultipartFile attachment, HttpServletResponse response) {
        try {
            File file = new File("test.xls"); 
            attachment.transferTo(file);
            // 
            TableModel tableModel = new TableModel();
            // 列名
            tableModel.addHeaders("id", "stallname", "area", "roomid", "rent", "describeremark");
            // 导入
            new ExcelCommon().uploadExcel(file, tableModel, "com.codegenerate.ownermanage.entity.CarparkEntity");
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "redirect:/carpark/carpark-list.do";
    }
    // ======================================================================
    @Resource
    public void setMessageHelper(MessageHelper messageHelper) {
        this.messageHelper = messageHelper;
    }

    @Resource
    public void setCarparkService(CarparkService carparkService) {
        this.carparkService = carparkService;
    }
    
}
