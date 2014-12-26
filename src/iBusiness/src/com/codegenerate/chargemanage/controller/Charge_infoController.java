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

import com.codegenerate.chargemanage.entity.Charge_infoEntity;
import com.codegenerate.chargemanage.service.Charge_infoService;

/**   
 * @Title: Controller
 * @Description: 收费项目表页面
 * @author JiangBo
 *
 */
@Controller
@RequestMapping("charge_info")
public class Charge_infoController {

    private MessageHelper messageHelper;
    private Charge_infoService charge_infoService;
   /**
     * 列表
     */
    @RequestMapping("charge_info-list")
    public String list(@ModelAttribute Page page, @RequestParam Map<String, Object> parameterMap, Model model) {
        // 查询条件Filter过滤器
        List<PropertyFilter> propertyFilters = PropertyFilter.buildFromMap(parameterMap);
        // 根据条件查询数据
        page = charge_infoService.pagedQuery(page, propertyFilters);
        model.addAttribute("page", page);
        // 返回JSP
        return "codegenerate/chargemanage/charge_info-list.jsp";
    }
    
    /**
     * 插入
     * @param id
     * @param model
     * @return
     */
    @RequestMapping("charge_info-input")
    public String input(@RequestParam(value = "id", required = false) String id, Model model) {
        Charge_infoEntity entity = null;
        if (!CommonUtils.isNull(id)) {
            entity = charge_infoService.get(id);
        } else {
            entity = new Charge_infoEntity();
        }
        
        // 默认值公式
        entity = (Charge_infoEntity) new FormulaCommon().defaultValue(entity, "IB_CHARGE_INFO");
        
        model.addAttribute("model", entity);
        
        // 在controller中设置页面控件用的数据
        return "codegenerate/chargemanage/charge_info-input.jsp";
    }

    /**
     * 保存
     * 
     * @return
     * @throws Exception
     */
    @RequestMapping("charge_info-save")
    public String save(@ModelAttribute Charge_infoEntity entity, RedirectAttributes redirectAttributes) throws Exception {
        // 先进行校验
        // 再进行数据复制
        String id = entity.getId();
        if (CommonUtils.isNull(id)) {
            entity.setId(UUID.randomUUID().toString());
            charge_infoService.insert(entity);
        } else {
            charge_infoService.update(entity);
        }
        messageHelper.addFlashMessage(redirectAttributes, "core.success.save", "保存成功");
        return "redirect:/charge_info/charge_info-list.do";
    }
   /**
     * 删除
     * @param selectedItem
     * @param redirectAttributes
     * @return
     */
    @RequestMapping("charge_info-remove")
    public String remove(@RequestParam("selectedItem") List<String> selectedItem, RedirectAttributes redirectAttributes) {
        List<Charge_infoEntity> entitys = charge_infoService.findByIds(selectedItem);
        for (Charge_infoEntity entity : entitys) {
            charge_infoService.remove(entity);
        }
        messageHelper.addFlashMessage(redirectAttributes, "core.success.delete", "删除成功");

        return "redirect:/charge_info/charge_info-list.do";
    }
    /**
     * excel导出
     */
    @SuppressWarnings("unchecked")
    @RequestMapping("charge_info-export")
    public void excelExport(@ModelAttribute Page page, @RequestParam Map<String, Object> parameterMap, HttpServletResponse response) {
        List<PropertyFilter> propertyFilters = PropertyFilter.buildFromMap(parameterMap);
        page = charge_infoService.pagedQuery(page, propertyFilters);
        List<Charge_infoEntity> beans = (List<Charge_infoEntity>) page.getResult();

        TableModel tableModel = new TableModel();
        // excel文件名
        tableModel.setExcelName("收费项目表页面"+CommonUtils.getInstance().getCurrentDateTime());
        // 列名
        tableModel.addHeaders("id", "chargeid", "chargename", "chargestandard");
        tableModel.setTableName("IB_CHARGE_INFO");
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
    @RequestMapping("charge_info-importExcel")
    public String importExport(@RequestParam("attachment") MultipartFile attachment, HttpServletResponse response) {
        try {
            File file = new File("test.xls"); 
            attachment.transferTo(file);
            // 
            TableModel tableModel = new TableModel();
            // 列名
            tableModel.addHeaders("id", "chargeid", "chargename", "chargestandard");
            // 导入
            new ExcelCommon().uploadExcel(file, tableModel, "com.codegenerate.chargemanage.entity.Charge_infoEntity");
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "redirect:/charge_info/charge_info-list.do";
    }
    // ======================================================================
    @Resource
    public void setMessageHelper(MessageHelper messageHelper) {
        this.messageHelper = messageHelper;
    }

    @Resource
    public void setCharge_infoService(Charge_infoService charge_infoService) {
        this.charge_infoService = charge_infoService;
    }
    
}
