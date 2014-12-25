package com.ibusiness.base.group.entity;

// Generated by Hibernate Tools
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * 部门表实体Department .
 * 
 * @author JiangBo
 */
@Entity
@Table(name = "IB_DEPARTMENT")
public class OrgDepartment implements java.io.Serializable {
    private static final long serialVersionUID = 0L;

    /** 编号. */
    private String id;

    /** 公司编号. */
    private String companyid;

    /** 部门名称. */
    private String name;

    /** 备注. */
    private String descn;

    /** null. */
    private Integer status;

    /** null. */
    private String ref;

    /** null. */
    private String scopeId;

    public OrgDepartment() {
    }

    public OrgDepartment(String companyid, String name, String descn,
            Integer status, String ref, String scopeId) {
        this.companyid = companyid;
        this.name = name;
        this.descn = descn;
        this.status = status;
        this.ref = ref;
        this.scopeId = scopeId;
    }

    /** @return null. */
    @Id
    @Column(name = "ID", unique = true, nullable = false)
    public String getId() {
        return this.id;
    }

    /**
     * @param id
     *            null.
     */
    public void setId(String id) {
        this.id = id;
    }

    /**
     * @return the companyid
     */
    public String getCompanyid() {
        return companyid;
    }

    /**
     * @param companyid the companyid to set
     */
    public void setCompanyid(String companyid) {
        this.companyid = companyid;
    }

    /** @return null. */
    @Column(name = "NAME", length = 200)
    public String getName() {
        return this.name;
    }

    /**
     * @param name
     *            null.
     */
    public void setName(String name) {
        this.name = name;
    }

    /** @return null. */
    @Column(name = "DESCN", length = 200)
    public String getDescn() {
        return this.descn;
    }

    /**
     * @param descn
     *            null.
     */
    public void setDescn(String descn) {
        this.descn = descn;
    }

    /** @return null. */
    @Column(name = "STATUS")
    public Integer getStatus() {
        return this.status;
    }

    /**
     * @param status
     *            null.
     */
    public void setStatus(Integer status) {
        this.status = status;
    }

    /** @return null. */
    @Column(name = "REF", length = 200)
    public String getRef() {
        return this.ref;
    }

    /**
     * @param ref
     *            null.
     */
    public void setRef(String ref) {
        this.ref = ref;
    }

    /** @return null. */
    @Column(name = "SCOPE_ID", length = 50)
    public String getScopeId() {
        return this.scopeId;
    }

    /**
     * @param scopeId
     *            null.
     */
    public void setScopeId(String scopeId) {
        this.scopeId = scopeId;
    }
}