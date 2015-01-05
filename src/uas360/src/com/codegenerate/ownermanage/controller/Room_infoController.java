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

import com.codegenerate.ownermanage.entity.Room_infoEntity;
import com.codegenerate.ownermanage.service.Room_infoService;

/**   
 * @Title: Controller
 * @Description: 房间信息表页面
 * @author JiangBo
 *
 */
@Controller
@RequestMapping("room_info")
public class Room_infoController {

    private MessageHelper messageHelper;
    private Room_infoService room_infoService;
   /**
     * 列表
     */
    @RequestMapping("room_info-list")
    public String list(@ModelAttribute Page page, @RequestParam Map<String, Object> parameterMap, Model model) {
        // 查询条件Filter过滤器
        List<PropertyFilter> propertyFilters = PropertyFilter.buildFromMap(parameterMap);
        // 根据条件查询数据
        page = room_infoService.pagedQuery(page, propertyFilters);
        model.addAttribute("page", page);
        // 返回JSP
        return "codegenerate/ownermanage/room_info-list.jsp";
    }
    
    /**
     * 插入
     * @param id
     * @param model
     * @return
     */
    @RequestMapping("room_info-input")
    public String input(@RequestParam(value = "id", required = false) String id, Model model) {
        Room_infoEntity entity = null;
        if (!CommonUtils.isNull(id)) {
            entity = room_infoService.get(id);
        } else {
            entity = new Room_infoEntity();
        }
        
        // 默认值公式
        entity = (Room_infoEntity) new FormulaCommon().defaultValue(entity, "IB_ROOM_INFO");
        
        model.addAttribute("model", entity);
        
        // 在controller中设置页面控件用的数据
                Map<String, com.ibusiness.component.form.entity.ConfFormTableColumn> houseidFTCMap= CommonBusiness.getInstance().getFormTableColumnMap("IB_ROOM_INFO", "roomInfo");JSONObject houseidJsonObj = JSONObject.fromObject(houseidFTCMap.get("HOUSEID").getConfSelectInfo());String houseidSql = houseidJsonObj.getString("sql");List<Map<String,Object>> houseidList = com.ibusiness.core.spring.ApplicationContextHelper.getBean(com.ibusiness.common.service.CommonBaseService.class).getJdbcTemplate().queryForList(houseidSql);List<ConfSelectItem> houseidItems = new java.util.ArrayList<ConfSelectItem>();for (Map<String,Object> mapBean : houseidList) {    ConfSelectItem confSelectItem = new ConfSelectItem();    confSelectItem.setKey(mapBean.get("vKey").toString());    confSelectItem.setValue(mapBean.get("vValue").toString());    houseidItems.add(confSelectItem);}model.addAttribute("houseidItems", houseidItems);
        return "codegenerate/ownermanage/room_info-input.jsp";
    }

    /**
     * 保存
     * 
     * @return
     * @throws Exception
     */
    @RequestMapping("room_info-save")
    public String save(@ModelAttribute Room_infoEntity entity, RedirectAttributes redirectAttributes) throws Exception {
        // 先进行校验
        // 再进行数据复制
        String id = entity.getId();
        if (CommonUtils.isNull(id)) {
            entity.setId(UUID.randomUUID().toString());
            room_infoService.insert(entity);
        } else {
            room_infoService.update(entity);
        }
        messageHelper.addFlashMessage(redirectAttributes, "core.success.save", "保存成功");
        return "redirect:/room_info/room_info-list.do";
    }
   /**
     * 删除
     * @param selectedItem
     * @param redirectAttributes
     * @return
     */
    @RequestMapping("room_info-remove")
    public String remove(@RequestParam("selectedItem") List<String> selectedItem, RedirectAttributes redirectAttributes) {
        List<Room_infoEntity> entitys = room_infoService.findByIds(selectedItem);
        for (Room_infoEntity entity : entitys) {
            room_infoService.remove(entity);
        }
        messageHelper.addFlashMessage(redirectAttributes, "core.success.delete", "删除成功");

        return "redirect:/room_info/room_info-list.do";
    }
    /**
     * excel导出
     */
    @SuppressWarnings("unchecked")
    @RequestMapping("room_info-export")
    public void excelExport(@ModelAttribute Page page, @RequestParam Map<String, Object> parameterMap, HttpServletResponse response) {
        List<PropertyFilter> propertyFilters = PropertyFilter.buildFromMap(parameterMap);
        page = room_infoService.pagedQuery(page, propertyFilters);
        List<Room_infoEntity> beans = (List<Room_infoEntity>) page.getResult();

        TableModel tableModel = new TableModel();
        // excel文件名
        tableModel.setExcelName("房间信息表页面"+CommonUtils.getInstance().getCurrentDateTime());
        // 列名
        tableModel.addHeaders("id", "roomid", "roomname", "houseid", "ownerid", "entertime", "roomtype", "roomarea", "roompurpose");
        tableModel.setTableName("IB_ROOM_INFO");
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
    @RequestMapping("room_info-importExcel")
    public String importExport(@RequestParam("attachment") MultipartFile attachment, HttpServletResponse response) {
        try {
            File file = new File("test.xls"); 
            attachment.transferTo(file);
            // 
            TableModel tableModel = new TableModel();
            // 列名
            tableModel.addHeaders("id", "roomid", "roomname", "houseid", "ownerid", "entertime", "roomtype", "roomarea", "roompurpose");
            // 导入
            new ExcelCommon().uploadExcel(file, tableModel, "com.codegenerate.ownermanage.entity.Room_infoEntity");
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "redirect:/room_info/room_info-list.do";
    }
    // ======================================================================
    @Resource
    public void setMessageHelper(MessageHelper messageHelper) {
        this.messageHelper = messageHelper;
    }

    @Resource
    public void setRoom_infoService(Room_infoService room_infoService) {
        this.room_infoService = room_infoService;
    }
    
}
