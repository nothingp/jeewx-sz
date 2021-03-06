<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/context/mytags.jsp"%>
<t:base type="jquery,easyui,tools,DatePicker"></t:base>
<div class="easyui-layout" fit="true">
  <div region="center" style="padding:1px;">
  <t:datagrid name="ftthCommissionInfoList" checkbox="true" fitColumns="false" title="宽带佣金列表" actionUrl="ftthCommissionInfoController.do?datagrid" idField="id" fit="true" queryMode="group">
   <t:dgCol title="主键"  field="id"  hidden="false"  queryMode="group"  width="120"></t:dgCol>
   <t:dgCol title="客户open_id"  field="openId"  hidden="true"  queryMode="group"  width="120"></t:dgCol>
   <t:dgCol title="佣金总额"  field="amount"  hidden="true"  queryMode="group"  width="120"></t:dgCol>
   <t:dgCol title="提现金额"  field="dealAmount"  hidden="true"  queryMode="group"  width="120"></t:dgCol>
   <t:dgCol title="创建时间"  field="createTime" formatter="yyyy-MM-dd" hidden="true"  queryMode="group"  width="120"></t:dgCol>
   <t:dgCol title="操作" field="opt" width="100"></t:dgCol>
   <t:dgDelOpt title="删除" url="ftthCommissionInfoController.do?doDel&id={id}" />
   <t:dgToolBar title="录入" icon="icon-add" url="ftthCommissionInfoController.do?goAdd" funname="add"></t:dgToolBar>
   <t:dgToolBar title="编辑" icon="icon-edit" url="ftthCommissionInfoController.do?goUpdate" funname="update"></t:dgToolBar>
   <t:dgToolBar title="批量删除"  icon="icon-remove" url="ftthCommissionInfoController.do?doBatchDel" funname="deleteALLSelect"></t:dgToolBar>
   <%-- <t:dgToolBar title="查看" icon="icon-search" url="ftthCommissionInfoController.do?goUpdate" funname="detail"></t:dgToolBar> --%>
   <t:dgToolBar title="导入佣金" icon="icon-put" funname="ImportCommission"></t:dgToolBar>
   <%-- <t:dgToolBar title="导出" icon="icon-putout" funname="ExportXls"></t:dgToolBar>
   <t:dgToolBar title="模板下载" icon="icon-putout" funname="ExportXlsByT"></t:dgToolBar> --%>
  </t:datagrid>
  </div>
 </div>
 <script src = "webpage/com/buss/lan/ftthCommissionInfoList.js"></script>		
 <script type="text/javascript">
 $(document).ready(function(){
 		//给时间控件加上样式
 			$("#ftthCommissionInfoListtb").find("input[name='createTime_begin']").attr("class","Wdate").attr("style","height:20px;width:90px;").click(function(){WdatePicker({dateFmt:'yyyy-MM-dd'});});
 			$("#ftthCommissionInfoListtb").find("input[name='createTime_end']").attr("class","Wdate").attr("style","height:20px;width:90px;").click(function(){WdatePicker({dateFmt:'yyyy-MM-dd'});});
 });
 
//导入
function ImportXls() {
	openuploadwin('Excel导入', 'ftthCommissionInfoController.do?upload', "ftthCommissionInfoList");
}

//导出
function ExportXls() {
	JeecgExcelExport("ftthCommissionInfoController.do?exportXls","ftthCommissionInfoList");
}

//模板下载
function ExportXlsByT() {
	JeecgExcelExport("ftthCommissionInfoController.do?exportXlsByT","ftthCommissionInfoList");
}

function ImportCommission(){
	var formData = new Object();
 	/* var data=$(":input").each(function() {
		 formData[this.name] =$("#"+this.name ).val();
	}); */
 	$.ajax({
		async : false,
		cache : false,
		type : 'POST',
		url : "ftthCommissionInfoController.do?doCommissionImport",// 请求的action路径
		data : formData,
		error : function() {// 请求失败处理函数
 			doError();
		},
		success : function(data) {
			//var d = $.parseJSON(data);
			var d = $.parseJSON(data);
			if (d.success) {
				var msg = d.msg;
				tip(msg);
				$('#ftthCommissionInfoList').datagrid('reload');
			}		
		}
	});
	
}
 </script>