package com.ibusiness.base.group.web;

import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.ibusiness.base.group.dao.OrgDepartmentDao;
import com.ibusiness.base.group.entity.OrgDepartment;
import com.ibusiness.common.model.ConfSelectItem;
import com.ibusiness.common.page.Page;
import com.ibusiness.common.page.PropertyFilter;
import com.ibusiness.common.service.CommonBusiness;
import com.ibusiness.common.util.CommonUtils;
import com.ibusiness.core.mapper.BeanMapper;
import com.ibusiness.core.spring.MessageHelper;
import com.ibusiness.security.api.scope.ScopeHolder;
/**
 * 部门
 * 
 * @author JiangBo
 *
 */
@Controller
@RequestMapping("group")
public class OrgDepartmentController {
    private OrgDepartmentDao orgDepartmentDao;
    private MessageHelper messageHelper;
    private BeanMapper beanMapper = new BeanMapper();

    /**
     * 部门列表
     * @param page
     * @param parameterMap
     * @param model
     * @return
     */
    @RequestMapping("org-department-list")
    public String list(@ModelAttribute Page page, @RequestParam Map<String, Object> parameterMap, Model model) {
        List<PropertyFilter> propertyFilters = PropertyFilter.buildFromMap(parameterMap);
        propertyFilters.add(new PropertyFilter("EQS_scopeId", ScopeHolder.getScopeId()));
        page = orgDepartmentDao.pagedQuery(page, propertyFilters);
        model.addAttribute("page", page);

        return "common/group/org-department-list.jsp";
    }

    /**
     * 部门信息保存
     * @param id
     * @param model
     * @return
     */
    @RequestMapping("org-department-input")
    public String input(@RequestParam(value = "id", required = false) String id, Model model) {
        if (id != null) {
            OrgDepartment orgDepartment = orgDepartmentDao.get(id);
            model.addAttribute("model", orgDepartment);
        }
        // 在controller中设置页面控件用的数据
        Map<String, com.ibusiness.component.form.entity.ConfFormTableColumn> formTableColumnMap= CommonBusiness.getInstance().getFormTableColumnMap("IB_TEST", "testForm");net.sf.json.JSONObject jsonObj = net.sf.json.JSONObject.fromObject(formTableColumnMap.get("COMPANYID").getConfSelectInfo());String sql = jsonObj.getString("sql");List<Map<String,Object>> list = com.ibusiness.core.spring.ApplicationContextHelper.getBean(com.ibusiness.common.service.CommonBaseService.class).getJdbcTemplate().queryForList(sql);List<ConfSelectItem> companyidItems = new java.util.ArrayList<ConfSelectItem>();for (Map<String,Object> mapBean : list) {    ConfSelectItem confSelectItem = new ConfSelectItem();    confSelectItem.setKey(mapBean.get("vKey").toString());    confSelectItem.setValue(mapBean.get("vValue").toString());    companyidItems.add(confSelectItem);}model.addAttribute("companyidItems", companyidItems);
        
        return "common/group/org-department-input.jsp";
    }

    @RequestMapping("org-department-save")
    public String save(@ModelAttribute OrgDepartment orgDepartment, RedirectAttributes redirectAttributes) {
        OrgDepartment dest = null;
        String id = orgDepartment.getId();

        if (!CommonUtils.isNull(id)) {
            dest = orgDepartmentDao.get(id);
            beanMapper.copy(orgDepartment, dest);
        } else {
            dest = orgDepartment;
            dest.setScopeId(ScopeHolder.getScopeId());
            dest.setId(UUID.randomUUID().toString());
        }

        orgDepartmentDao.save(dest);

        messageHelper.addFlashMessage(redirectAttributes, "core.success.save", "保存成功");

        return "redirect:/group/org-department-list.do";
    }

    @RequestMapping("org-department-remove")
    public String remove(@RequestParam("selectedItem")
    List<String> selectedItem, RedirectAttributes redirectAttributes) {
        List<OrgDepartment> orgDepartments = orgDepartmentDao.findByIds(selectedItem);

        for (OrgDepartment orgDepartment : orgDepartments) {
            orgDepartmentDao.remove(orgDepartment);
        }

        messageHelper.addFlashMessage(redirectAttributes, "core.success.delete", "删除成功");

        return "redirect:/group/org-department-list.do";
    }

    // ~ ======================================================================
    @Resource
    public void setOrgDepartmentDao(OrgDepartmentDao orgDepartmentDao) {
        this.orgDepartmentDao = orgDepartmentDao;
    }

    @Resource
    public void setMessageHelper(MessageHelper messageHelper) {
        this.messageHelper = messageHelper;
    }
}
