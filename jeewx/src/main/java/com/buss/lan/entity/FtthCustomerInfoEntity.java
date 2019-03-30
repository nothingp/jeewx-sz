package com.buss.lan.entity;

import java.math.BigDecimal;
import java.util.Date;
import java.lang.String;
import java.lang.Double;
import java.lang.Integer;
import java.math.BigDecimal;
import javax.xml.soap.Text;
import java.sql.Blob;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import org.hibernate.annotations.GenericGenerator;
import javax.persistence.SequenceGenerator;
import org.jeecgframework.poi.excel.annotation.Excel;

/**   
 * @Title: Entity
 * @Description: ftth_customer_info
 * @author onlineGenerator
 * @date 2019-03-30 20:30:54
 * @version V1.0   
 *
 */
@Entity
@Table(name = "ftth_customer_info", schema = "")
@SuppressWarnings("serial")
public class FtthCustomerInfoEntity implements java.io.Serializable {
	/**主键*/
	private java.lang.String id;
	/**微信open_id*/
	@Excel(exportName="微信open_id")
	private java.lang.String openId;
	/**电话*/
	@Excel(exportName="电话")
	private java.lang.String phone;
	/**姓名*/
	@Excel(exportName="姓名")
	private java.lang.String name;
	/**创建时间*/
	@Excel(exportName="创建时间")
	private java.util.Date createTime;
	/**上级分销open_id*/
	@Excel(exportName="上级分销open_id")
	private java.lang.String upperOpenId;
	/**小区*/
	@Excel(exportName="小区")
	private java.lang.String area;
	
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  主键
	 */
	@Id
	@GeneratedValue(generator = "paymentableGenerator")
	@GenericGenerator(name = "paymentableGenerator", strategy = "uuid")
	@Column(name ="ID",nullable=false,length=36)
	public java.lang.String getId(){
		return this.id;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  主键
	 */
	public void setId(java.lang.String id){
		this.id = id;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  微信open_id
	 */
	@Column(name ="OPEN_ID",nullable=true,length=200)
	public java.lang.String getOpenId(){
		return this.openId;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  微信open_id
	 */
	public void setOpenId(java.lang.String openId){
		this.openId = openId;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  电话
	 */
	@Column(name ="PHONE",nullable=true,length=200)
	public java.lang.String getPhone(){
		return this.phone;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  电话
	 */
	public void setPhone(java.lang.String phone){
		this.phone = phone;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  姓名
	 */
	@Column(name ="NAME",nullable=true,length=500)
	public java.lang.String getName(){
		return this.name;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  姓名
	 */
	public void setName(java.lang.String name){
		this.name = name;
	}
	/**
	 *方法: 取得java.util.Date
	 *@return: java.util.Date  创建时间
	 */
	@Column(name ="CREATE_TIME",nullable=true)
	public java.util.Date getCreateTime(){
		return this.createTime;
	}

	/**
	 *方法: 设置java.util.Date
	 *@param: java.util.Date  创建时间
	 */
	public void setCreateTime(java.util.Date createTime){
		this.createTime = createTime;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  上级分销open_id
	 */
	@Column(name ="UPPER_OPEN_ID",nullable=true,length=100)
	public java.lang.String getUpperOpenId(){
		return this.upperOpenId;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  上级分销open_id
	 */
	public void setUpperOpenId(java.lang.String upperOpenId){
		this.upperOpenId = upperOpenId;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  小区
	 */
	@Column(name ="AREA",nullable=true,length=32)
	public java.lang.String getArea(){
		return this.area;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  小区
	 */
	public void setArea(java.lang.String area){
		this.area = area;
	}
}
