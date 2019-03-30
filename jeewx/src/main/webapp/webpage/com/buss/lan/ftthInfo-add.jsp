<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/context/mytags.jsp"%>
<!DOCTYPE html>
<html>
 <head>
  <title>ftth_info</title>
  <t:base type="jquery,easyui,tools,DatePicker"></t:base>
  <script type="text/javascript" src="plug-in/ckeditor_new/ckeditor.js"></script>
  <script type="text/javascript" src="plug-in/ckfinder/ckfinder.js"></script>
  <script type="text/javascript">
  //编写自定义JS代码
  </script>
 </head>
 <body>
  <t:formvalid formid="formobj" dialog="true" usePlugin="password" layout="table" action="ftthInfoController.do?doAdd" tiptype="1">
					<input id="id" name="id" type="hidden" value="${ftthInfoPage.id }">
		<table style="width: 600px;" cellpadding="0" cellspacing="1" class="formtable">
				<tr>
					<td align="right">
						<label class="Validform_label">
							报装人open_id:
						</label>
					</td>
					<td class="value">
					     	 <input id="openId" name="openId" type="text" style="width: 150px" class="inputxt"  
								               
								               >
							<span class="Validform_checktip"></span>
							<label class="Validform_label" style="display: none;">报装人open_id</label>
						</td>
				</tr>
				<tr>
					<td align="right">
						<label class="Validform_label">
							报装人电话:
						</label>
					</td>
					<td class="value">
					     	 <input id="phone" name="phone" type="text" style="width: 150px" class="inputxt"  
								               
								               >
							<span class="Validform_checktip"></span>
							<label class="Validform_label" style="display: none;">报装人电话</label>
						</td>
				</tr>
				<tr>
					<td align="right">
						<label class="Validform_label">
							宽带地址:
						</label>
					</td>
					<td class="value">
					     	 <input id="address" name="address" type="text" style="width: 150px" class="inputxt"  
								               
								               >
							<span class="Validform_checktip"></span>
							<label class="Validform_label" style="display: none;">宽带地址</label>
						</td>
				</tr>
				<tr>
					<td align="right">
						<label class="Validform_label">
							状态:
						</label>
					</td>
					<td class="value">
							  <t:dictSelect field="state" type="list"
									typeGroupCode="ftth_state" defaultVal="${ftthInfoPage.state}" hasLabel="false"  title="状态"></t:dictSelect>     
							<span class="Validform_checktip"></span>
							<label class="Validform_label" style="display: none;">状态</label>
						</td>
				</tr>
				<tr>
					<td align="right">
						<label class="Validform_label">
							创建时间:
						</label>
					</td>
					<td class="value">
							   <input id="createTime" name="createTime" type="text" style="width: 150px" 
					      						class="Wdate" onClick="WdatePicker({ dateFmt: 'yyyy-MM-dd HH:mm:ss' })"
								                
								               >    
							<span class="Validform_checktip"></span>
							<label class="Validform_label" style="display: none;">创建时间</label>
						</td>
				</tr>
				<tr>
					<td align="right">
						<label class="Validform_label">
							分销者open_id:
						</label>
					</td>
					<td class="value">
					     	 <input id="sellerOpenId" name="sellerOpenId" type="text" style="width: 150px" class="inputxt"  
								               
								               >
							<span class="Validform_checktip"></span>
							<label class="Validform_label" style="display: none;">分销者open_id</label>
						</td>
				</tr>
				<tr>
					<td align="right">
						<label class="Validform_label">
							是否分佣:
						</label>
					</td>
					<td class="value">
							  <t:dictSelect field="isDeal" type="list"
									typeGroupCode="yesorno" defaultVal="${ftthInfoPage.isDeal}" hasLabel="false"  title="是否分佣"></t:dictSelect>     
							<span class="Validform_checktip"></span>
							<label class="Validform_label" style="display: none;">是否分佣</label>
						</td>
				</tr>
			</table>
		</t:formvalid>
 </body>
  <script src = "webpage/com/buss/lan/ftthInfo.js"></script>		