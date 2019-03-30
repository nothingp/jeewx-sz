package com.buss.lan.service;
import com.buss.lan.entity.FtthCommissionInfoEntity;
import com.buss.detail.entity.FtthCommissionDetailEntity;
import com.buss.log.entity.FtthCommissionLogEntity;

import java.util.List;
import org.jeecgframework.core.common.service.CommonService;
import java.io.Serializable;

public interface FtthCommissionInfoServiceI extends CommonService{
	
 	public <T> void delete(T entity);
	/**
	 * 添加一对多
	 * 
	 */
	public void addMain(FtthCommissionInfoEntity ftthCommissionInfo,
	        List<FtthCommissionDetailEntity> ftthCommissionDetailList,List<FtthCommissionLogEntity> ftthCommissionLogList) ;
	/**
	 * 修改一对多
	 * 
	 */
	public void updateMain(FtthCommissionInfoEntity ftthCommissionInfo,
	        List<FtthCommissionDetailEntity> ftthCommissionDetailList,List<FtthCommissionLogEntity> ftthCommissionLogList);
	public void delMain (FtthCommissionInfoEntity ftthCommissionInfo);
	
 	/**
	 * 默认按钮-sql增强-新增操作
	 * @param id
	 * @return
	 */
 	public boolean doAddSql(FtthCommissionInfoEntity t);
 	/**
	 * 默认按钮-sql增强-更新操作
	 * @param id
	 * @return
	 */
 	public boolean doUpdateSql(FtthCommissionInfoEntity t);
 	/**
	 * 默认按钮-sql增强-删除操作
	 * @param id
	 * @return
	 */
 	public boolean doDelSql(FtthCommissionInfoEntity t);
}
