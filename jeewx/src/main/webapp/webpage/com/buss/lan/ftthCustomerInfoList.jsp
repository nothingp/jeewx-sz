<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/context/mytags.jsp"%>
<t:base type="jquery,easyui,tools,DatePicker"></t:base>
<div class="easyui-layout" fit="true">
  <div region="center" style="padding:1px;">
  <t:datagrid name="ftthCustomerInfoList" checkbox="true" fitColumns="false" title="ftth_customer_info" actionUrl="ftthCustomerInfoController.do?datagrid" idField="id" fit="true" queryMode="group">
   <t:dgCol title="主键"  field="id"  hidden="false"  queryMode="group"  width="120"></t:dgCol>
   <t:dgCol title="微信open_id"  field="openId"  hidden="true"  queryMode="group"  width="120"></t:dgCol>
   <t:dgCol title="电话"  field="phone"  hidden="true"  queryMode="group"  width="120"></t:dgCol>
   <t:dgCol title="姓名"  field="name"  hidden="true"  queryMode="group"  width="120"></t:dgCol>
   <t:dgCol title="创建时间"  field="createTime" formatter="yyyy-MM-dd hh:mm:ss" hidden="true"  queryMode="group"  width="120"></t:dgCol>
   <t:dgCol title="上级分销open_id"  field="upperOpenId"  hidden="true"  queryMode="group"  width="120"></t:dgCol>
   <t:dgCol title="小区"  field="area"  hidden="true"  queryMode="group" dictionary="area" width="120"></t:dgCol>
   <t:dgCol title="操作" field="opt" width="100"></t:dgCol>
   <t:dgDelOpt title="删除" url="ftthCustomerInfoController.do?doDel&id={id}" />
   <t:dgToolBar title="录入" icon="icon-add" url="ftthCustomerInfoController.do?goAdd" funname="add"></t:dgToolBar>
   <t:dgToolBar title="编辑" icon="icon-edit" url="ftthCustomerInfoController.do?goUpdate" funname="update"></t:dgToolBar>
   <t:dgToolBar title="批量删除"  icon="icon-remove" url="ftthCustomerInfoController.do?doBatchDel" funname="deleteALLSelect"></t:dgToolBar>
   <t:dgToolBar title="查看" icon="icon-search" url="ftthCustomerInfoController.do?goUpdate" funname="detail"></t:dgToolBar>
   <t:dgToolBar title="导入" icon="icon-put" funname="ImportXls"></t:dgToolBar>
   <t:dgToolBar title="导出" icon="icon-putout" funname="ExportXls"></t:dgToolBar>
   <t:dgToolBar title="模板下载" icon="icon-putout" funname="ExportXlsByT"></t:dgToolBar>
  </t:datagrid>
  </div>
 </div>
 <script src = "webpage/com/buss/lan/ftthCustomerInfoList.js"></script>		
 <script type="text/javascript">
 $(document).ready(function(){
 		//给时间控件加上样式
 			$("#ftthCustomerInfoListtb").find("input[name='createTime_begin']").attr("class","Wdate").attr("style","height:20px;width:90px;").click(function(){WdatePicker({dateFmt:'yyyy-MM-dd'});});
 			$("#ftthCustomerInfoListtb").find("input[name='createTime_end']").attr("class","Wdate").attr("style","height:20px;width:90px;").click(function(){WdatePicker({dateFmt:'yyyy-MM-dd'});});
 });
 
//导入
function ImportXls() {
	openuploadwin('Excel导入', 'ftthCustomerInfoController.do?upload', "ftthCustomerInfoList");
}

//导出
function ExportXls() {
	JeecgExcelExport("ftthCustomerInfoController.do?exportXls","ftthCustomerInfoList");
}

//模板下载
function ExportXlsByT() {
	JeecgExcelExport("ftthCustomerInfoController.do?exportXlsByT","ftthCustomerInfoList");
}
 </script>