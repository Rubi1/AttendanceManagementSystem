<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>
<script type="text/javascript">
var travelnote_form_inputform_id = 'travelnote_form_inputForm';

$ .parser.onComplete = function() {
		parent. $ .messager.progress('close');
		$('#'+travelnote_form_inputform_id).form(
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

<form:form id="travelnote_form_inputForm" name="travelnote_form_inputForm" action="${ctx}/travelnote/${action}"
		 modelAttribute="travelnote" method="post" class="form-horizontal">
	<input type="hidden" name="id" id="id" value="${ travelnote.id}" />
	<table class="content" style="width: 100%;">
	 		<tr>
			<td class="biao_bt3"><spring:message code="travelnote_name" /></td>
			<td><input type="text" name="name" id="name" value="${ travelnote.name }" class="easyui-validatebox" data-options="missingMessage:'<spring:message code="travelnote_name" />不能为空.',required:true"   />	</td>
		</tr>
	  		<tr>
			<td class="biao_bt3"><spring:message code="travelnote_message" /></td>
			<td><input type="text" name="message" id="message" value="${ travelnote.message }" class="easyui-validatebox" data-options="missingMessage:'<spring:message code="travelnote_message" />不能为空.',required:true"   />	</td>
		</tr>
	  		<tr>
			<td class="biao_bt3"><spring:message code="travelnote_imagePath" /></td>
			<td><input type="text" name="imagePath" id="imagePath" value="${ travelnote.imagePath }" class="easyui-validatebox" data-options="missingMessage:'<spring:message code="travelnote_imagePath" />不能为空.',required:true"   />	</td>
		</tr>
	  		<tr>
			<td class="biao_bt3"><spring:message code="travelnote_headName" /></td>
			<td><input type="text" name="headName" id="headName" value="${ travelnote.headName }" class="easyui-validatebox" data-options="missingMessage:'<spring:message code="travelnote_headName" />不能为空.',required:true"   />	</td>
		</tr>
	  		<tr>
			<td class="biao_bt3"><spring:message code="travelnote_userImage" /></td>
			<td><input type="text" name="userImage" id="userImage" value="${ travelnote.userImage }" class="easyui-validatebox" data-options="missingMessage:'<spring:message code="travelnote_userImage" />不能为空.',required:true"   />	</td>
		</tr>
	  		<tr>
			<td class="biao_bt3"><spring:message code="travelnote_createTime" /></td>
			<td><input type="text" name="createTime" id="createTime" value="${ travelnote.createTime }" class="easyui-validatebox" data-options="missingMessage:'<spring:message code="travelnote_createTime" />不能为空.',required:true"   />	</td>
		</tr>
	  		<tr>
			<td class="biao_bt3"><spring:message code="travelnote_time" /></td>
			<td><input type="text" name="time" id="time" value="${ travelnote.time }" class="easyui-validatebox" data-options="missingMessage:'<spring:message code="travelnote_time" />不能为空.',required:true"   />	</td>
		</tr>
	   	</table>
</form:form>
	