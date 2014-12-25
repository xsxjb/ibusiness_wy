package com.ibusiness.base.auth.entity;

import java.util.HashSet;
import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

/**
 * Perm 标签级权限管理.
 * 
 * @author JiangBo
 */
@Entity
@Table(name = "IB_AUTH_PERM")
public class Perm implements java.io.Serializable {
    private static final long serialVersionUID = 0L;

    /** null. */
    private String id;

    /** 权限类别. */
    private PermType permType;

    /** null. */
    private String code;

    /** null. */
    private String name;

    /** null. */
    private String scopeId;

    /** null. */
    private Integer priority;
    
    /** . */
    private Set<RoleDef> roleDefs = new HashSet<RoleDef>(0);

    /** . */
    private Set<Access> accesses = new HashSet<Access>(0);

    public Perm() {
    }

    public Perm(PermType permType) {
        this.permType = permType;
    }

    public Perm(PermType permType, String code, String name, String scopeId,
            Integer priority, Set<RoleDef> roleDefs, Set<Access> accesses) {
        this.permType = permType;
        this.code = code;
        this.name = name;
        this.scopeId = scopeId;
        this.priority = priority;
        this.roleDefs = roleDefs;
        this.accesses = accesses;
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

    /** @return null. */
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "PERM_TYPE_ID", nullable = false)
    public PermType getPermType() {
        return this.permType;
    }

    /**
     * @param permType
     *            null.
     */
    public void setPermType(PermType permType) {
        this.permType = permType;
    }

    /** @return null. */
    @Column(name = "CODE", length = 200)
    public String getCode() {
        return this.code;
    }

    /**
     * @param code
     *            null.
     */
    public void setCode(String code) {
        this.code = code;
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

    /** @return null. */
    @Column(name = "PRIORITY")
    public Integer getPriority() {
        return this.priority;
    }

    /**
     * @param priority
     *            null.
     */
    public void setPriority(Integer priority) {
        this.priority = priority;
    }

    /** @return . */
    @ManyToMany(fetch = FetchType.LAZY)
    @JoinTable(name = "IB_AUTH_PERM_ROLE_DEF", joinColumns = { @JoinColumn(name = "PERM_ID", nullable = false, updatable = false) }, inverseJoinColumns = { @JoinColumn(name = "ROLE_DEF_ID", nullable = false, updatable = false) })
    public Set<RoleDef> getRoleDefs() {
        return this.roleDefs;
    }

    /**
     * @param roleDefs
     *            .
     */
    public void setRoleDefs(Set<RoleDef> roleDefs) {
        this.roleDefs = roleDefs;
    }

    /** @return . */
    @OneToMany(fetch = FetchType.LAZY, mappedBy = "perm")
    public Set<Access> getAccesses() {
        return this.accesses;
    }

    /**
     * @param accesses
     *            .
     */
    public void setAccesses(Set<Access> accesses) {
        this.accesses = accesses;
    }

}
