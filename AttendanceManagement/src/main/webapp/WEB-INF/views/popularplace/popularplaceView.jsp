<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>

<div id="three">
	<div class="contenttable">
		<h3>
			<spring:message code="popularplace_title" />
		</h3>
		<div class="contenttable1">
			<table class="content" style="width: 99%;" >
				 				<tr>
					<td class="biao_bt3"><spring:message
							code="popularplace_headName" /></td>
					<td>${ popularplace.headName }</td>
				</tr>
				  				<tr>
					<td class="biao_bt3"><spring:message
							code="popularplace_userName" /></td>
					<td>${ popularplace.userName }</td>
				</tr>
				  				<tr>
					<td class="biao_bt3"><spring:message
							code="popularplace_message" /></td>
					<td>${ popularplace.message }</td>
				</tr>
				  				<tr>
					<td class="biao_bt3"><spring:message
							code="popularplace_userImage" /></td>
					<td>${ popularplace.userImage }</td>
				</tr>
				  				<tr>
					<td class="biao_bt3"><spring:message
							code="popularplace_imagePath" /></td>
					<td>${ popularplace.imagePath }</td>
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



