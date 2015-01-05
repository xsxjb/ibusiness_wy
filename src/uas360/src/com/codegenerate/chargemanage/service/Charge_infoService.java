package com.codegenerate.chargemanage.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ibusiness.common.page.HibernateEntityDao;
import com.codegenerate.chargemanage.entity.Charge_infoEntity;

/**   
 * @Title: Service
 * @Description: 收费项目表页面
 * @author JiangBo
 *
 */
@Service
@Transactional
public class Charge_infoService extends HibernateEntityDao<Charge_infoEntity> {
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
    public void remove(Charge_infoEntity entity) {
        super.remove(entity);
    }
}
