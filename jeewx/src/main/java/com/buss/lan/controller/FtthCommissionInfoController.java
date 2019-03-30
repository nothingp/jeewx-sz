package com.buss.lan.controller;
import com.buss.lan.entity.FtthCommissionInfoEntity;
import com.buss.lan.service.FtthCommissionInfoServiceI;
import com.buss.lan.page.FtthCommissionInfoPage;
import com.buss.detail.entity.FtthCommissionDetailEntity;
import com.buss.log.entity.FtthCommissionLogEntity;
import java.util.List;
import java.text.SimpleDateFormat;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import org.jeecgframework.core.common.controller.BaseController;
import org.jeecgframework.core.common.exception.BusinessException;
import org.jeecgframework.core.common.hibernate.qbc.CriteriaQuery;
import org.jeecgframework.core.common.model.json.AjaxJson;
import org.jeecgframework.core.common.model.json.DataGrid;
import org.jeecgframework.core.constant.Globals;
import org.jeecgframework.core.util.StringUtil;
import org.jeecgframework.tag.core.easyui.TagUtil;
import org.jeecgframework.web.system.pojo.base.TSDepart;
import org.jeecgframework.web.system.service.SystemService;
import org.jeecgframework.core.util.MyBeanUtils;


/**   
 * @Title: Controller
 * @Description: ftth_commission_info
 * @author onlineGenerator
 * @date 2019-03-30 21:13:49
 * @version V1.0   
 *
 */
@Controller
@RequestMapping("/ftthCommissionInfoController")
public class FtthCommissionInfoController extends BaseController {
	/**
	 * Logger for this class
	 */
	private static final Logger logger = Logger.getLogger(FtthCommissionInfoController.class);

	@Autowired
	private FtthCommissionInfoServiceI ftthCommissionInfoService;
	@Autowired
	private SystemService systemService;


	/**
	 * ftth_commission_info列表 页面跳转
	 * 
	 * @return
	 */
	@RequestMapping(params = "ftthCommissionInfo")
	public ModelAndView ftthCommissionInfo(HttpServletRequest request) {
		return new ModelAndView("com/buss/lan/ftthCommissionInfoList");
	}

	/**
	 * easyui AJAX请求数据
	 * 
	 * @param request
	 * @param response
	 * @param dataGrid
	 * @param user
	 */

	@RequestMapping(params = "datagrid")
	public void datagrid(FtthCommissionInfoEntity ftthCommissionInfo,HttpServletRequest request, HttpServletResponse response, DataGrid dataGrid) {
		CriteriaQuery cq = new CriteriaQuery(FtthCommissionInfoEntity.class, dataGrid);
		//查询条件组装器
		org.jeecgframework.core.extend.hqlsearch.HqlGenerateUtil.installHql(cq, ftthCommissionInfo);
		try{
		//自定义追加查询条件
		}catch (Exception e) {
			throw new BusinessException(e.getMessage());
		}
		cq.add();
		this.ftthCommissionInfoService.getDataGridReturn(cq, true);
		TagUtil.datagrid(response, dataGrid);
	}

	/**
	 * 删除ftth_commission_info
	 * 
	 * @return
	 */
	@RequestMapping(params = "doDel")
	@ResponseBody
	public AjaxJson doDel(FtthCommissionInfoEntity ftthCommissionInfo, HttpServletRequest request) {
		AjaxJson j = new AjaxJson();
		ftthCommissionInfo = systemService.getEntity(FtthCommissionInfoEntity.class, ftthCommissionInfo.getId());
		String message = "ftth_commission_info删除成功";
		try{
			ftthCommissionInfoService.delMain(ftthCommissionInfo);
			systemService.addLog(message, Globals.Log_Type_DEL, Globals.Log_Leavel_INFO);
		}catch(Exception e){
			e.printStackTrace();
			message = "ftth_commission_info删除失败";
			throw new BusinessException(e.getMessage());
		}
		j.setMsg(message);
		return j;
	}

	/**
	 * 批量删除ftth_commission_info
	 * 
	 * @return
	 */
	 @RequestMapping(params = "doBatchDel")
	@ResponseBody
	public AjaxJson doBatchDel(String ids,HttpServletRequest request){
		AjaxJson j = new AjaxJson();
		String message = "ftth_commission_info删除成功";
		try{
			for(String id:ids.split(",")){
				FtthCommissionInfoEntity ftthCommissionInfo = systemService.getEntity(FtthCommissionInfoEntity.class,
				id
				);
				ftthCommissionInfoService.delMain(ftthCommissionInfo);
				systemService.addLog(message, Globals.Log_Type_DEL, Globals.Log_Leavel_INFO);
			}
		}catch(Exception e){
			e.printStackTrace();
			message = "ftth_commission_info删除失败";
			throw new BusinessException(e.getMessage());
		}
		j.setMsg(message);
		return j;
	}

