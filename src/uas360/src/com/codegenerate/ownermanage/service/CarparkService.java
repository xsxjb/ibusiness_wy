package com.codegenerate.ownermanage.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ibusiness.common.page.HibernateEntityDao;
import com.codegenerate.ownermanage.entity.CarparkEntity;

/**   
 * @Title: Service
 * @Description: 车位/车库管理页面
 * @author JiangBo
 *
 */
@Service
@Transactional
public class CarparkService extends HibernateEntityDao<CarparkEntity> {
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
    public void remove(CarparkEntity entity) {
        super.remove(entity);
    }
}
