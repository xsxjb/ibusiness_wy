package com.codegenerate.chargemanage.controller;

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

import com.codegenerate.chargemanage.entity.Charge_payEntity;
import com.codegenerate.chargemanage.service.Charge_payService;

/**   
 * @Title: Controller
 * @Description: 业主缴费表页面
 * @author JiangBo
 *
 */
@Controller
@RequestMapping("charge_pay")
public class Charge_payController {

    private MessageHelper messageHelper;
    private Charge_payService charge_payService;
   /**
     * 列表
     */
    @RequestMapping("charge_pay-list")
    public String list(@ModelAttribute Page page, @RequestParam Map<String, Object> parameterMap, Model model) {
        // 查询条件Filter过滤器
        List<PropertyFilter> propertyFilters = PropertyFilter.buildFromMap(parameterMap);
        // 根据条件查询数据
        page = charge_payService.pagedQuery(page, propertyFilters);
        model.addAttribute("page", page);
        // 返回JSP
        return "codegenerate/chargemanage/charge_pay-list.jsp";
    }
    
    /**
     * 插入
     * @param id
     * @param model
     * @return
     */
    @RequestMapping("charge_pay-input")
    public String input(@RequestParam(value = "id", required = false) String id, Model model) {
        Charge_payEntity entity = null;
        if (!CommonUtils.isNull(id)) {
            entity = charge_payService.get(id);
        } else {
            entity = new Charge_payEntity();
        }
        
        // 默认值公式
        entity = (Charge_payEntity) new FormulaCommon().defaultValue(entity, "IB_CHARGE_PAY");
        
        model.addAttribute("model", entity);
        
        // 在controller中设置页面控件用的数据
                Map<String, com.ibusiness.component.form.entity.ConfFormTableColumn> chargenameFTCMap= CommonBusiness.getInstance().getFormTableColumnMap("IB_CHARGE_PAY", "chargePay");JSONObject chargenameJsonObj = JSONObject.fromObject(chargenameFTCMap.get("CHARGENAME").getConfSelectInfo());String chargenameSql = chargenameJsonObj.getString("sql");List<Map<String,Object>> chargenameList = com.ibusiness.core.spring.ApplicationContextHelper.getBean(com.ibusiness.common.service.CommonBaseService.class).getJdbcTemplate().queryForList(chargenameSql);List<ConfSelectItem> chargenameItems = new java.util.ArrayList<ConfSelectItem>();for (Map<String,Object> mapBean : chargenameList) {    ConfSelectItem confSelectItem = new ConfSelectItem();    confSelectItem.setKey(mapBean.get("vKey").toString());    confSelectItem.setValue(mapBean.get("vValue").toString());    chargenameItems.add(confSelectItem);}model.addAttribute("chargenameItems", chargenameItems);
                Map<String, com.ibusiness.component.form.entity.ConfFormTableColumn> owernameFTCMap= CommonBusiness.getInstance().getFormTableColumnMap("IB_CHARGE_PAY", "chargePay");JSONObject owernameJsonObj = JSONObject.fromObject(owernameFTCMap.get("OWERNAME").getConfSelectInfo());String owernameSql = owernameJsonObj.getString("sql");List<Map<String,Object>> owernameList = com.ibusiness.core.spring.ApplicationContextHelper.getBean(com.ibusiness.common.service.CommonBaseService.class).getJdbcTemplate().queryForList(owernameSql);List<ConfSelectItem> owernameItems = new java.util.ArrayList<ConfSelectItem>();for (Map<String,Object> mapBean : owernameList) {    ConfSelectItem confSelectItem = new ConfSelectItem();    confSelectItem.setKey(mapBean.get("vKey").toString());    confSelectItem.setValue(mapBean.get("vValue").toString());    owernameItems.add(confSelectItem);}model.addAttribute("owernameItems", owernameItems);
        return "codegenerate/chargemanage/charge_pay-input.jsp";
    }

    /**
     * 保存
     * 
     * @return
     * @throws Exception
     */
    @RequestMapping("charge_pay-save")
    public String save(@ModelAttribute Charge_payEntity entity, RedirectAttributes redirectAttributes) throws Exception {
        // 先进行校验
        // 再进行数据复制
        String id = entity.getId();
        if (CommonUtils.isNull(id)) {
            entity.setId(UUID.randomUUID().toString());
            charge_payService.insert(entity);
        } else {
            charge_payService.update(entity);
        }
        messageHelper.addFlashMessage(redirectAttributes, "core.success.save", "保存成功");
        return "redirect:/charge_pay/charge_pay-list.do";
    }
   /**
     * 删除
     * @param selectedItem
     * @param redirectAttributes
     * @return
     */
    @RequestMapping("charge_pay-remove")
    public String remove(@RequestParam("selectedItem") List<String> selectedItem, RedirectAttributes redirectAttributes) {
        List<Charge_payEntity> entitys = charge_payService.findByIds(selectedItem);
        for (Charge_payEntity entity : entitys) {
            charge_payService.remove(entity);
        }
        messageHelper.addFlashMessage(redirectAttributes, "core.success.delete", "删除成功");

        return "redirect:/charge_pay/charge_pay-list.do";
    }
    /**
     * excel导出
     */
    @SuppressWarnings("unchecked")
    @RequestMapping("charge_pay-export")
    public void excelExport(@ModelAttribute Page page, @RequestParam Map<String, Object> parameterMap, HttpServletResponse response) {
        List<PropertyFilter> propertyFilters = PropertyFilter.buildFromMap(parameterMap);
        page = charge_payService.pagedQuery(page, propertyFilters);
        List<Charge_payEntity> beans = (List<Charge_payEntity>) page.getResult();

        TableModel tableModel = new TableModel();
        // excel文件名
        tableModel.setExcelName("业主缴费表页面"+CommonUtils.getInstance().getCurrentDateTime());
        // 列名
        tableModel.addHeaders("id", "payid", "chargename", "chargestandard", "payreal", "paybalance", "chargetime", "owername", "paystate", "paymonth");
        tableModel.setTableName("IB_CHARGE_PAY");
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
    @RequestMapping("charge_pay-importExcel")
    public String importExport(@RequestParam("attachment") MultipartFile attachment, HttpServletResponse response) {
        try {
            File file = new File("test.xls"); 
            attachment.transferTo(file);
            // 
            TableModel tableModel = new TableModel();
            // 列名
            tableModel.addHeaders("id", "payid", "chargename", "chargestandard", "payreal", "paybalance", "chargetime", "owername", "paystate", "paymonth");
            // 导入
            new ExcelCommon().uploadExcel(file, tableModel, "com.codegenerate.chargemanage.entity.Charge_payEntity");
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "redirect:/charge_pay/charge_pay-list.do";
    }
    // ======================================================================
    @Resource
    public void setMessageHelper(MessageHelper messageHelper) {
        this.messageHelper = messageHelper;
    }

    @Resource
    public void setCharge_payService(Charge_payService charge_payService) {
        this.charge_payService = charge_payService;
    }
    
}
