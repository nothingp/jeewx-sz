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
 * @Description: ftth_info
 * @author onlineGenerator
 * @date 2019-03-27 23:00:36
 * @version V1.0   
 *
 */
@Entity
@Table(name = "ftth_info", schema = "")
@SuppressWarnings("serial")
public class FtthInfoEntity implements java.io.Serializable {
	/**主键*/
	private java.lang.String id;
	/**报装人open_id*/
	@Excel(exportName="报装人open_id")
	private java.lang.String openId;
	/**报装人电话*/
	@Excel(exportName="报装人电话")
	private java.lang.String phone;
	/**宽带地址*/
	@Excel(exportName="宽带地址")
	private java.lang.String address;
	/**状态*/
	@Excel(exportName="状态")
	private java.lang.String state;
	/**创建时间*/
	@Excel(exportName="创建时间")
	private java.util.Date createTime;
	/**分销者open_id*/
	@Excel(exportName="分销者open_id")
	private java.lang.String sellerOpenId;
	/**是否分佣*/
	@Excel(exportName="是否分佣")
	private java.lang.String isDeal;
	
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
	 *@return: java.lang.String  报装人open_id
	 */
	@Column(name ="OPEN_ID",nullable=true,length=200)
	public java.lang.String getOpenId(){
		return this.openId;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  报装人open_id
	 */
	public void setOpenId(java.lang.String openId){
		this.openId = openId;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  报装人电话
	 */
	@Column(name ="PHONE",nullable=true,length=200)
	public java.lang.String getPhone(){
		return this.phone;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  报装人电话
	 */
	public void setPhone(java.lang.String phone){
		this.phone = phone;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  宽带地址
	 */
	@Column(name ="ADDRESS",nullable=true,length=500)
	public java.lang.String getAddress(){
		return this.address;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  宽带地址
	 */
	public void setAddress(java.lang.String address){
		this.address = address;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  状态
	 */
	@Column(name ="STATE",nullable=true,length=1)
	public java.lang.String getState(){
		return this.state;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  状态
	 */
	public void setState(java.lang.String state){
		this.state = state;
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
	 *@return: java.lang.String  分销者open_id
	 */
	@Column(name ="SELLER_OPEN_ID",nullable=true,length=100)
	public java.lang.String getSellerOpenId(){
		return this.sellerOpenId;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  分销者open_id
	 */
	public void setSellerOpenId(java.lang.String sellerOpenId){
		this.sellerOpenId = sellerOpenId;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  是否分佣
	 */
	@Column(name ="IS_DEAL",nullable=true,length=32)
	public java.lang.String getIsDeal(){
		return this.isDeal;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  是否分佣
	 */
	public void setIsDeal(java.lang.String isDeal){
		this.isDeal = isDeal;
	}
}
