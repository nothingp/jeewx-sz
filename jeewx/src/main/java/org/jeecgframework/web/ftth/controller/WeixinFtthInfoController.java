package org.jeecgframework.web.ftth.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.jeecgframework.web.cgform.common.CgAutoListConstant;
import org.jeecgframework.web.cgform.common.SysVar;
import org.jeecgframework.web.cgform.engine.FreemarkerHelper;
import org.jeecgframework.web.cgform.entity.config.CgFormFieldEntity;
import org.jeecgframework.web.cgform.service.autolist.CgTableServiceI;
import org.jeecgframework.web.cgform.service.autolist.ConfigServiceI;
import org.jeecgframework.web.cgform.service.config.CgFormFieldServiceI;
import org.jeecgframework.web.cgform.util.QueryParamUtil;
import org.jeecgframework.web.system.pojo.base.DictEntity;
import org.jeecgframework.web.system.service.SystemService;
import org.apache.log4j.Logger;
import org.jeecgframework.core.common.controller.BaseController;
import org.jeecgframework.core.common.exception.BusinessException;
import org.jeecgframework.core.common.model.json.AjaxJson;
import org.jeecgframework.core.common.model.json.DataGrid;
import org.jeecgframework.core.constant.Globals;
import org.jeecgframework.core.util.ResourceUtil;
import org.jeecgframework.core.util.StringUtil;
import org.jeecgframework.core.util.oConvertUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.buss.lan.entity.FtthCommissionInfoEntity;
import com.buss.lan.entity.FtthCustomerInfoEntity;
import com.buss.lan.entity.FtthInfoEntity;
import com.buss.lan.service.FtthCommissionInfoServiceI;
import com.buss.lan.service.FtthCustomerInfoServiceI;
import com.buss.lan.service.FtthInfoServiceI;

/**
 * 
 * @Title:WeixinFtthInfoController
 * @description:WeixinFtthInfoController
 * @author zhoujd
 * @date Jul 5, 2013 2:55:36 PM
 * @version V1.0
 */
@Controller
@RequestMapping("/weixinFtthInfoController")
public class WeixinFtthInfoController extends BaseController{

	private static Logger log = Logger.getLogger(WeixinFtthInfoController.class);
	
	@Autowired
	private FtthInfoServiceI ftthInfoService;
	
	@Autowired
    private FtthCustomerInfoServiceI ftthCustomerInfoServiceI;
	
	@Autowired
	private FtthCommissionInfoServiceI ftthCommissionInfoServiceI;
	
	@Autowired
	private SystemService systemService;
	private String message;
	
	@RequestMapping(params = "ftthInfoListWechat")
	public ModelAndView ftthInfoListWechat(HttpServletRequest request) {
		
		return new ModelAndView("ftth/ftthInfoListWechat");
	}
	
	@RequestMapping(params = "myWallet")
	public ModelAndView myWallet(HttpServletRequest request) {
		String openId = (String)request.getSession().getAttribute("openId");
		FtthCommissionInfoEntity ftthCommissionInfoEntity = ftthCommissionInfoServiceI.findByOpenId(openId);
		
		ModelAndView mav=new ModelAndView("ftth/myWallet");
		mav.addObject("amount", ftthCommissionInfoEntity.getAmount());
		mav.addObject("dealAmount", ftthCommissionInfoEntity.getDealAmount());
		mav.addObject("resellCount", ftthCommissionInfoServiceI.findTotalByOpenId(openId));
		mav.addObject("resellCountMonth", ftthCommissionInfoServiceI.findMonthTotalByOpenId(openId));
	
		return mav;
	}
	
	@RequestMapping(params = "myTeam")
	public ModelAndView myTeam(HttpServletRequest request) {
		ModelAndView mav=new ModelAndView("ftth/myTeam");
		String openId = (String)request.getSession().getAttribute("openId");
		FtthCustomerInfoEntity ftthCustomerInfoEntity =  ftthCustomerInfoServiceI.findByOpenId(openId);
		
		if(StringUtil.isNotEmpty(ftthCustomerInfoEntity.getUpperOpenId())){
			ftthCustomerInfoEntity = ftthCustomerInfoServiceI.findByOpenId(openId);
			mav.addObject("upperName", ftthCustomerInfoEntity.getName());
		}else{
			mav.addObject("upperName", "--");
		}
		
		mav.addObject("teamCount", ftthCustomerInfoServiceI.countByUpperOpenId(openId));
	
		return mav;
	}
	
	@RequestMapping(params = "doAdd")
	public ModelAndView doAdd(FtthInfoEntity ftthInfo, HttpServletRequest request) {
		AjaxJson j = new AjaxJson();
		message = "ftth_info添加成功";
		try{
			ftthInfo.setCreateTime(new Date());
			ftthInfoService.save(ftthInfo);
			
			FtthCustomerInfoEntity ftthCustomerInfoEntity = ftthCustomerInfoServiceI.findByOpenId(ftthInfo.getOpenId());
	        //更新客户电话
	        if(ftthCustomerInfoEntity!=null){
	        	ftthCustomerInfoEntity.setPhone(ftthInfo.getPhone());
	            ftthCustomerInfoServiceI.save(ftthCustomerInfoEntity);
	        }
	        
			systemService.addLog(message, Globals.Log_Type_INSERT, Globals.Log_Leavel_INFO);
		}catch(Exception e){
			e.printStackTrace();
			message = "ftth_info添加失败";
			throw new BusinessException(e.getMessage());
		}
		j.setMsg(message);
		return new ModelAndView("ftth/saveSuccess");
	}
}
