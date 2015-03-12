<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>
<script type="text/javascript">
var popularplace_form_inputform_id = 'popularplace_form_inputForm';

$ .parser.onComplete = function() {
		parent. $ .messager.progress('close');
		$('#'+popularplace_form_inputform_id).form(
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

<form:form id="popularplace_form_inputForm" name="popularplace_form_inputForm" action="${ctx}/popularplace/${action}"
		 modelAttribute="popularplace" method="post" class="form-horizontal">
	<input type="hidden" name="id" id="id" value="${ popularplace.id}" />
	<table class="content" style="width: 100%;">
	 		<tr>
			<td class="biao_bt3"><spring:message code="popularplace_headName" /></td>
			<td><input type="text" name="headName" id="headName" value="${ popularplace.headName }" class="easyui-validatebox" data-options="missingMessage:'<spring:message code="popularplace_headName" />不能为空.',required:true"   />	</td>
		</tr>
	  		<tr>
			<td class="biao_bt3"><spring:message code="popularplace_userName" /></td>
			<td><input type="text" name="userName" id="userName" value="${ popularplace.userName }" class="easyui-validatebox" data-options="missingMessage:'<spring:message code="popularplace_userName" />不能为空.',required:true"   />	</td>
		</tr>
	  		<tr>
			<td class="biao_bt3"><spring:message code="popularplace_message" /></td>
			<td><input type="text" name="message" id="message" value="${ popularplace.message }" class="easyui-validatebox" data-options="missingMessage:'<spring:message code="popularplace_message" />不能为空.',required:true"   />	</td>
		</tr>
	  		<tr>
			<td class="biao_bt3"><spring:message code="popularplace_userImage" /></td>
			<td><input type="text" name="userImage" id="userImage" value="${ popularplace.userImage }" class="easyui-validatebox" data-options="missingMessage:'<spring:message code="popularplace_userImage" />不能为空.',required:true"   />	</td>
		</tr>
	  		<tr>
			<td class="biao_bt3"><spring:message code="popularplace_imagePath" /></td>
			<td><input type="text" name="imagePath" id="imagePath" value="${ popularplace.imagePath }" class="easyui-validatebox" data-options="missingMessage:'<spring:message code="popularplace_imagePath" />不能为空.',required:true"   />	</td>
		</tr>
	   	</table>
</form:form>
	