package com.buss.lan.service.impl;
import com.buss.lan.service.FtthCommissionInfoServiceI;
import com.buss.lan.service.FtthCustomerInfoServiceI;
import com.buss.lan.service.FtthInfoServiceI;

import org.jeecgframework.core.common.service.impl.CommonServiceImpl;

import com.buss.lan.entity.FtthCommissionDetailEntity;
import com.buss.lan.entity.FtthCommissionInfoEntity;
import com.buss.lan.entity.FtthCommissionLogEntity;
import com.buss.lan.entity.FtthCustomerInfoEntity;
import com.buss.lan.entity.FtthInfoEntity;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import java.util.List;
import org.jeecgframework.core.common.exception.BusinessException;
import org.jeecgframework.core.common.service.impl.CommonServiceImpl;
import org.jeecgframework.core.util.MyBeanUtils;
import org.jeecgframework.core.util.StringUtil;
import org.jeecgframework.core.util.oConvertUtils;
import java.util.ArrayList;
import java.util.Date;
import java.util.UUID;
import java.io.Serializable;


@Service("ftthCommissionInfoService")
@Transactional
public class FtthCommissionInfoServiceImpl extends CommonServiceImpl implements FtthCommissionInfoServiceI {
	
	@Autowired
	private FtthCustomerInfoServiceI ftthCustomerInfoService;
	
	@Autowired
	private FtthInfoServiceI ftthInfoService;
	
 	public <T> void delete(T entity) {
 		super.delete(entity);
 		//执行删除操作配置的sql增强
		this.doDelSql((FtthCommissionInfoEntity)entity);
 	}
	
	public void addMain(FtthCommissionInfoEntity ftthCommissionInfo,
	        List<FtthCommissionDetailEntity> ftthCommissionDetailList,List<FtthCommissionLogEntity> ftthCommissionLogList){
			//保存主信息
			this.save(ftthCommissionInfo);
		
			/**保存-佣金明细*/
			for(FtthCommissionDetailEntity ftthCommissionDetail:ftthCommissionDetailList){
				this.save(ftthCommissionDetail);
			}
			/**保存-提现日志*/
			for(FtthCommissionLogEntity ftthCommissionLog:ftthCommissionLogList){
				this.save(ftthCommissionLog);
			}
			//执行新增操作配置的sql增强
 			this.doAddSql(ftthCommissionInfo);
	}

	
	public void updateMain(FtthCommissionInfoEntity ftthCommissionInfo,
	        List<FtthCommissionDetailEntity> ftthCommissionDetailList,List<FtthCommissionLogEntity> ftthCommissionLogList) {
		//保存主表信息
		this.saveOrUpdate(ftthCommissionInfo);
		//===================================================================================
		//获取参数
		//===================================================================================
		//1.查询出数据库的明细数据-佣金明细
	    String hql0 = "from FtthCommissionDetailEntity where 1 = 1";
	    List<FtthCommissionDetailEntity> ftthCommissionDetailOldList = this.findHql(hql0);
		//2.筛选更新明细数据-佣金明细
		for(FtthCommissionDetailEntity oldE:ftthCommissionDetailOldList){
			boolean isUpdate = false;
				for(FtthCommissionDetailEntity sendE:ftthCommissionDetailList){
					//需要更新的明细数据-佣金明细
					if(oldE.getId().equals(sendE.getId())){
		    			try {
							MyBeanUtils.copyBeanNotNull2Bean(sendE,oldE);
							this.saveOrUpdate(oldE);
						} catch (Exception e) {
							e.printStackTrace();
							throw new BusinessException(e.getMessage());
						}
						isUpdate= true;
		    			break;
		    		}
		    	}
	    		if(!isUpdate){
		    		//如果数据库存在的明细，前台没有传递过来则是删除-佣金明细
		    		super.delete(oldE);
	    		}
	    		
			}
			//3.持久化新增的数据-佣金明细
			for(FtthCommissionDetailEntity ftthCommissionDetail:ftthCommissionDetailList){
				if(oConvertUtils.isEmpty(ftthCommissionDetail.getId())){
					//外键设置
					this.save(ftthCommissionDetail);
				}
			}
		//===================================================================================
		//1.查询出数据库的明细数据-提现日志
	    String hql1 = "from FtthCommissionLogEntity where 1 = 1";
	    List<FtthCommissionLogEntity> ftthCommissionLogOldList = this.findHql(hql1);
		//2.筛选更新明细数据-提现日志
		for(FtthCommissionLogEntity oldE:ftthCommissionLogOldList){
			boolean isUpdate = false;
				for(FtthCommissionLogEntity sendE:ftthCommissionLogList){
					//需要更新的明细数据-提现日志
					if(oldE.getId().equals(sendE.getId())){
		    			try {
							MyBeanUtils.copyBeanNotNull2Bean(sendE,oldE);
							this.saveOrUpdate(oldE);
						} catch (Exception e) {
							e.printStackTrace();
							throw new BusinessException(e.getMessage());
						}
						isUpdate= true;
		    			break;
		    		}
		    	}
	    		if(!isUpdate){
		    		//如果数据库存在的明细，前台没有传递过来则是删除-提现日志
		    		super.delete(oldE);
	    		}
	    		
			}
			//3.持久化新增的数据-提现日志
			for(FtthCommissionLogEntity ftthCommissionLog:ftthCommissionLogList){
				if(oConvertUtils.isEmpty(ftthCommissionLog.getId())){
					//外键设置
					this.save(ftthCommissionLog);
				}
			}
		//执行更新操作配置的sql增强
 		this.doUpdateSql(ftthCommissionInfo);
	}

	
	public void delMain(FtthCommissionInfoEntity ftthCommissionInfo) {
		//删除主表信息
		this.delete(ftthCommissionInfo);
		//===================================================================================
		//获取参数
		//===================================================================================
		//删除-佣金明细
	    String hql0 = "from FtthCommissionDetailEntity where 1 = 1";
	    List<FtthCommissionDetailEntity> ftthCommissionDetailOldList = this.findHql(hql0);
		this.deleteAllEntitie(ftthCommissionDetailOldList);
		//===================================================================================
		//删除-提现日志
	    String hql1 = "from FtthCommissionLogEntity where 1 = 1";
	    List<FtthCommissionLogEntity> ftthCommissionLogOldList = this.findHql(hql1);
		this.deleteAllEntitie(ftthCommissionLogOldList);
	}
	
 	
 	/**
	 * 默认按钮-sql增强-新增操作
	 * @param id
	 * @return
	 */
 	public boolean doAddSql(FtthCommissionInfoEntity t){
	 	return true;
 	}
 	/**
	 * 默认按钮-sql增强-更新操作
	 * @param id
	 * @return
	 */
 	public boolean doUpdateSql(FtthCommissionInfoEntity t){
	 	return true;
 	}
 	/**
	 * 默认按钮-sql增强-删除操作
	 * @param id
	 * @return
	 */
 	public boolean doDelSql(FtthCommissionInfoEntity t){
	 	return true;
 	}
 	
