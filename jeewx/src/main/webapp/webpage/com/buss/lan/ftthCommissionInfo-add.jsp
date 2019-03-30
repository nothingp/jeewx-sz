<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/context/mytags.jsp"%>
<!DOCTYPE html>
<html>
 <head>
  <title>ftth_commission_info</title>
  <t:base type="jquery,easyui,tools,DatePicker"></t:base>
    <script type="text/javascript" src="plug-in/ckeditor_new/ckeditor.js"></script>
  <script type="text/javascript" src="plug-in/ckfinder/ckfinder.js"></script>
  <script type="text/javascript">
  $(document).ready(function(){
	$('#tt').tabs({
	   onSelect:function(title){
	       $('#tt .panel-body').css('width','auto');
		}
	});
	$(".tabs-wrap").css('width','100%');
  });
 </script>
 </head>
 <body style="overflow-x: hidden;">
  <t:formvalid formid="formobj" dialog="true" usePlugin="password" layout="table" tiptype="1" action="ftthCommissionInfoController.do?doAdd">
					<input id="id" name="id" type="hidden" value="${ftthCommissionInfoPage.id }">
	<table cellpadding="0" cellspacing="1" class="formtable">
		<tr>
			<td align="right">
				<label class="Validform_label">客户open_id:</label>
			</td>
			<td class="value">
		     	 <input id="openId" name="openId" type="text" style="width: 150px" class="inputxt"  
					               
					               >
				<span class="Validform_checktip"></span>
				<label class="Validform_label" style="display: none;">客户open_id</label>
			</td>
			<td align="right">
				<label class="Validform_label">佣金总额:</label>
			</td>
			<td class="value">
		     	 <input id="amount" name="amount" type="text" style="width: 150px" class="inputxt"  
					               
					               >
				<span class="Validform_checktip"></span>
				<label class="Validform_label" style="display: none;">佣金总额</label>
			</td>
		</tr>
		<tr>
			<td align="right">
				<label class="Validform_label">提现金额:</label>
			</td>
			<td class="value">
		     	 <input id="dealAmount" name="dealAmount" type="text" style="width: 150px" class="inputxt"  
					               
					               >
				<span class="Validform_checktip"></span>
				<label class="Validform_label" style="display: none;">提现金额</label>
			</td>
			<td align="right">
				<label class="Validform_label">创建时间:</label>
			</td>
			<td class="value">
					  <input id="createTime" name="createTime" type="text" style="width: 150px" 
		      						class="Wdate" onClick="WdatePicker()"
					                
					               >    
				<span class="Validform_checktip"></span>
				<label class="Validform_label" style="display: none;">创建时间</label>
			</td>
		</tr>
	</table>
			<div style="width: auto;height: 200px;">
				<%-- 增加一个div，用于调节页面大小，否则默认太小 --%>
				<div style="width:800px;height:1px;"></div>
				<t:tabs id="tt" iframe="false" tabPosition="top" fit="false">
				 <t:tab href="ftthCommissionInfoController.do?ftthCommissionDetailList" icon="icon-search" title="佣金明细" id="ftthCommissionDetail"></t:tab>
				 <t:tab href="ftthCommissionInfoController.do?ftthCommissionLogList" icon="icon-search" title="提现日志" id="ftthCommissionLog"></t:tab>
				</t:tabs>
			</div>
			</t:formvalid>
			<!-- 添加 附表明细 模版 -->
	<table style="display:none">
	<tbody id="add_ftthCommissionDetail_table_template">
		<tr>
			 <td align="center"><div style="width: 25px;" name="xh"></div></td>
			 <td align="center"><input style="width:20px;" type="checkbox" name="ck"/></td>
				  <td align="left">
					  	<input name="ftthCommissionDetailList[#index#].ftthCommissionId" maxlength="36" 
					  		type="text" class="inputxt"  style="width:120px;"
					               
					               >
					  <label class="Validform_label" style="display: none;">客户分佣信息ID</label>
				  </td>
				  <td align="left">
					  	<input name="ftthCommissionDetailList[#index#].ftthInfoId" maxlength="36" 
					  		type="text" class="inputxt"  style="width:120px;"
					               
					               >
					  <label class="Validform_label" style="display: none;">报装订单Id</label>
				  </td>
				  <td align="left">
					  	<input name="ftthCommissionDetailList[#index#].level" maxlength="10" 
					  		type="text" class="inputxt"  style="width:120px;"
					               
					               >
					  <label class="Validform_label" style="display: none;">分销级次</label>
				  </td>
				  <td align="left">
					  	<input name="ftthCommissionDetailList[#index#].amount" maxlength="22" 
					  		type="text" class="inputxt"  style="width:120px;"
					               
					               >
					  <label class="Validform_label" style="display: none;">金额</label>
				  </td>
				  <td align="left">
							<input name="ftthCommissionDetailList[#index#].createTime" maxlength="0" 
					  		type="text" class="Wdate" onClick="WdatePicker()"  style="width:120px;"
					                
					               >  
					  <label class="Validform_label" style="display: none;">创建时间</label>
				  </td>
			</tr>
		 </tbody>
	<tbody id="add_ftthCommissionLog_table_template">
		<tr>
			 <td align="center"><div style="width: 25px;" name="xh"></div></td>
			 <td align="center"><input style="width:20px;" type="checkbox" name="ck"/></td>
				  <td align="left">
					  	<input name="ftthCommissionLogList[#index#].ftthCommissionId" maxlength="200" 
					  		type="text" class="inputxt"  style="width:120px;"
					               
					               >
					  <label class="Validform_label" style="display: none;">客户分佣信息ID</label>
				  </td>
				  <td align="left">
					  	<input name="ftthCommissionLogList[#index#].dealAmount" maxlength="22" 
					  		type="text" class="inputxt"  style="width:120px;"
					               
					               >
					  <label class="Validform_label" style="display: none;">提现金额</label>
				  </td>
				  <td align="left">
							<input name="ftthCommissionLogList[#index#].createTime" maxlength="0" 
					  		type="text" class="Wdate" onClick="WdatePicker()"  style="width:120px;"
					                
					               >  
					  <label class="Validform_label" style="display: none;">创建时间</label>
				  </td>
			</tr>
		 </tbody>
		</table>
 </body>
 <script src = "webpage/com/buss/lan/ftthCommissionInfo.js"></script>	