<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>
<script type="text/javascript">
var mall_form_inputform_id = 'mall_form_inputForm';

$ .parser.onComplete = function() {
		parent. $ .messager.progress('close');
		$('#'+mall_form_inputform_id).form(
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

<form:form id="mall_form_inputForm" name="mall_form_inputForm" action="${ctx}/mall/${action}"
		 modelAttribute="mall" method="post" class="form-horizontal">
	<input type="hidden" name="id" id="id" value="${ mall.id}" />
	<table class="content" style="width: 100%;">
	 		<tr>
			<td class="biao_bt3"><spring:message code="mall_headName" /></td>
			<td><input type="text" name="headName" id="headName" value="${ mall.headName }" class="easyui-validatebox" data-options="missingMessage:'<spring:message code="mall_headName" />不能为空.',required:true"   />	</td>
		</tr>
	  		<tr>
			<td class="biao_bt3"><spring:message code="mall_imagePath" /></td>
			<td><input type="text" name="imagePath" id="imagePath" value="${ mall.imagePath }" class="easyui-validatebox" data-options="missingMessage:'<spring:message code="mall_imagePath" />不能为空.',required:true"   />	</td>
		</tr>
	  		<tr>
			<td class="biao_bt3"><spring:message code="mall_message" /></td>
			<td><input type="text" name="message" id="message" value="${ mall.message }" class="easyui-validatebox" data-options="missingMessage:'<spring:message code="mall_message" />不能为空.',required:true"   />	</td>
		</tr>
	   	</table>
</form:form>
	