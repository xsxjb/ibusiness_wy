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
 * @Description: 楼栋信息表页面
 * @author JiangBo
 *
 */
@Entity
@Table(name = "IB_HOUSE_INFO")
public class House_infoEntity implements java.io.Serializable {
    private static final long serialVersionUID = 0L;
	/**id*/
	private java.lang.String id;
	/**houseid*/
	private java.lang.String houseid;
	/**housename*/
	private java.lang.String housename;
	/**buildstarttime*/
	private java.util.Date buildstarttime;
	/**buildendtime*/
	private java.util.Date buildendtime;
	/**housebug*/
	private java.lang.String housebug;
	/**housearea*/
	private java.lang.Double housearea;
	
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
	 *@return: java.lang.String  houseid
	 */
	@Column(name ="HOUSEID",nullable=true,length=64)
	public java.lang.String getHouseid(){
		return this.houseid;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  houseid
	 */
	public void setHouseid(java.lang.String houseid){
		this.houseid = houseid;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  housename
	 */
	@Column(name ="HOUSENAME",nullable=true,length=64)
	public java.lang.String getHousename(){
		return this.housename;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  housename
	 */
	public void setHousename(java.lang.String housename){
		this.housename = housename;
	}
	/**
	 *方法: 取得java.util.Date
	 *@return: java.util.Date  buildstarttime
	 */
	@Column(name ="BUILDSTARTTIME",nullable=true)
	public java.util.Date getBuildstarttime(){
		return this.buildstarttime;
	}

	/**
	 *方法: 设置java.util.Date
	 *@param: java.util.Date  buildstarttime
	 */
	public void setBuildstarttime(java.util.Date buildstarttime){
		this.buildstarttime = buildstarttime;
	}
	/**
	 *方法: 取得java.util.Date
	 *@return: java.util.Date  buildendtime
	 */
	@Column(name ="BUILDENDTIME",nullable=true)
	public java.util.Date getBuildendtime(){
		return this.buildendtime;
	}

	/**
	 *方法: 设置java.util.Date
	 *@param: java.util.Date  buildendtime
	 */
	public void setBuildendtime(java.util.Date buildendtime){
		this.buildendtime = buildendtime;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  housebug
	 */
	@Column(name ="HOUSEBUG",nullable=true,length=512)
	public java.lang.String getHousebug(){
		return this.housebug;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  housebug
	 */
	public void setHousebug(java.lang.String housebug){
		this.housebug = housebug;
	}
	/**
	 *方法: 取得java.lang.Double
	 *@return: java.lang.Double  housearea
	 */
	@Column(name ="HOUSEAREA",nullable=true,precision=12,scale=2)
	public java.lang.Double getHousearea(){
		return this.housearea;
	}

	/**
	 *方法: 设置java.lang.Double
	 *@param: java.lang.Double  housearea
	 */
	public void setHousearea(java.lang.Double housearea){
		this.housearea = housearea;
	}
}
