package com.buss.lan.service;
import com.buss.lan.entity.FtthCustomerInfoEntity;
import org.jeecgframework.core.common.service.CommonService;

import java.io.Serializable;

public interface FtthCustomerInfoServiceI extends CommonService{
	
 	public <T> void delete(T entity);
 	
 	public <T> Serializable save(T entity);
 	
 	public <T> void saveOrUpdate(T entity);
 	
 	/**
	 * 默认按钮-sql增强-新增操作
	 * @param id
	 * @return
	 */
 	public boolean doAddSql(FtthCustomerInfoEntity t);
 	/**
	 * 默认按钮-sql增强-更新操作
	 * @param id
	 * @return
	 */
 	public boolean doUpdateSql(FtthCustomerInfoEntity t);
 	/**
	 * 默认按钮-sql增强-删除操作
	 * @param id
	 * @return
	 */
 	public boolean doDelSql(FtthCustomerInfoEntity t);
 	
 	public FtthCustomerInfoEntity findByOpenId(String openId);
}
