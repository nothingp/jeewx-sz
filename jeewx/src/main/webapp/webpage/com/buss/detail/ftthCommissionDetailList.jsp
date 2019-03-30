<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/context/mytags.jsp"%>
<script type="text/javascript">
	$('#addFtthCommissionDetailBtn').linkbutton({   
	    iconCls: 'icon-add'  
	});  
	$('#delFtthCommissionDetailBtn').linkbutton({   
	    iconCls: 'icon-remove'  
	}); 
	$('#addFtthCommissionDetailBtn').bind('click', function(){   
 		 var tr =  $("#add_ftthCommissionDetail_table_template tr").clone();
	 	 $("#add_ftthCommissionDetail_table").append(tr);
	 	 resetTrNum('add_ftthCommissionDetail_table');
	 	 return false;
    });  
	$('#delFtthCommissionDetailBtn').bind('click', function(){   
      	$("#add_ftthCommissionDetail_table").find("input:checked").parent().parent().remove();   
        resetTrNum('add_ftthCommissionDetail_table'); 
        return false;
    }); 
    $(document).ready(function(){
    	$(".datagrid-toolbar").parent().css("width","auto");
    	if(location.href.indexOf("load=detail")!=-1){
			$(":input").attr("disabled","true");
			$(".datagrid-toolbar").hide();
		}
		//将表格的表头固定
	    $("#ftthCommissionDetail_table").createhftable({
	    	height:'300px',
			width:'auto',
			fixFooter:false
			});
    });
</script>
<div style="padding: 3px; height: 25px;width:auto;" class="datagrid-toolbar">
	<a id="addFtthCommissionDetailBtn" href="#">添加</a> <a id="delFtthCommissionDetailBtn" href="#">删除</a> 
</div>
<table border="0" cellpadding="2" cellspacing="0" id="ftthCommissionDetail_table">
	<tr bgcolor="#E6E6E6">
		<td align="center" bgcolor="#EEEEEE">序号</td>
		<td align="center" bgcolor="#EEEEEE">操作</td>
				  <td align="left" bgcolor="#EEEEEE">
						客户分佣信息ID
				  </td>
				  <td align="left" bgcolor="#EEEEEE">
						报装订单Id
				  </td>
				  <td align="left" bgcolor="#EEEEEE">
						分销级次
				  </td>
				  <td align="left" bgcolor="#EEEEEE">
						金额
				  </td>
				  <td align="left" bgcolor="#EEEEEE">
						创建时间
				  </td>
	</tr>
	<tbody id="add_ftthCommissionDetail_table">	
	<c:if test="${fn:length(ftthCommissionDetailList)  <= 0 }">
			<tr>
				<td align="center"><div style="width: 25px;" name="xh">1</div></td>
				<td align="center"><input style="width:20px;"  type="checkbox" name="ck"/></td>
					<input name="ftthCommissionDetailList[0].id" type="hidden"/>
				  <td align="left">
					  	<input name="ftthCommissionDetailList[0].ftthCommissionId" maxlength="36" 
					  		type="text" class="inputxt"  style="width:120px;"
					               
					               >
					  <label class="Validform_label" style="display: none;">客户分佣信息ID</label>
					</td>
				  <td align="left">
					  	<input name="ftthCommissionDetailList[0].ftthInfoId" maxlength="36" 
					  		type="text" class="inputxt"  style="width:120px;"
					               
					               >
					  <label class="Validform_label" style="display: none;">报装订单Id</label>
					</td>
				  <td align="left">
					  	<input name="ftthCommissionDetailList[0].level" maxlength="10" 
					  		type="text" class="inputxt"  style="width:120px;"
					               
					               >
					  <label class="Validform_label" style="display: none;">分销级次</label>
					</td>
				  <td align="left">
					  	<input name="ftthCommissionDetailList[0].amount" maxlength="22" 
					  		type="text" class="inputxt"  style="width:120px;"
					               
					               >
					  <label class="Validform_label" style="display: none;">金额</label>
					</td>
				  <td align="left">
							<input name="ftthCommissionDetailList[0].createTime" maxlength="0" 
					  		type="text" class="Wdate" onClick="WdatePicker()"  style="width:120px;"
					                
					               >  
					  <label class="Validform_label" style="display: none;">创建时间</label>
					</td>
   			</tr>
	</c:if>
	<c:if test="${fn:length(ftthCommissionDetailList)  > 0 }">
		<c:forEach items="${ftthCommissionDetailList}" var="poVal" varStatus="stuts">
			<tr>
				<td align="center"><div style="width: 25px;" name="xh">${stuts.index+1 }</div></td>
				<td align="center"><input style="width:20px;"  type="checkbox" name="ck" /></td>
					<input name="ftthCommissionDetailList[${stuts.index }].id" type="hidden" value="${poVal.id }"/>
				   <td align="left">
					  	<input name="ftthCommissionDetailList[${stuts.index }].ftthCommissionId" maxlength="36" 
					  		type="text" class="inputxt"  style="width:120px;"
					               
					                value="${poVal.ftthCommissionId }">
					  <label class="Validform_label" style="display: none;">客户分佣信息ID</label>
				   </td>
				   <td align="left">
					  	<input name="ftthCommissionDetailList[${stuts.index }].ftthInfoId" maxlength="36" 
					  		type="text" class="inputxt"  style="width:120px;"
					               
					                value="${poVal.ftthInfoId }">
					  <label class="Validform_label" style="display: none;">报装订单Id</label>
				   </td>
				   <td align="left">
					  	<input name="ftthCommissionDetailList[${stuts.index }].level" maxlength="10" 
					  		type="text" class="inputxt"  style="width:120px;"
					               
					                value="${poVal.level }">
					  <label class="Validform_label" style="display: none;">分销级次</label>
				   </td>
				   <td align="left">
					  	<input name="ftthCommissionDetailList[${stuts.index }].amount" maxlength="22" 
					  		type="text" class="inputxt"  style="width:120px;"
					               
					                value="${poVal.amount }">
					  <label class="Validform_label" style="display: none;">金额</label>
				   </td>
				   <td align="left">
							<input name="ftthCommissionDetailList[${stuts.index }].createTime" maxlength="0" 
					  		type="text" class="Wdate" onClick="WdatePicker()"  style="width:120px;"
					                
					                value="<fmt:formatDate value='${poVal.createTime}' type="date" pattern="yyyy-MM-dd"/>">  
					  <label class="Validform_label" style="display: none;">创建时间</label>
				   </td>
   			</tr>
		</c:forEach>
	</c:if>	
	</tbody>
</table>
