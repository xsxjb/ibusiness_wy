package com.codegenerate.chargemanage.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ibusiness.common.page.HibernateEntityDao;
import com.codegenerate.chargemanage.entity.Charge_payEntity;

/**   
 * @Title: Service
 * @Description: 业主缴费表页面
 * @author JiangBo
 *
 */
@Service
@Transactional
public class Charge_payService extends HibernateEntityDao<Charge_payEntity> {
    /**
     * 插入
     * @param entity
     */
    public <T> void insert(T entity) {
        super.saveInsert(entity);
    }
    /**
     * 删除
     * @param entity
     */
    public void remove(Charge_payEntity entity) {
        super.remove(entity);
    }
}
