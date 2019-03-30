<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/context/mytags.jsp"%>
<t:base type="jquery,easyui,tools,DatePicker"></t:base>
<div class="easyui-layout" fit="true">
  <div region="center" style="padding:1px;">
  <t:datagrid name="ftthInfoList" checkbox="true" fitColumns="false" title="宽带订单管理" actionUrl="ftthInfoController.do?datagrid" idField="id" fit="true" queryMode="group">
   <t:dgCol title="主键"  field="id"  hidden="false"  queryMode="group"  width="120"></t:dgCol>
   <t:dgCol title="报装人open_id"  field="openId"  hidden="true"  queryMode="group"  width="120"></t:dgCol>
   <t:dgCol title="报装人电话"  field="phone"  hidden="true"  queryMode="group"  width="120"></t:dgCol>
   <t:dgCol title="宽带地址"  field="address"  hidden="true"  queryMode="group"  width="120"></t:dgCol>
   <t:dgCol title="状态"  field="state"  hidden="true"  queryMode="group" dictionary="ftth_state" width="120"></t:dgCol>
   <t:dgCol title="创建时间"  field="createTime" formatter="yyyy-MM-dd hh:mm:ss" hidden="true"  queryMode="group"  width="120"></t:dgCol>
   <t:dgCol title="分销者open_id"  field="sellerOpenId"  hidden="true"  queryMode="group"  width="120"></t:dgCol>
   <t:dgCol title="是否分佣"  field="isDeal"  hidden="true"  queryMode="group" dictionary="yesorno" width="120"></t:dgCol>
   <t:dgCol title="操作" field="opt" width="100"></t:dgCol>
   <t:dgDelOpt title="删除" url="ftthInfoController.do?doDel&id={id}" />
   <t:dgToolBar title="录入" icon="icon-add" url="ftthInfoController.do?goAdd" funname="add"></t:dgToolBar>
   <t:dgToolBar title="编辑" icon="icon-edit" url="ftthInfoController.do?goUpdate" funname="update"></t:dgToolBar>
   <t:dgToolBar title="批量删除"  icon="icon-remove" url="ftthInfoController.do?doBatchDel" funname="deleteALLSelect"></t:dgToolBar>
   <t:dgToolBar title="查看" icon="icon-search" url="ftthInfoController.do?goUpdate" funname="detail"></t:dgToolBar>
   <%-- <t:dgToolBar title="导入" icon="icon-put" funname="ImportXls"></t:dgToolBar>
   <t:dgToolBar title="导出" icon="icon-putout" funname="ExportXls"></t:dgToolBar>
   <t:dgToolBar title="模板下载" icon="icon-putout" funname="ExportXlsByT"></t:dgToolBar> --%>
  </t:datagrid>
  </div>
 </div>
 <script src = "webpage/com/buss/lan/ftthInfoList.js"></script>		
 <script type="text/javascript">
 $(document).ready(function(){
 		//给时间控件加上样式
 			$("#ftthInfoListtb").find("input[name='createTime_begin']").attr("class","Wdate").attr("style","height:20px;width:90px;").click(function(){WdatePicker({dateFmt:'yyyy-MM-dd'});});
 			$("#ftthInfoListtb").find("input[name='createTime_end']").attr("class","Wdate").attr("style","height:20px;width:90px;").click(function(){WdatePicker({dateFmt:'yyyy-MM-dd'});});
 });
 
//导入
function ImportXls() {
	openuploadwin('Excel导入', 'ftthInfoController.do?upload', "ftthInfoList");
}

//导出
function ExportXls() {
	JeecgExcelExport("ftthInfoController.do?exportXls","ftthInfoList");
}

//模板下载
function ExportXlsByT() {
	JeecgExcelExport("ftthInfoController.do?exportXlsByT","ftthInfoList");
}
 </script>