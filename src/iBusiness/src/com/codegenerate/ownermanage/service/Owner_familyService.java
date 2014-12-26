package com.codegenerate.ownermanage.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ibusiness.common.page.HibernateEntityDao;
import com.codegenerate.ownermanage.entity.Owner_familyEntity;

/**   
 * @Title: Service
 * @Description: 业主表页面
 * @author JiangBo
 *
 */
@Service
@Transactional
public class Owner_familyService extends HibernateEntityDao<Owner_familyEntity> {
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
    public void remove(Owner_familyEntity entity) {
        super.remove(entity);
    }
}
