
package com.buss.lan.page;
import com.buss.lan.entity.FtthCommissionInfoEntity;
import com.buss.detail.entity.FtthCommissionDetailEntity;
import com.buss.log.entity.FtthCommissionLogEntity;

import java.math.BigDecimal;
import java.util.Date;
import java.util.List;
import java.util.ArrayList;

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
 * @Description: ftth_commission_info
 * @author onlineGenerator
 * @date 2019-03-30 21:13:49
 * @version V1.0   
 *
 */
public class FtthCommissionInfoPage implements java.io.Serializable {
	/**保存-佣金明细*/
	private List<FtthCommissionDetailEntity> ftthCommissionDetailList = new ArrayList<FtthCommissionDetailEntity>();
	public List<FtthCommissionDetailEntity> getFtthCommissionDetailList() {
		return ftthCommissionDetailList;
	}
	public void setFtthCommissionDetailList(List<FtthCommissionDetailEntity> ftthCommissionDetailList) {
		this.ftthCommissionDetailList = ftthCommissionDetailList;
	}
	/**保存-提现日志*/
	private List<FtthCommissionLogEntity> ftthCommissionLogList = new ArrayList<FtthCommissionLogEntity>();
	public List<FtthCommissionLogEntity> getFtthCommissionLogList() {
		return ftthCommissionLogList;
	}
	public void setFtthCommissionLogList(List<FtthCommissionLogEntity> ftthCommissionLogList) {
		this.ftthCommissionLogList = ftthCommissionLogList;
	}

	/**主键*/
	private java.lang.String id;
	/**客户open_id*/
	private java.lang.String openId;
	/**佣金总额*/
	private java.lang.Double amount;
	/**提现金额*/
	private java.lang.Double dealAmount;
	/**创建时间*/
	private java.util.Date createTime;
	
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  主键
	 */
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
	 *@return: java.lang.String  客户open_id
	 */
	public java.lang.String getOpenId(){
		return this.openId;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  客户open_id
	 */
	public void setOpenId(java.lang.String openId){
		this.openId = openId;
	}
	/**
	 *方法: 取得java.lang.Double
	 *@return: java.lang.Double  佣金总额
	 */
	public java.lang.Double getAmount(){
		return this.amount;
	}

	/**
	 *方法: 设置java.lang.Double
	 *@param: java.lang.Double  佣金总额
	 */
	public void setAmount(java.lang.Double amount){
		this.amount = amount;
	}
	/**
	 *方法: 取得java.lang.Double
	 *@return: java.lang.Double  提现金额
	 */
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
