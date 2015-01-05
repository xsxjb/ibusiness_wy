package com.codegenerate.maintaintask.controller;

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

import com.codegenerate.maintaintask.entity.MaintaintaskEntity;
import com.codegenerate.maintaintask.service.MaintaintaskService;

/**   
 * @Title: Controller
 * @Description: 检修任务单表页面
 * @author JiangBo
 *
 */
@Controller
@RequestMapping("maintaintask")
public class MaintaintaskController {

    private MessageHelper messageHelper;
    private MaintaintaskService maintaintaskService;
   /**
     * 列表
     */
    @RequestMapping("maintaintask-list")
    public String list(@ModelAttribute Page page, @RequestParam Map<String, Object> parameterMap, Model model) {
        // 查询条件Filter过滤器
        List<PropertyFilter> propertyFilters = PropertyFilter.buildFromMap(parameterMap);
        // 根据条件查询数据
        page = maintaintaskService.pagedQuery(page, propertyFilters);
        model.addAttribute("page", page);
        // 返回JSP
        return "codegenerate/maintaintask/maintaintask-list.jsp";
    }
    
    /**
     * 插入
     * @param id
     * @param model
     * @return
     */
    @RequestMapping("maintaintask-input")
    public String input(@RequestParam(value = "id", required = false) String id, Model model) {
        MaintaintaskEntity entity = null;
        if (!CommonUtils.isNull(id)) {
            entity = maintaintaskService.get(id);
        } else {
            entity = new MaintaintaskEntity();
        }
        
        // 默认值公式
        entity = (MaintaintaskEntity) new FormulaCommon().defaultValue(entity, "IB_MAINTAINTASK");
        
        model.addAttribute("model", entity);
        
        // 在controller中设置页面控件用的数据
                Map<String, com.ibusiness.component.form.entity.ConfFormTableColumn> overhauluserFTCMap= CommonBusiness.getInstance().getFormTableColumnMap("IB_MAINTAINTASK", "maintainTask");JSONObject overhauluserJsonObj = JSONObject.fromObject(overhauluserFTCMap.get("OVERHAULUSER").getConfSelectInfo());String overhauluserSql = overhauluserJsonObj.getString("sql");List<Map<String,Object>> overhauluserList = com.ibusiness.core.spring.ApplicationContextHelper.getBean(com.ibusiness.common.service.CommonBaseService.class).getJdbcTemplate().queryForList(overhauluserSql);List<ConfSelectItem> overhauluserItems = new java.util.ArrayList<ConfSelectItem>();for (Map<String,Object> mapBean : overhauluserList) {    ConfSelectItem confSelectItem = new ConfSelectItem();    confSelectItem.setKey(mapBean.get("vKey").toString());    confSelectItem.setValue(mapBean.get("vValue").toString());    overhauluserItems.add(confSelectItem);}model.addAttribute("overhauluserItems", overhauluserItems);
        return "codegenerate/maintaintask/maintaintask-input.jsp";
    }

    /**
     * 保存
     * 
     * @return
     * @throws Exception
     */
    @RequestMapping("maintaintask-save")
    public String save(@ModelAttribute MaintaintaskEntity entity, RedirectAttributes redirectAttributes) throws Exception {
        // 先进行校验
        // 再进行数据复制
        String id = entity.getId();
        if (CommonUtils.isNull(id)) {
            entity.setId(UUID.randomUUID().toString());
            maintaintaskService.insert(entity);
        } else {
            maintaintaskService.update(entity);
        }
        messageHelper.addFlashMessage(redirectAttributes, "core.success.save", "保存成功");
        return "redirect:/maintaintask/maintaintask-list.do";
    }
   /**
     * 删除
     * @param selectedItem
     * @param redirectAttributes
     * @return
     */
    @RequestMapping("maintaintask-remove")
    public String remove(@RequestParam("selectedItem") List<String> selectedItem, RedirectAttributes redirectAttributes) {
        List<MaintaintaskEntity> entitys = maintaintaskService.findByIds(selectedItem);
        for (MaintaintaskEntity entity : entitys) {
            maintaintaskService.remove(entity);
        }
        messageHelper.addFlashMessage(redirectAttributes, "core.success.delete", "删除成功");

        return "redirect:/maintaintask/maintaintask-list.do";
    }
    /**
     * excel导出
     */
    @SuppressWarnings("unchecked")
    @RequestMapping("maintaintask-export")
    public void excelExport(@ModelAttribute Page page, @RequestParam Map<String, Object> parameterMap, HttpServletResponse response) {
        List<PropertyFilter> propertyFilters = PropertyFilter.buildFromMap(parameterMap);
        page = maintaintaskService.pagedQuery(page, propertyFilters);
        List<MaintaintaskEntity> beans = (List<MaintaintaskEntity>) page.getResult();

        TableModel tableModel = new TableModel();
        // excel文件名
        tableModel.setExcelName("检修任务单表页面"+CommonUtils.getInstance().getCurrentDateTime());
        // 列名
        tableModel.addHeaders("id", "taskno", "taskuser", "overhaulmethod", "overhauluser", "eventtime", "overhaulplandays", "plancost");
        tableModel.setTableName("IB_MAINTAINTASK");
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
    @RequestMapping("maintaintask-importExcel")
    public String importExport(@RequestParam("attachment") MultipartFile attachment, HttpServletResponse response) {
        try {
            File file = new File("test.xls"); 
            attachment.transferTo(file);
            // 
            TableModel tableModel = new TableModel();
            // 列名
            tableModel.addHeaders("id", "taskno", "taskuser", "overhaulmethod", "overhauluser", "eventtime", "overhaulplandays", "plancost");
            // 导入
            new ExcelCommon().uploadExcel(file, tableModel, "com.codegenerate.maintaintask.entity.MaintaintaskEntity");
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "redirect:/maintaintask/maintaintask-list.do";
    }
    // ======================================================================
    @Resource
    public void setMessageHelper(MessageHelper messageHelper) {
        this.messageHelper = messageHelper;
    }

    @Resource
    public void setMaintaintaskService(MaintaintaskService maintaintaskService) {
        this.maintaintaskService = maintaintaskService;
    }
    
}
