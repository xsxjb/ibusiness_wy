package com.codegenerate.maintaintask.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ibusiness.common.page.HibernateEntityDao;
import com.codegenerate.maintaintask.entity.MaintaintaskEntity;

/**   
 * @Title: Service
 * @Description: 检修任务单表页面
 * @author JiangBo
 *
 */
@Service
@Transactional
public class MaintaintaskService extends HibernateEntityDao<MaintaintaskEntity> {
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
    public void remove(MaintaintaskEntity entity) {
        super.remove(entity);
    }
}
