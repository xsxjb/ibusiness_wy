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
 * @Description: 车位/车库管理页面
 * @author JiangBo
 *
 */
@Entity
@Table(name = "IB_CARPARK")
public class CarparkEntity implements java.io.Serializable {
    private static final long serialVersionUID = 0L;
	/**id*/
	private java.lang.String id;
	/**stallname*/
	private java.lang.String stallname;
	/**area*/
	private java.lang.String area;
	/**roomid*/
	private java.lang.String roomid;
	/**rent*/
	private java.lang.Double rent;
	/**describeremark*/
	private java.lang.String describeremark;
	
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
	 *@return: java.lang.String  stallname
	 */
	@Column(name ="STALLNAME",nullable=true,length=64)
	public java.lang.String getStallname(){
		return this.stallname;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  stallname
	 */
	public void setStallname(java.lang.String stallname){
		this.stallname = stallname;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  area
	 */
	@Column(name ="AREA",nullable=true,length=64)
	public java.lang.String getArea(){
		return this.area;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  area
	 */
	public void setArea(java.lang.String area){
		this.area = area;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  roomid
	 */
	@Column(name ="ROOMID",nullable=true,length=64)
	public java.lang.String getRoomid(){
		return this.roomid;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  roomid
	 */
	public void setRoomid(java.lang.String roomid){
		this.roomid = roomid;
	}
	/**
	 *方法: 取得java.lang.Double
	 *@return: java.lang.Double  rent
	 */
	@Column(name ="RENT",nullable=true,precision=12,scale=2)
	public java.lang.Double getRent(){
		return this.rent;
	}

	/**
	 *方法: 设置java.lang.Double
	 *@param: java.lang.Double  rent
	 */
	public void setRent(java.lang.Double rent){
		this.rent = rent;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  describeremark
	 */
	@Column(name ="DESCRIBEREMARK",nullable=true,length=512)
	public java.lang.String getDescriberemark(){
		return this.describeremark;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  describeremark
	 */
	public void setDescriberemark(java.lang.String describeremark){
		this.describeremark = describeremark;
	}
}
