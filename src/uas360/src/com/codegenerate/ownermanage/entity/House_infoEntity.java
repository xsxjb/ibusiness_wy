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
	/**id*/
	private java.lang.String id;
	/**areano*/
	private java.lang.String areano;
	/**entrancedate*/
	private java.util.Date entrancedate;
	/**usearea*/
	private java.lang.Double usearea;
	/**afforestedarea*/
	private java.lang.Double afforestedarea;
	/**developers*/
	private java.lang.String developers;
	/**constructionunit*/
	private java.lang.String constructionunit;
	/**buildinghigh*/
	private java.lang.String buildinghigh;
	/**buildingfloor*/
	private java.lang.String buildingfloor;
	/**buildingstructure*/
	private java.lang.String buildingstructure;
	/**userstate*/
	private java.lang.String userstate;
	/**totalrooms*/
	private java.lang.String totalrooms;
	/**soldnum*/
	private java.lang.String soldnum;
	/**rentnum*/
	private java.lang.String rentnum;
	
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
	 *@return: java.lang.String  areano
	 */
	@Column(name ="AREANO",nullable=true,length=64)
	public java.lang.String getAreano(){
		return this.areano;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  areano
	 */
	public void setAreano(java.lang.String areano){
		this.areano = areano;
	}
	/**
	 *方法: 取得java.util.Date
	 *@return: java.util.Date  entrancedate
	 */
	@Column(name ="ENTRANCEDATE",nullable=true)
	public java.util.Date getEntrancedate(){
		return this.entrancedate;
	}

	/**
	 *方法: 设置java.util.Date
	 *@param: java.util.Date  entrancedate
	 */
	public void setEntrancedate(java.util.Date entrancedate){
		this.entrancedate = entrancedate;
	}
	/**
	 *方法: 取得java.lang.Double
	 *@return: java.lang.Double  usearea
	 */
	@Column(name ="USEAREA",nullable=true,precision=12,scale=2)
	public java.lang.Double getUsearea(){
		return this.usearea;
	}

	/**
	 *方法: 设置java.lang.Double
	 *@param: java.lang.Double  usearea
	 */
	public void setUsearea(java.lang.Double usearea){
		this.usearea = usearea;
	}
	/**
	 *方法: 取得java.lang.Double
	 *@return: java.lang.Double  afforestedarea
	 */
	@Column(name ="AFFORESTEDAREA",nullable=true,precision=12,scale=2)
	public java.lang.Double getAfforestedarea(){
		return this.afforestedarea;
	}

	/**
	 *方法: 设置java.lang.Double
	 *@param: java.lang.Double  afforestedarea
	 */
	public void setAfforestedarea(java.lang.Double afforestedarea){
		this.afforestedarea = afforestedarea;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  developers
	 */
	@Column(name ="DEVELOPERS",nullable=true,length=64)
	public java.lang.String getDevelopers(){
		return this.developers;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  developers
	 */
	public void setDevelopers(java.lang.String developers){
		this.developers = developers;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  constructionunit
	 */
	@Column(name ="CONSTRUCTIONUNIT",nullable=true,length=64)
	public java.lang.String getConstructionunit(){
		return this.constructionunit;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  constructionunit
	 */
	public void setConstructionunit(java.lang.String constructionunit){
		this.constructionunit = constructionunit;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  buildinghigh
	 */
	@Column(name ="BUILDINGHIGH",nullable=true,length=8)
	public java.lang.String getBuildinghigh(){
		return this.buildinghigh;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  buildinghigh
	 */
	public void setBuildinghigh(java.lang.String buildinghigh){
		this.buildinghigh = buildinghigh;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  buildingfloor
	 */
	@Column(name ="BUILDINGFLOOR",nullable=true,length=8)
	public java.lang.String getBuildingfloor(){
		return this.buildingfloor;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  buildingfloor
	 */
	public void setBuildingfloor(java.lang.String buildingfloor){
		this.buildingfloor = buildingfloor;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  buildingstructure
	 */
	@Column(name ="BUILDINGSTRUCTURE",nullable=true,length=32)
	public java.lang.String getBuildingstructure(){
		return this.buildingstructure;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  buildingstructure
	 */
	public void setBuildingstructure(java.lang.String buildingstructure){
		this.buildingstructure = buildingstructure;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  userstate
	 */
	@Column(name ="USERSTATE",nullable=true,length=32)
	public java.lang.String getUserstate(){
		return this.userstate;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  userstate
	 */
	public void setUserstate(java.lang.String userstate){
		this.userstate = userstate;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  totalrooms
	 */
	@Column(name ="TOTALROOMS",nullable=true,length=8)
	public java.lang.String getTotalrooms(){
		return this.totalrooms;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  totalrooms
	 */
	public void setTotalrooms(java.lang.String totalrooms){
		this.totalrooms = totalrooms;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  soldnum
	 */
	@Column(name ="SOLDNUM",nullable=true,length=8)
	public java.lang.String getSoldnum(){
		return this.soldnum;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  soldnum
	 */
	public void setSoldnum(java.lang.String soldnum){
		this.soldnum = soldnum;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  rentnum
	 */
	@Column(name ="RENTNUM",nullable=true,length=8)
	public java.lang.String getRentnum(){
		return this.rentnum;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  rentnum
	 */
	public void setRentnum(java.lang.String rentnum){
		this.rentnum = rentnum;
	}
}
