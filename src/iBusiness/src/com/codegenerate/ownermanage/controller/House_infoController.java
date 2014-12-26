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

import com.codegenerate.ownermanage.entity.House_infoEntity;
import com.codegenerate.ownermanage.service.House_infoService;

/**   
 * @Title: Controller
 * @Description: 楼栋信息表页面
 * @author JiangBo
 *
 */
@Controller
@RequestMapping("house_info")
public class House_infoController {

    private MessageHelper messageHelper;
    private House_infoService house_infoService;
   /**
     * 列表
     */
    @RequestMapping("house_info-list")
    public String list(@ModelAttribute Page page, @RequestParam Map<String, Object> parameterMap, Model model) {
        // 查询条件Filter过滤器
        List<PropertyFilter> propertyFilters = PropertyFilter.buildFromMap(parameterMap);
        // 根据条件查询数据
        page = house_infoService.pagedQuery(page, propertyFilters);
        model.addAttribute("page", page);
        // 返回JSP
        return "codegenerate/ownermanage/house_info-list.jsp";
    }
    
    /**
     * 插入
     * @param id
     * @param model
     * @return
     */
    @RequestMapping("house_info-input")
    public String input(@RequestParam(value = "id", required = false) String id, Model model) {
        House_infoEntity entity = null;
        if (!CommonUtils.isNull(id)) {
            entity = house_infoService.get(id);
        } else {
            entity = new House_infoEntity();
        }
        
        // 默认值公式
        entity = (House_infoEntity) new FormulaCommon().defaultValue(entity, "IB_HOUSE_INFO");
        
        model.addAttribute("model", entity);
        
        // 在controller中设置页面控件用的数据
        return "codegenerate/ownermanage/house_info-input.jsp";
    }

    /**
     * 保存
     * 
     * @return
     * @throws Exception
     */
    @RequestMapping("house_info-save")
    public String save(@ModelAttribute House_infoEntity entity, RedirectAttributes redirectAttributes) throws Exception {
        // 先进行校验
        // 再进行数据复制
        String id = entity.getId();
        if (CommonUtils.isNull(id)) {
            entity.setId(UUID.randomUUID().toString());
            house_infoService.insert(entity);
        } else {
            house_infoService.update(entity);
        }
        messageHelper.addFlashMessage(redirectAttributes, "core.success.save", "保存成功");
        return "redirect:/house_info/house_info-list.do";
    }
   /**
     * 删除
     * @param selectedItem
     * @param redirectAttributes
     * @return
     */
    @RequestMapping("house_info-remove")
    public String remove(@RequestParam("selectedItem") List<String> selectedItem, RedirectAttributes redirectAttributes) {
        List<House_infoEntity> entitys = house_infoService.findByIds(selectedItem);
        for (House_infoEntity entity : entitys) {
            house_infoService.remove(entity);
        }
        messageHelper.addFlashMessage(redirectAttributes, "core.success.delete", "删除成功");

        return "redirect:/house_info/house_info-list.do";
    }
    /**
     * excel导出
     */
    @SuppressWarnings("unchecked")
    @RequestMapping("house_info-export")
    public void excelExport(@ModelAttribute Page page, @RequestParam Map<String, Object> parameterMap, HttpServletResponse response) {
        List<PropertyFilter> propertyFilters = PropertyFilter.buildFromMap(parameterMap);
        page = house_infoService.pagedQuery(page, propertyFilters);
        List<House_infoEntity> beans = (List<House_infoEntity>) page.getResult();

        TableModel tableModel = new TableModel();
        // excel文件名
        tableModel.setExcelName("楼栋信息表页面"+CommonUtils.getInstance().getCurrentDateTime());
        // 列名
        tableModel.addHeaders("id", "houseid", "housename", "buildstarttime", "buildendtime", "housebug", "housearea");
        tableModel.setTableName("IB_HOUSE_INFO");
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
    @RequestMapping("house_info-importExcel")
    public String importExport(@RequestParam("attachment") MultipartFile attachment, HttpServletResponse response) {
        try {
            File file = new File("test.xls"); 
            attachment.transferTo(file);
            // 
            TableModel tableModel = new TableModel();
            // 列名
            tableModel.addHeaders("id", "houseid", "housename", "buildstarttime", "buildendtime", "housebug", "housearea");
            // 导入
            new ExcelCommon().uploadExcel(file, tableModel, "com.codegenerate.ownermanage.entity.House_infoEntity");
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "redirect:/house_info/house_info-list.do";
    }
    // ======================================================================
    @Resource
    public void setMessageHelper(MessageHelper messageHelper) {
        this.messageHelper = messageHelper;
    }

    @Resource
    public void setHouse_infoService(House_infoService house_infoService) {
        this.house_infoService = house_infoService;
    }
    
}
