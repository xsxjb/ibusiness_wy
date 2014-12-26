package com.codegenerate.maintaintask.entity;

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
 * @Description: 检修任务单表页面
 * @author JiangBo
 *
 */
@Entity
@Table(name = "IB_MAINTAINTASK")
public class MaintaintaskEntity implements java.io.Serializable {
    private static final long serialVersionUID = 0L;
	/**id*/
	private java.lang.String id;
	/**taskno*/
	private java.lang.String taskno;
	/**taskuser*/
	private java.lang.String taskuser;
	/**overhaulmethod*/
	private java.lang.String overhaulmethod;
	/**overhauluser*/
	private java.lang.String overhauluser;
	/**eventtime*/
	private java.util.Date eventtime;
	/**overhaulplandays*/
	private java.lang.Integer overhaulplandays;
	/**plancost*/
	private java.lang.Double plancost;
	
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
	 *@return: java.lang.String  taskno
	 */
	@Column(name ="TASKNO",nullable=true,length=64)
	public java.lang.String getTaskno(){
		return this.taskno;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  taskno
	 */
	public void setTaskno(java.lang.String taskno){
		this.taskno = taskno;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  taskuser
	 */
	@Column(name ="TASKUSER",nullable=true,length=64)
	public java.lang.String getTaskuser(){
		return this.taskuser;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  taskuser
	 */
	public void setTaskuser(java.lang.String taskuser){
		this.taskuser = taskuser;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  overhaulmethod
	 */
	@Column(name ="OVERHAULMETHOD",nullable=true,length=16)
	public java.lang.String getOverhaulmethod(){
		return this.overhaulmethod;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  overhaulmethod
	 */
	public void setOverhaulmethod(java.lang.String overhaulmethod){
		this.overhaulmethod = overhaulmethod;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  overhauluser
	 */
	@Column(name ="OVERHAULUSER",nullable=true,length=64)
	public java.lang.String getOverhauluser(){
		return this.overhauluser;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  overhauluser
	 */
	public void setOverhauluser(java.lang.String overhauluser){
		this.overhauluser = overhauluser;
	}
	/**
	 *方法: 取得java.util.Date
	 *@return: java.util.Date  eventtime
	 */
	@Column(name ="EVENTTIME",nullable=true)
	public java.util.Date getEventtime(){
		return this.eventtime;
	}

	/**
	 *方法: 设置java.util.Date
	 *@param: java.util.Date  eventtime
	 */
	public void setEventtime(java.util.Date eventtime){
		this.eventtime = eventtime;
	}
	/**
	 *方法: 取得java.lang.Integer
	 *@return: java.lang.Integer  overhaulplandays
	 */
	@Column(name ="OVERHAULPLANDAYS",nullable=true,precision=10,scale=0)
	public java.lang.Integer getOverhaulplandays(){
		return this.overhaulplandays;
	}

	/**
	 *方法: 设置java.lang.Integer
	 *@param: java.lang.Integer  overhaulplandays
	 */
	public void setOverhaulplandays(java.lang.Integer overhaulplandays){
		this.overhaulplandays = overhaulplandays;
	}
	/**
	 *方法: 取得java.lang.Double
	 *@return: java.lang.Double  plancost
	 */
	@Column(name ="PLANCOST",nullable=true,precision=12,scale=2)
	public java.lang.Double getPlancost(){
		return this.plancost;
	}

	/**
	 *方法: 设置java.lang.Double
	 *@param: java.lang.Double  plancost
	 */
	public void setPlancost(java.lang.Double plancost){
		this.plancost = plancost;
	}
}
