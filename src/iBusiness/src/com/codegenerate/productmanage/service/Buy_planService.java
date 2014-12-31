package com.codegenerate.productmanage.service;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.codegenerate.productmanage.entity.Buy_planEntity;
import com.ibusiness.common.page.HibernateEntityDao;

/**   
 * @Title: Service
 * @Description: 材料采购计划申请表
 * @author JiangBo
 *
 */
@Service
@Transactional
public class Buy_planService extends HibernateEntityDao<Buy_planEntity> {
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
    public void remove(Buy_planEntity entity) {
        super.remove(entity);
    }
}
