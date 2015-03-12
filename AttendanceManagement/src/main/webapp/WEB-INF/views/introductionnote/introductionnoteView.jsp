<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>

<div id="three">
	<div class="contenttable">
		<h3>
			<spring:message code="introductionnote_title" />
		</h3>
		<div class="contenttable1">
			<table class="content" style="width: 99%;" >
				 				<tr>
					<td class="biao_bt3"><spring:message
							code="introductionnote_name" /></td>
					<td>${ introductionnote.name }</td>
				</tr>
				  				<tr>
					<td class="biao_bt3"><spring:message
							code="introductionnote_message" /></td>
					<td>${ introductionnote.message }</td>
				</tr>
				  				<tr>
					<td class="biao_bt3"><spring:message
							code="introductionnote_imagePath" /></td>
					<td>${ introductionnote.imagePath }</td>
				</tr>
				  				<tr>
					<td class="biao_bt3"><spring:message
							code="introductionnote_headName" /></td>
					<td>${ introductionnote.headName }</td>
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



