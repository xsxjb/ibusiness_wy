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
 * @Description: 房间信息表页面
 * @author JiangBo
 *
 */
@Entity
@Table(name = "IB_ROOM_INFO")
public class Room_infoEntity implements java.io.Serializable {
    private static final long serialVersionUID = 0L;
	/**id*/
	private java.lang.String id;
	/**roomid*/
	private java.lang.String roomid;
	/**roomname*/
	private java.lang.String roomname;
	/**houseid*/
	private java.lang.String houseid;
	/**ownerid*/
	private java.lang.String ownerid;
	/**entertime*/
	private java.util.Date entertime;
	/**roomtype*/
	private java.lang.String roomtype;
	/**roomarea*/
	private java.lang.Double roomarea;
	/**roompurpose*/
	private java.lang.String roompurpose;
	
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
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  roomname
	 */
	@Column(name ="ROOMNAME",nullable=true,length=64)
	public java.lang.String getRoomname(){
		return this.roomname;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  roomname
	 */
	public void setRoomname(java.lang.String roomname){
		this.roomname = roomname;
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
	 *方法: 取得java.util.Date
	 *@return: java.util.Date  entertime
	 */
	@Column(name ="ENTERTIME",nullable=true)
	public java.util.Date getEntertime(){
		return this.entertime;
	}

	/**
	 *方法: 设置java.util.Date
	 *@param: java.util.Date  entertime
	 */
	public void setEntertime(java.util.Date entertime){
		this.entertime = entertime;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  roomtype
	 */
	@Column(name ="ROOMTYPE",nullable=true,length=64)
	public java.lang.String getRoomtype(){
		return this.roomtype;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  roomtype
	 */
	public void setRoomtype(java.lang.String roomtype){
		this.roomtype = roomtype;
	}
	/**
	 *方法: 取得java.lang.Double
	 *@return: java.lang.Double  roomarea
	 */
	@Column(name ="ROOMAREA",nullable=true,precision=12,scale=2)
	public java.lang.Double getRoomarea(){
		return this.roomarea;
	}

	/**
	 *方法: 设置java.lang.Double
	 *@param: java.lang.Double  roomarea
	 */
	public void setRoomarea(java.lang.Double roomarea){
		this.roomarea = roomarea;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  roompurpose
	 */
	@Column(name ="ROOMPURPOSE",nullable=true,length=64)
	public java.lang.String getRoompurpose(){
		return this.roompurpose;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  roompurpose
	 */
	public void setRoompurpose(java.lang.String roompurpose){
		this.roompurpose = roompurpose;
	}
}
