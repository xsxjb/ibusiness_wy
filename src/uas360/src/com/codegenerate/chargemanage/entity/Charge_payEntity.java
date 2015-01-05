package com.codegenerate.chargemanage.entity;

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
 * @Description: 业主缴费表页面
 * @author JiangBo
 *
 */
@Entity
@Table(name = "IB_CHARGE_PAY")
public class Charge_payEntity implements java.io.Serializable {
    private static final long serialVersionUID = 0L;
	/**id*/
	private java.lang.String id;
	/**payid*/
	private java.lang.String payid;
	/**chargename*/
	private java.lang.String chargename;
	/**chargestandard*/
	private java.lang.Double chargestandard;
	/**payreal*/
	private java.lang.Double payreal;
	/**paybalance*/
	private java.lang.Double paybalance;
	/**chargetime*/
	private java.util.Date chargetime;
	/**owername*/
	private java.lang.String owername;
	/**paystate*/
	private java.lang.String paystate;
	/**paymonth*/
	private java.lang.String paymonth;
	
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
	 *@return: java.lang.String  payid
	 */
	@Column(name ="PAYID",nullable=true,length=64)
	public java.lang.String getPayid(){
		return this.payid;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  payid
	 */
	public void setPayid(java.lang.String payid){
		this.payid = payid;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  chargename
	 */
	@Column(name ="CHARGENAME",nullable=true,length=64)
	public java.lang.String getChargename(){
		return this.chargename;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  chargename
	 */
	public void setChargename(java.lang.String chargename){
		this.chargename = chargename;
	}
	/**
	 *方法: 取得java.lang.Double
	 *@return: java.lang.Double  chargestandard
	 */
	@Column(name ="CHARGESTANDARD",nullable=true,precision=12,scale=2)
	public java.lang.Double getChargestandard(){
		return this.chargestandard;
	}

	/**
	 *方法: 设置java.lang.Double
	 *@param: java.lang.Double  chargestandard
	 */
	public void setChargestandard(java.lang.Double chargestandard){
		this.chargestandard = chargestandard;
	}
	/**
	 *方法: 取得java.lang.Double
	 *@return: java.lang.Double  payreal
	 */
	@Column(name ="PAYREAL",nullable=true,precision=12,scale=2)
	public java.lang.Double getPayreal(){
		return this.payreal;
	}

	/**
	 *方法: 设置java.lang.Double
	 *@param: java.lang.Double  payreal
	 */
	public void setPayreal(java.lang.Double payreal){
		this.payreal = payreal;
	}
	/**
	 *方法: 取得java.lang.Double
	 *@return: java.lang.Double  paybalance
	 */
	@Column(name ="PAYBALANCE",nullable=true,precision=12,scale=2)
	public java.lang.Double getPaybalance(){
		return this.paybalance;
	}

	/**
	 *方法: 设置java.lang.Double
	 *@param: java.lang.Double  paybalance
	 */
	public void setPaybalance(java.lang.Double paybalance){
		this.paybalance = paybalance;
	}
	/**
	 *方法: 取得java.util.Date
	 *@return: java.util.Date  chargetime
	 */
	@Column(name ="CHARGETIME",nullable=true)
	public java.util.Date getChargetime(){
		return this.chargetime;
	}

	/**
	 *方法: 设置java.util.Date
	 *@param: java.util.Date  chargetime
	 */
	public void setChargetime(java.util.Date chargetime){
		this.chargetime = chargetime;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  owername
	 */
	@Column(name ="OWERNAME",nullable=true,length=64)
	public java.lang.String getOwername(){
		return this.owername;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  owername
	 */
	public void setOwername(java.lang.String owername){
		this.owername = owername;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  paystate
	 */
	@Column(name ="PAYSTATE",nullable=true,length=8)
	public java.lang.String getPaystate(){
		return this.paystate;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  paystate
	 */
	public void setPaystate(java.lang.String paystate){
		this.paystate = paystate;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  paymonth
	 */
	@Column(name ="PAYMONTH",nullable=true,length=8)
	public java.lang.String getPaymonth(){
		return this.paymonth;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  paymonth
	 */
	public void setPaymonth(java.lang.String paymonth){
		this.paymonth = paymonth;
	}
}
