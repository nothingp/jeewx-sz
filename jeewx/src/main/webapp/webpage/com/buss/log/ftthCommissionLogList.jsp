<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/context/mytags.jsp"%>
<script type="text/javascript">
	$('#addFtthCommissionLogBtn').linkbutton({   
	    iconCls: 'icon-add'  
	});  
	$('#delFtthCommissionLogBtn').linkbutton({   
	    iconCls: 'icon-remove'  
	}); 
	$('#addFtthCommissionLogBtn').bind('click', function(){   
 		 var tr =  $("#add_ftthCommissionLog_table_template tr").clone();
	 	 $("#add_ftthCommissionLog_table").append(tr);
	 	 resetTrNum('add_ftthCommissionLog_table');
	 	 return false;
    });  
	$('#delFtthCommissionLogBtn').bind('click', function(){   
      	$("#add_ftthCommissionLog_table").find("input:checked").parent().parent().remove();   
        resetTrNum('add_ftthCommissionLog_table'); 
        return false;
    }); 
    $(document).ready(function(){
    	$(".datagrid-toolbar").parent().css("width","auto");
    	if(location.href.indexOf("load=detail")!=-1){
			$(":input").attr("disabled","true");
			$(".datagrid-toolbar").hide();
		}
		//将表格的表头固定
	    $("#ftthCommissionLog_table").createhftable({
	    	height:'300px',
			width:'auto',
			fixFooter:false
			});
    });
</script>
<div style="padding: 3px; height: 25px;width:auto;" class="datagrid-toolbar">
	<a id="addFtthCommissionLogBtn" href="#">添加</a> <a id="delFtthCommissionLogBtn" href="#">删除</a> 
</div>
<table border="0" cellpadding="2" cellspacing="0" id="ftthCommissionLog_table">
	<tr bgcolor="#E6E6E6">
		<td align="center" bgcolor="#EEEEEE">序号</td>
		<td align="center" bgcolor="#EEEEEE">操作</td>
				  <td align="left" bgcolor="#EEEEEE">
						客户分佣信息ID
				  </td>
				  <td align="left" bgcolor="#EEEEEE">
						提现金额
				  </td>
				  <td align="left" bgcolor="#EEEEEE">
						创建时间
				  </td>
	</tr>
	<tbody id="add_ftthCommissionLog_table">	
	<c:if test="${fn:length(ftthCommissionLogList)  <= 0 }">
			<tr>
				<td align="center"><div style="width: 25px;" name="xh">1</div></td>
				<td align="center"><input style="width:20px;"  type="checkbox" name="ck"/></td>
					<input name="ftthCommissionLogList[0].id" type="hidden"/>
				  <td align="left">
					  	<input name="ftthCommissionLogList[0].ftthCommissionId" maxlength="200" 
					  		type="text" class="inputxt"  style="width:120px;"
					               
					               >
					  <label class="Validform_label" style="display: none;">客户分佣信息ID</label>
					</td>
				  <td align="left">
					  	<input name="ftthCommissionLogList[0].dealAmount" maxlength="22" 
					  		type="text" class="inputxt"  style="width:120px;"
					               
					               >
					  <label class="Validform_label" style="display: none;">提现金额</label>
					</td>
				  <td align="left">
							<input name="ftthCommissionLogList[0].createTime" maxlength="0" 
					  		type="text" class="Wdate" onClick="WdatePicker()"  style="width:120px;"
					                
					               >  
					  <label class="Validform_label" style="display: none;">创建时间</label>
					</td>
   			</tr>
	</c:if>
	<c:if test="${fn:length(ftthCommissionLogList)  > 0 }">
		<c:forEach items="${ftthCommissionLogList}" var="poVal" varStatus="stuts">
			<tr>
				<td align="center"><div style="width: 25px;" name="xh">${stuts.index+1 }</div></td>
				<td align="center"><input style="width:20px;"  type="checkbox" name="ck" /></td>
					<input name="ftthCommissionLogList[${stuts.index }].id" type="hidden" value="${poVal.id }"/>
				   <td align="left">
					  	<input name="ftthCommissionLogList[${stuts.index }].ftthCommissionId" maxlength="200" 
					  		type="text" class="inputxt"  style="width:120px;"
					               
					                value="${poVal.ftthCommissionId }">
					  <label class="Validform_label" style="display: none;">客户分佣信息ID</label>
				   </td>
				   <td align="left">
					  	<input name="ftthCommissionLogList[${stuts.index }].dealAmount" maxlength="22" 
					  		type="text" class="inputxt"  style="width:120px;"
					               
					                value="${poVal.dealAmount }">
					  <label class="Validform_label" style="display: none;">提现金额</label>
				   </td>
				   <td align="left">
							<input name="ftthCommissionLogList[${stuts.index }].createTime" maxlength="0" 
					  		type="text" class="Wdate" onClick="WdatePicker()"  style="width:120px;"
					                
					                value="<fmt:formatDate value='${poVal.createTime}' type="date" pattern="yyyy-MM-dd"/>">  
					  <label class="Validform_label" style="display: none;">创建时间</label>
				   </td>
   			</tr>
		</c:forEach>
	</c:if>	
	</tbody>
</table>
