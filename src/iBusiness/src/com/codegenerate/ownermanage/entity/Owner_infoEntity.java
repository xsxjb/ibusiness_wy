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
@Table(name = "IB_OWNER_INFO")
public class Owner_infoEntity implements java.io.Serializable {
    private static final long serialVersionUID = 0L;
	/**id*/
	private java.lang.String id;
	/**ownerid*/
	private java.lang.String ownerid;
	/**ownername*/
	private java.lang.String ownername;
	/**ownerloginname*/
	private java.lang.String ownerloginname;
	/**ownerpassword*/
	private java.lang.String ownerpassword;
	/**ownersex*/
	private java.lang.String ownersex;
	/**ownerage*/
	private java.lang.Integer ownerage;
	/**houseid*/
	private java.lang.String houseid;
	/**roomid*/
	private java.lang.String roomid;
	/**owneridcard*/
	private java.lang.String owneridcard;
	/**ownertel*/
	private java.lang.String ownertel;
	/**ownerhomeplace*/
	private java.lang.String ownerhomeplace;
	/**ownerworkplace*/
	private java.lang.String ownerworkplace;
	
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
	 *@return: java.lang.String  ownername
	 */
	@Column(name ="OWNERNAME",nullable=true,length=64)
	public java.lang.String getOwnername(){
		return this.ownername;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  ownername
	 */
	public void setOwnername(java.lang.String ownername){
		this.ownername = ownername;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  ownerloginname
	 */
	@Column(name ="OWNERLOGINNAME",nullable=true,length=64)
	public java.lang.String getOwnerloginname(){
		return this.ownerloginname;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  ownerloginname
	 */
	public void setOwnerloginname(java.lang.String ownerloginname){
		this.ownerloginname = ownerloginname;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  ownerpassword
	 */
	@Column(name ="OWNERPASSWORD",nullable=true,length=64)
	public java.lang.String getOwnerpassword(){
		return this.ownerpassword;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  ownerpassword
	 */
	public void setOwnerpassword(java.lang.String ownerpassword){
		this.ownerpassword = ownerpassword;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  ownersex
	 */
	@Column(name ="OWNERSEX",nullable=true,length=8)
	public java.lang.String getOwnersex(){
		return this.ownersex;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  ownersex
	 */
	public void setOwnersex(java.lang.String ownersex){
		this.ownersex = ownersex;
	}
	/**
	 *方法: 取得java.lang.Integer
	 *@return: java.lang.Integer  ownerage
	 */
	@Column(name ="OWNERAGE",nullable=true,precision=10,scale=0)
	public java.lang.Integer getOwnerage(){
		return this.ownerage;
	}

	/**
	 *方法: 设置java.lang.Integer
	 *@param: java.lang.Integer  ownerage
	 */
	public void setOwnerage(java.lang.Integer ownerage){
		this.ownerage = ownerage;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  houseid
	 */
	@Column(name ="HOUSEID",nullable=true,length=8)
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
	 *@return: java.lang.String  roomid
	 */
	@Column(name ="ROOMID",nullable=true,length=8)
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
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  owneridcard
	 */
	@Column(name ="OWNERIDCARD",nullable=true,length=32)
	public java.lang.String getOwneridcard(){
		return this.owneridcard;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  owneridcard
	 */
	public void setOwneridcard(java.lang.String owneridcard){
		this.owneridcard = owneridcard;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  ownertel
	 */
	@Column(name ="OWNERTEL",nullable=true,length=32)
	public java.lang.String getOwnertel(){
		return this.ownertel;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  ownertel
	 */
	public void setOwnertel(java.lang.String ownertel){
		this.ownertel = ownertel;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  ownerhomeplace
	 */
	@Column(name ="OWNERHOMEPLACE",nullable=true,length=64)
	public java.lang.String getOwnerhomeplace(){
		return this.ownerhomeplace;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  ownerhomeplace
	 */
	public void setOwnerhomeplace(java.lang.String ownerhomeplace){
		this.ownerhomeplace = ownerhomeplace;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  ownerworkplace
	 */
	@Column(name ="OWNERWORKPLACE",nullable=true,length=64)
	public java.lang.String getOwnerworkplace(){
		return this.ownerworkplace;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  ownerworkplace
	 */
	public void setOwnerworkplace(java.lang.String ownerworkplace){
		this.ownerworkplace = ownerworkplace;
	}
}
