package com.buss.lan.service.impl;
import com.buss.lan.service.FtthCustomerInfoServiceI;

import weixin.guanjia.core.entity.model.SubscribeUserInfo;

import org.jeecgframework.core.common.service.impl.CommonServiceImpl;
import com.buss.lan.entity.FtthCustomerInfoEntity;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.UUID;
import java.io.Serializable;

@Service("ftthCustomerInfoService")
@Transactional
public class FtthCustomerInfoServiceImpl extends CommonServiceImpl implements FtthCustomerInfoServiceI {

	
 	public <T> void delete(T entity) {
 		super.delete(entity);
 		//执行删除操作配置的sql增强
		this.doDelSql((FtthCustomerInfoEntity)entity);
 	}
 	
 	public <T> Serializable save(T entity) {
 		Serializable t = super.save(entity);
 		//执行新增操作配置的sql增强
 		this.doAddSql((FtthCustomerInfoEntity)entity);
 		return t;
 	}
 	
 	public <T> void saveOrUpdate(T entity) {
 		super.saveOrUpdate(entity);
 		//执行更新操作配置的sql增强
 		this.doUpdateSql((FtthCustomerInfoEntity)entity);
 	}
 	
 	/**
	 * 默认按钮-sql增强-新增操作
	 * @param id
	 * @return
	 */
 	public boolean doAddSql(FtthCustomerInfoEntity t){
	 	return true;
 	}
 	/**
	 * 默认按钮-sql增强-更新操作
	 * @param id
	 * @return
	 */
 	public boolean doUpdateSql(FtthCustomerInfoEntity t){
	 	return true;
 	}
 	/**
	 * 默认按钮-sql增强-删除操作
	 * @param id
	 * @return
	 */
 	public boolean doDelSql(FtthCustomerInfoEntity t){
	 	return true;
 	}
 	
 	/**
 	 * 根据openId获取
 	 * @param openId
 	 * @return
 	 */
 	public FtthCustomerInfoEntity findByOpenId(String openId){
 		List<FtthCustomerInfoEntity> ftthCustomerInfoEntities = this.findByProperty(FtthCustomerInfoEntity.class, "openId", openId);
        
 		if(ftthCustomerInfoEntities.isEmpty())
 			return null;
        
 		return ftthCustomerInfoEntities.get(0);
 	}
 	
 	/**
	 * 替换sql中的变量
	 * @param sql
	 * @return
	 */
 	public String replaceVal(String sql,FtthCustomerInfoEntity t){
 		sql  = sql.replace("#{id}",String.valueOf(t.getId()));
 		sql  = sql.replace("#{open_id}",String.valueOf(t.getOpenId()));
 		sql  = sql.replace("#{phone}",String.valueOf(t.getPhone()));
 		sql  = sql.replace("#{name}",String.valueOf(t.getName()));
 		sql  = sql.replace("#{create_time}",String.valueOf(t.getCreateTime()));
 		sql  = sql.replace("#{upper_open_id}",String.valueOf(t.getUpperOpenId()));
 		sql  = sql.replace("#{area}",String.valueOf(t.getArea()));
 		sql  = sql.replace("#{UUID}",UUID.randomUUID().toString());
 		return sql;
 	}
}