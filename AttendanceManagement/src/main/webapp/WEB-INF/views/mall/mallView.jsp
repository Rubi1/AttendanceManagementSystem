<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>

<div id="three">
	<div class="contenttable">
		<h3>
			<spring:message code="mall_title" />
		</h3>
		<div class="contenttable1">
			<table class="content" style="width: 99%;" >
				 				<tr>
					<td class="biao_bt3"><spring:message
							code="mall_headName" /></td>
					<td>${ mall.headName }</td>
				</tr>
				  				<tr>
					<td class="biao_bt3"><spring:message
							code="mall_imagePath" /></td>
					<td>${ mall.imagePath }</td>
				</tr>
				  				<tr>
					<td class="biao_bt3"><spring:message
							code="mall_message" /></td>
					<td>${ mall.message }</td>
				</tr>
				   			</table>
		</div>
	</div>
</div>
<script type="text/javascript">
$ .parser.onComplete = function() {
	parent.$ .messager.progress('close');
};
</script>



