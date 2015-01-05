package com.codegenerate.ownermanage.entity;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import org.hibernate.annotations.GenericGenerator;
import javax.persistence.SequenceGenerator;

/**   
 * @Title: Entity
 * @Description: 业主表页面
 * @author JiangBo
 *
 */
@Entity
@Table(name = "IB_OWNER_FAMILY")
public class Owner_familyEntity implements java.io.Serializable {
    private static final long serialVersionUID = 0L;
	/**id*/
	private java.lang.String id;
	/**parentid*/
	private java.lang.String parentid;
	/**ownerid*/
	private java.lang.String ownerid;
	/**ownerfamilyid*/
	private java.lang.String ownerfamilyid;
	/**ownerfamilyname*/
	private java.lang.String ownerfamilyname;
	/**ownerfamilysex*/
	private java.lang.String ownerfamilysex;
	/**ownerfamilyage*/
	private java.lang.Integer ownerfamilyage;
	/**ownerfamilytel*/
	private java.lang.String ownerfamilytel;
	/**ownerfamilyworkplace*/
	private java.lang.String ownerfamilyworkplace;
	
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  id
	 */
	
	@Id
	@Column(name ="ID",nullable=false,length=64)
	public java.lang.String getId(){
		return this.id;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  id
	 */
	public void setId(java.lang.String id){
		this.id = id;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  parentid
	 */
	@Column(name ="PARENTID",nullable=true,length=64)
	public java.lang.String getParentid(){
		return this.parentid;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  parentid
	 */
	public void setParentid(java.lang.String parentid){
		this.parentid = parentid;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  ownerid
	 */
	@Column(name ="OWNERID",nullable=true,length=64)
	public java.lang.String getOwnerid(){
		return this.ownerid;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  ownerid
	 */
	public void setOwnerid(java.lang.String ownerid){
		this.ownerid = ownerid;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  ownerfamilyid
	 */
	@Column(name ="OWNERFAMILYID",nullable=true,length=64)
	public java.lang.String getOwnerfamilyid(){
		return this.ownerfamilyid;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  ownerfamilyid
	 */
	public void setOwnerfamilyid(java.lang.String ownerfamilyid){
		this.ownerfamilyid = ownerfamilyid;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  ownerfamilyname
	 */
	@Column(name ="OWNERFAMILYNAME",nullable=true,length=64)
	public java.lang.String getOwnerfamilyname(){
		return this.ownerfamilyname;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  ownerfamilyname
	 */
	public void setOwnerfamilyname(java.lang.String ownerfamilyname){
		this.ownerfamilyname = ownerfamilyname;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  ownerfamilysex
	 */
	@Column(name ="OWNERFAMILYSEX",nullable=true,length=8)
	public java.lang.String getOwnerfamilysex(){
		return this.ownerfamilysex;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  ownerfamilysex
	 */
	public void setOwnerfamilysex(java.lang.String ownerfamilysex){
		this.ownerfamilysex = ownerfamilysex;
	}
	/**
	 *方法: 取得java.lang.Integer
	 *@return: java.lang.Integer  ownerfamilyage
	 */
	@Column(name ="OWNERFAMILYAGE",nullable=true,precision=10,scale=0)
	public java.lang.Integer getOwnerfamilyage(){
		return this.ownerfamilyage;
	}

	/**
	 *方法: 设置java.lang.Integer
	 *@param: java.lang.Integer  ownerfamilyage
	 */
	public void setOwnerfamilyage(java.lang.Integer ownerfamilyage){
		this.ownerfamilyage = ownerfamilyage;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  ownerfamilytel
	 */
	@Column(name ="OWNERFAMILYTEL",nullable=true,length=24)
	public java.lang.String getOwnerfamilytel(){
		return this.ownerfamilytel;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  ownerfamilytel
	 */
	public void setOwnerfamilytel(java.lang.String ownerfamilytel){
		this.ownerfamilytel = ownerfamilytel;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  ownerfamilyworkplace
	 */
	@Column(name ="OWNERFAMILYWORKPLACE",nullable=true,length=128)
	public java.lang.String getOwnerfamilyworkplace(){
		return this.ownerfamilyworkplace;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  ownerfamilyworkplace
	 */
	public void setOwnerfamilyworkplace(java.lang.String ownerfamilyworkplace){
		this.ownerfamilyworkplace = ownerfamilyworkplace;
	}
}