 	/**
	 * 替换sql中的变量
	 * @param sql
	 * @return
	 */
 	public String replaceVal(String sql,FtthCommissionInfoEntity t){
 		sql  = sql.replace("#{id}",String.valueOf(t.getId()));
 		sql  = sql.replace("#{open_id}",String.valueOf(t.getOpenId()));
 		sql  = sql.replace("#{amount}",String.valueOf(t.getAmount()));
 		sql  = sql.replace("#{deal_amount}",String.valueOf(t.getDealAmount()));
 		sql  = sql.replace("#{create_time}",String.valueOf(t.getCreateTime()));
 		sql  = sql.replace("#{UUID}",UUID.randomUUID().toString());
 		return sql;
 	}
 	
 	/**
 	 * 根据openId获取
 	 * @param openId
 	 * @return
 	 */
 	public FtthCommissionInfoEntity findByOpenId(String openId){
 		List<FtthCommissionInfoEntity> ftthCommissionInfoEntities = this.findByProperty(FtthCommissionInfoEntity.class, "openId", openId);
        
 		if(ftthCommissionInfoEntities.isEmpty())
 			return null;
        
 		return ftthCommissionInfoEntities.get(0);
 	}
 	
 	public void doCommissionImport(List<FtthInfoEntity> entities){
 		for(FtthInfoEntity entity:entities){
 			//如无分销信息则跳过
 			if(StringUtil.isEmpty(entity.getSellerOpenId())){
 				continue;
 			}
 			//一级分销
 			FtthCommissionInfoEntity ftthCommissionInfo = this.findByOpenId(entity.getSellerOpenId());
 			FtthCommissionDetailEntity ftthCommissionDetailEntity = new FtthCommissionDetailEntity();
 			ftthCommissionDetailEntity.setFtthCommissionId(ftthCommissionInfo.getId());
 			ftthCommissionDetailEntity.setFtthInfoId(entity.getId());
 			ftthCommissionDetailEntity.setLevel(1);
 			ftthCommissionDetailEntity.setAmount(new Double(30));
 			ftthCommissionDetailEntity.setCreateTime(new Date());
 			
 			ftthCommissionInfo.setAmount(ftthCommissionInfo.getAmount()+ftthCommissionDetailEntity.getAmount());
 			this.save(ftthCommissionInfo);
 			this.save(ftthCommissionDetailEntity);
 			
 			//二级分销
 			FtthCustomerInfoEntity ftthCustomerInfoEntity = ftthCustomerInfoService.findByOpenId(entity.getSellerOpenId());
 			if(StringUtil.isNotEmpty(ftthCustomerInfoEntity.getUpperOpenId())){
 				ftthCommissionInfo = this.findByOpenId(ftthCustomerInfoEntity.getUpperOpenId());
 	 			ftthCommissionDetailEntity = new FtthCommissionDetailEntity();
 	 			ftthCommissionDetailEntity.setFtthCommissionId(ftthCommissionInfo.getId());
 	 			ftthCommissionDetailEntity.setFtthInfoId(entity.getId());
 	 			ftthCommissionDetailEntity.setLevel(1);
 	 			ftthCommissionDetailEntity.setAmount(new Double(20));
 	 			ftthCommissionDetailEntity.setCreateTime(new Date());
 	 			
 	 			ftthCommissionInfo.setAmount(ftthCommissionInfo.getAmount()+ftthCommissionDetailEntity.getAmount());
 	 			this.save(ftthCommissionInfo);
 	 			
 	 			this.save(ftthCommissionDetailEntity);
 			}
 			
 			entity.setIsDeal("Y");
 			ftthInfoService.saveOrUpdate(entity);
 			
 		}
 	}
 	
 	public Long findTotalByOpenId(String openId){
 	 	return this.getCountForJdbcParam("select count(*) from ftth_commission_info a,ftth_commission_detail b "
 	 			+ "where a.open_id=? and a.id=b.ftth_commission_id",new String[]{openId});
 	}
 	
 	public Long findMonthTotalByOpenId(String openId){
 	 	return this.getCountForJdbcParam("select count(*) from ftth_commission_info a,ftth_commission_detail b "
 	 			+ "where a.open_id=? and a.id=b.ftth_commission_id and DATE_FORMAT(b.create_time,'%Y%m') = DATE_FORMAT(CURDATE(),'%Y%m')",new String[]{openId});
 	}
}