	/**
	 * 添加ftth_commission_info
	 * 
	 * @param ids
	 * @return
	 */
	@RequestMapping(params = "doAdd")
	@ResponseBody
	public AjaxJson doAdd(FtthCommissionInfoEntity ftthCommissionInfo,FtthCommissionInfoPage ftthCommissionInfoPage, HttpServletRequest request) {
		List<FtthCommissionDetailEntity> ftthCommissionDetailList =  ftthCommissionInfoPage.getFtthCommissionDetailList();
		List<FtthCommissionLogEntity> ftthCommissionLogList =  ftthCommissionInfoPage.getFtthCommissionLogList();
		AjaxJson j = new AjaxJson();
		String message = "添加成功";
		try{
			ftthCommissionInfoService.addMain(ftthCommissionInfo, ftthCommissionDetailList,ftthCommissionLogList);
			systemService.addLog(message, Globals.Log_Type_INSERT, Globals.Log_Leavel_INFO);
		}catch(Exception e){
			e.printStackTrace();
			message = "ftth_commission_info添加失败";
			throw new BusinessException(e.getMessage());
		}
		j.setMsg(message);
		return j;
	}
	/**
	 * 更新ftth_commission_info
	 * 
	 * @param ids
	 * @return
	 */
	@RequestMapping(params = "doUpdate")
	@ResponseBody
	public AjaxJson doUpdate(FtthCommissionInfoEntity ftthCommissionInfo,FtthCommissionInfoPage ftthCommissionInfoPage, HttpServletRequest request) {
		List<FtthCommissionDetailEntity> ftthCommissionDetailList =  ftthCommissionInfoPage.getFtthCommissionDetailList();
		List<FtthCommissionLogEntity> ftthCommissionLogList =  ftthCommissionInfoPage.getFtthCommissionLogList();
		AjaxJson j = new AjaxJson();
		String message = "更新成功";
		try{
			ftthCommissionInfoService.updateMain(ftthCommissionInfo, ftthCommissionDetailList,ftthCommissionLogList);
			systemService.addLog(message, Globals.Log_Type_UPDATE, Globals.Log_Leavel_INFO);
		}catch(Exception e){
			e.printStackTrace();
			message = "更新ftth_commission_info失败";
			throw new BusinessException(e.getMessage());
		}
		j.setMsg(message);
		return j;
	}

	/**
	 * ftth_commission_info新增页面跳转
	 * 
	 * @return
	 */
	@RequestMapping(params = "goAdd")
	public ModelAndView goAdd(FtthCommissionInfoEntity ftthCommissionInfo, HttpServletRequest req) {
		if (StringUtil.isNotEmpty(ftthCommissionInfo.getId())) {
			ftthCommissionInfo = ftthCommissionInfoService.getEntity(FtthCommissionInfoEntity.class, ftthCommissionInfo.getId());
			req.setAttribute("ftthCommissionInfoPage", ftthCommissionInfo);
		}
		return new ModelAndView("com/buss/lan/ftthCommissionInfo-add");
	}
	
	/**
	 * ftth_commission_info编辑页面跳转
	 * 
	 * @return
	 */
	@RequestMapping(params = "goUpdate")
	public ModelAndView goUpdate(FtthCommissionInfoEntity ftthCommissionInfo, HttpServletRequest req) {
		if (StringUtil.isNotEmpty(ftthCommissionInfo.getId())) {
			ftthCommissionInfo = ftthCommissionInfoService.getEntity(FtthCommissionInfoEntity.class, ftthCommissionInfo.getId());
			req.setAttribute("ftthCommissionInfoPage", ftthCommissionInfo);
		}
		return new ModelAndView("com/buss/lan/ftthCommissionInfo-update");
	}
	
	
	/**
	 * 加载明细列表[佣金明细]
	 * 
	 * @return
	 */
	@RequestMapping(params = "ftthCommissionDetailList")
	public ModelAndView ftthCommissionDetailList(FtthCommissionInfoEntity ftthCommissionInfo, HttpServletRequest req) {
	
		//===================================================================================
		//获取参数
		//===================================================================================
		//查询-佣金明细
	    String hql0 = "from FtthCommissionDetailEntity where 1 = 1";
	    try{
	    	List<FtthCommissionDetailEntity> ftthCommissionDetailEntityList = systemService.findHql(hql0);
			req.setAttribute("ftthCommissionDetailList", ftthCommissionDetailEntityList);
		}catch(Exception e){
			logger.info(e.getMessage());
		}
		return new ModelAndView("com/buss/detail/ftthCommissionDetailList");
	}
	/**
	 * 加载明细列表[提现日志]
	 * 
	 * @return
	 */
	@RequestMapping(params = "ftthCommissionLogList")
	public ModelAndView ftthCommissionLogList(FtthCommissionInfoEntity ftthCommissionInfo, HttpServletRequest req) {
	
		//===================================================================================
		//获取参数
		//===================================================================================
		//查询-提现日志
	    String hql1 = "from FtthCommissionLogEntity where 1 = 1";
	    try{
	    	List<FtthCommissionLogEntity> ftthCommissionLogEntityList = systemService.findHql(hql1);
			req.setAttribute("ftthCommissionLogList", ftthCommissionLogEntityList);
		}catch(Exception e){
			logger.info(e.getMessage());
		}
		return new ModelAndView("com/buss/log/ftthCommissionLogList");
	}
	
}
