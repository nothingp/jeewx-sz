package com.buss.detail.entity;

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
 * @Description: 佣金明细
 * @author onlineGenerator
 * @date 2019-03-30 21:13:48
 * @version V1.0   
 *
 */
@Entity
@Table(name = "ftth_commission_detail", schema = "")
@SuppressWarnings("serial")
public class FtthCommissionDetailEntity implements java.io.Serializable {
	/**主键*/
	private java.lang.String id;
	/**客户分佣信息ID*/
	@Excel(exportName="客户分佣信息ID")
	private java.lang.String ftthCommissionId;
	/**报装订单Id*/
	@Excel(exportName="报装订单Id")
	private java.lang.String ftthInfoId;
	/**分销级次*/
	@Excel(exportName="分销级次")
	private java.lang.Integer level;
	/**金额*/
	@Excel(exportName="金额")
	private java.lang.Double amount;
	/**创建时间*/
	@Excel(exportName="创建时间")
	private java.util.Date createTime;
	
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
	 *@return: java.lang.String  客户分佣信息ID
	 */
	@Column(name ="FTTH_COMMISSION_ID",nullable=true,length=36)
	public java.lang.String getFtthCommissionId(){
		return this.ftthCommissionId;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  客户分佣信息ID
	 */
	public void setFtthCommissionId(java.lang.String ftthCommissionId){
		this.ftthCommissionId = ftthCommissionId;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  报装订单Id
	 */
	@Column(name ="FTTH_INFO_ID",nullable=true,length=36)
	public java.lang.String getFtthInfoId(){
		return this.ftthInfoId;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  报装订单Id
	 */
	public void setFtthInfoId(java.lang.String ftthInfoId){
		this.ftthInfoId = ftthInfoId;
	}
	/**
	 *方法: 取得java.lang.Integer
	 *@return: java.lang.Integer  分销级次
	 */
	@Column(name ="LEVEL",nullable=true,length=10)
	public java.lang.Integer getLevel(){
		return this.level;
	}

	/**
	 *方法: 设置java.lang.Integer
	 *@param: java.lang.Integer  分销级次
	 */
	public void setLevel(java.lang.Integer level){
		this.level = level;
	}
	/**
	 *方法: 取得java.lang.Double
	 *@return: java.lang.Double  金额
	 */
	@Column(name ="AMOUNT",nullable=true,length=22)
	public java.lang.Double getAmount(){
		return this.amount;
	}

	/**
	 *方法: 设置java.lang.Double
	 *@param: java.lang.Double  金额
	 */
	public void setAmount(java.lang.Double amount){
		this.amount = amount;
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
}
