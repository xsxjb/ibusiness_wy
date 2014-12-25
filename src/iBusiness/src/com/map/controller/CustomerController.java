package com.map.controller;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * 客户controller
 * 
 * @author JiangBo
 */
@Controller
@RequestMapping("customer")
public class CustomerController {
//    private Customer_infoService customer_infoService;
    /**
     * 初始化客户信息数据
     * @return
     */
    @RequestMapping("queryCustomerInfo")
    @ResponseBody
    public String queryCustomerInfo(Model model) {
    	JSONArray json = new JSONArray();
//        List<Customer_infoEntity> list = customer_infoService.getAll();
//        json = CommonUtils.getJsonFromList(list, null);
        return json.toString();
    }
    /**
     * 初始化客户信息数据
     * @return
     */
    @RequestMapping("queryCustomerById")
    @ResponseBody
    public String queryCustomerById(@RequestParam("id") String id, Model model) {
    	JSONObject json = new JSONObject();
//        Customer_infoEntity bean = customer_infoService.get(id);
//        json = CommonUtils.getJsonFromBean(bean, null);
        return json.toString();
    }
    // ======================================================================
//    @Resource
//    public void setCustomer_infoService(Customer_infoService customer_infoService) {
//        this.customer_infoService = customer_infoService;
//    }
}