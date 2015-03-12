<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>

<div id="three">
	<div class="contenttable">
		<h3>
			<spring:message code="travelnote_title" />
		</h3>
		<div class="contenttable1">
			<table class="content" style="width: 99%;" >
				 				<tr>
					<td class="biao_bt3"><spring:message
							code="travelnote_name" /></td>
					<td>${ travelnote.name }</td>
				</tr>
				  				<tr>
					<td class="biao_bt3"><spring:message
							code="travelnote_message" /></td>
					<td>${ travelnote.message }</td>
				</tr>
				  				<tr>
					<td class="biao_bt3"><spring:message
							code="travelnote_imagePath" /></td>
					<td>${ travelnote.imagePath }</td>
				</tr>
				  				<tr>
					<td class="biao_bt3"><spring:message
							code="travelnote_headName" /></td>
					<td>${ travelnote.headName }</td>
				</tr>
				  				<tr>
					<td class="biao_bt3"><spring:message
							code="travelnote_userImage" /></td>
					<td>${ travelnote.userImage }</td>
				</tr>
				  				<tr>
					<td class="biao_bt3"><spring:message
							code="travelnote_createTime" /></td>
					<td>${ travelnote.createTime }</td>
				</tr>
				  				<tr>
					<td class="biao_bt3"><spring:message
							code="travelnote_time" /></td>
					<td>${ travelnote.time }</td>
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



