package com.codegenerate.ownermanage.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ibusiness.common.page.HibernateEntityDao;
import com.codegenerate.ownermanage.entity.House_infoEntity;

/**   
 * @Title: Service
 * @Description: 楼栋信息表页面
 * @author JiangBo
 *
 */
@Service
@Transactional
public class House_infoService extends HibernateEntityDao<House_infoEntity> {
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
    public void remove(House_infoEntity entity) {
        super.remove(entity);
    }
}
