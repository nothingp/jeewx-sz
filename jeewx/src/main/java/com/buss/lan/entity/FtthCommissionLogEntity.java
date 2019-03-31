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
 * @Description: 提现日志
 * @author onlineGenerator
 * @date 2019-03-30 21:13:49
 * @version V1.0   
 *
 */
@Entity
@Table(name = "ftth_commission_log", schema = "")
@SuppressWarnings("serial")
public class FtthCommissionLogEntity implements java.io.Serializable {
	/**主键*/
	private java.lang.String id;
	/**客户分佣信息ID*/
	@Excel(exportName="客户分佣信息ID")
	private java.lang.String ftthCommissionId;
	/**提现金额*/
	@Excel(exportName="提现金额")
	private java.lang.Double dealAmount;
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
	@Column(name ="FTTH_COMMISSION_ID",nullable=true,length=200)
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
	 *方法: 取得java.lang.Double
	 *@return: java.lang.Double  提现金额
	 */
	@Column(name ="DEAL_AMOUNT",nullable=true,length=22)
	public java.lang.Double getDealAmount(){
		return this.dealAmount;
	}

	/**
	 *方法: 设置java.lang.Double
	 *@param: java.lang.Double  提现金额
	 */
	public void setDealAmount(java.lang.Double dealAmount){
		this.dealAmount = dealAmount;
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
