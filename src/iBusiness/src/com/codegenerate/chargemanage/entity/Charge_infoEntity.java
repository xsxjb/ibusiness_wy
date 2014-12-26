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
 * @Description: 收费项目表页面
 * @author JiangBo
 *
 */
@Entity
@Table(name = "IB_CHARGE_INFO")
public class Charge_infoEntity implements java.io.Serializable {
    private static final long serialVersionUID = 0L;
	/**id*/
	private java.lang.String id;
	/**chargeid*/
	private java.lang.String chargeid;
	/**chargename*/
	private java.lang.String chargename;
	/**chargestandard*/
	private java.lang.Double chargestandard;
	
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
	 *@return: java.lang.String  chargeid
	 */
	@Column(name ="CHARGEID",nullable=true,length=64)
	public java.lang.String getChargeid(){
		return this.chargeid;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  chargeid
	 */
	public void setChargeid(java.lang.String chargeid){
		this.chargeid = chargeid;
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
}
