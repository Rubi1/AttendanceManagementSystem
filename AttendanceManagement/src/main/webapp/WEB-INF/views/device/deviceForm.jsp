<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>
<script type="text/javascript">
var device_form_inputform_id = 'device_form_inputForm';

$ .parser.onComplete = function() {
		parent. $ .messager.progress('close');
		$('#'+device_form_inputform_id).form(
				{
					onSubmit : function() {
						parent. $ .messager.progress({
							title : '提示',
							text : '数据处理中，请稍后....'
						});
						var isValid = $(this).form('validate');
						if (!isValid) {
							parent. $ .messager.progress('close');
						}
						return isValid;
					},
					success : function(result) {
						parent. $ .messager.progress('close');
						result = $ .parseJSON(result);
						if (result.success) {
							parent. $ .modalDialog.openner_dataGrid
									.datagrid('reload');
							parent. $ .modalDialog.openner_dataGrid.datagrid(
									'uncheckAll').datagrid('unselectAll')
									.datagrid('clearSelections');
							parent. $ .modalDialog.handler.dialog('close');
							$ .messager.show({ // show error message
								title : '提示',
								msg : result.message
							});
						} else {
							$ .messager.alert('错误', result.message, 'error');
						}
					}
				});

	} ;
</script>

<form:form id="device_form_inputForm" name="device_form_inputForm" action="${ctx}/device/${action}"
		 modelAttribute="device" method="post" class="form-horizontal">
	<input type="hidden" name="id" id="id" value="${ device.id}" />
	<table class="content" style="width: 100%;">
	 		<%-- <tr>
			<td class="biao_bt3"><spring:message code="device_uuid" /></td>
			<td><input type="text" name="uuid" id="uuid" value="${ device.uuid }" class="easyui-validatebox" data-options="missingMessage:'<spring:message code="device_uuid" />不能为空.',required:true"   />	</td>
		</tr> --%>
	  		<tr>
			<td class="biao_bt3"><spring:message code="device_deviceName" /></td>
			<td><input type="text" name="deviceName" id="deviceName" value="${ device.deviceName }" class="easyui-validatebox" data-options="missingMessage:'<spring:message code="device_deviceName" />不能为空.',required:true"   />	</td>
		</tr>
	  		<tr>
			<td class="biao_bt3"><spring:message code="device_moduleNumber" /></td>
			<td><input type="text" name="moduleNumber" id="moduleNumber" value="${ device.moduleNumber }" class="easyui-validatebox" data-options="missingMessage:'<spring:message code="device_moduleNumber" />不能为空.',required:true"   />	</td>
		</tr>
	  		<tr>
			<td class="biao_bt3"><spring:message code="device_beginDate" /></td>
			<td><input type="text" name="beginDate" id="beginDate" value="${ device.beginDate }" class="easyui-validatebox" data-options="missingMessage:'<spring:message code="device_beginDate" />不能为空.',required:true"   />	</td>
		</tr>
	  		<tr>
			<td class="biao_bt3"><spring:message code="device_userName" /></td>
			<td><input type="text" name="userName" id="userName" value="${ device.userName }" class="easyui-validatebox" data-options="missingMessage:'<spring:message code="device_userName" />不能为空.',required:true"   />	</td>
		</tr>
	  		<tr>
			<td class="biao_bt3"><spring:message code="device_userAddress" /></td>
			<td><input type="text" name="userAddress" id="userAddress" value="${ device.userAddress }" class="easyui-validatebox" data-options="missingMessage:'<spring:message code="device_userAddress" />不能为空.',required:true"   />	</td>
		</tr>
	  		<tr>
			<td class="biao_bt3"><spring:message code="device_userIphone" /></td>
			<td><input type="text" name="userIphone" id="userIphone" value="${ device.userIphone }" class="easyui-validatebox" data-options="missingMessage:'<spring:message code="device_userIphone" />不能为空.',required:false"   />	</td>
		</tr>
	  		<tr>
			<td class="biao_bt3"><spring:message code="device_userMail" /></td>
			<td><input type="text" name="userMail" id="userMail" value="${ device.userMail }" class="easyui-validatebox" data-options="missingMessage:'<spring:message code="device_userMail" />不能为空.',required:false"   />	</td>
		</tr>
	  		<tr>
			<td class="biao_bt3"><spring:message code="device_remark" /></td>
			<td><input type="text" name="remark" id="remark" value="${ device.remark }" class="easyui-validatebox" data-options="missingMessage:'<spring:message code="device_remark" />不能为空.',required:false"   />	</td>
		</tr>
	  		<tr>
			<td class="biao_bt3"><spring:message code="device_dataSort" /></td>
			<td><input type="text" name="dataSort" id="dataSort" value="${ device.dataSort }" class="easyui-validatebox" data-options="missingMessage:'<spring:message code="device_dataSort" />不能为空.',required:true"   />	</td>
		</tr>
	  		<tr>
			<td class="biao_bt3"><spring:message code="device_dataState" /></td>
			<td><input type="text" name="dataState" id="dataState" value="${ device.dataState }" class="easyui-validatebox" data-options="missingMessage:'<spring:message code="device_dataState" />不能为空.',required:false"   />	</td>
		</tr>
	  	<%-- 	<tr>
			<td class="biao_bt3"><spring:message code="device_createUser" /></td>
			<td><input type="text" name="createUser" id="createUser" value="${ device.createUser }" class="easyui-validatebox" data-options="missingMessage:'<spring:message code="device_createUser" />不能为空.',required:true"   />	</td>
		</tr>
	  		<tr>
			<td class="biao_bt3"><spring:message code="device_updateUser" /></td>
			<td><input type="text" name="updateUser" id="updateUser" value="${ device.updateUser }" class="easyui-validatebox" data-options="missingMessage:'<spring:message code="device_updateUser" />不能为空.',required:true"   />	</td>
		</tr> --%>
	  		<tr>
			<td class="biao_bt3"><spring:message code="device_createIp" /></td>
			<td><input type="text" name="createIp" id="createIp" value="${ device.createIp }" class="easyui-validatebox" data-options="missingMessage:'<spring:message code="device_createIp" />不能为空.',required:false"   />	</td>
		</tr>
	  		<tr>
			<td class="biao_bt3"><spring:message code="device_updateIp" /></td>
			<td><input type="text" name="updateIp" id="updateIp" value="${ device.updateIp }" class="easyui-validatebox" data-options="missingMessage:'<spring:message code="device_updateIp" />不能为空.',required:false"   />	</td>
		</tr>
	  		<%-- <tr>
			<td class="biao_bt3"><spring:message code="device_createDate" /></td>
			<td><input type="text" name="createDate" id="createDate" value="${ device.createDate }" class="easyui-validatebox" data-options="missingMessage:'<spring:message code="device_createDate" />不能为空.',required:true"   />	</td>
		</tr>
	  		<tr>
			<td class="biao_bt3"><spring:message code="device_updateDate" /></td>
			<td><input type="text" name="updateDate" id="updateDate" value="${ device.updateDate }" class="easyui-validatebox" data-options="missingMessage:'<spring:message code="device_updateDate" />不能为空.',required:true"   />	</td>
		</tr> --%>
	   	</table>
</form:form>
	