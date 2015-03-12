<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>

<div id="three">
	<div class="contenttable">
		<h3>
			<spring:message code="device_title" />
		</h3>
		<div class="contenttable1">
			<table class="content" style="width: 99%;" >
				 				<%-- <tr>
					<td class="biao_bt3"><spring:message
							code="device_uuid" /></td>
					<td>${ device.uuid }</td>
				</tr> --%>
				  				<tr>
					<td class="biao_bt3"><spring:message
							code="device_deviceName" /></td>
					<td>${ device.deviceName }</td>
				</tr>
				  				<tr>
					<td class="biao_bt3"><spring:message
							code="device_moduleNumber" /></td>
					<td>${ device.moduleNumber }</td>
				</tr>
				  				<tr>
					<td class="biao_bt3"><spring:message
							code="device_beginDate" /></td>
					<td>${ device.beginDate }</td>
				</tr>
				  				<tr>
					<td class="biao_bt3"><spring:message
							code="device_userName" /></td>
					<td>${ device.userName }</td>
				</tr>
				  				<tr>
					<td class="biao_bt3"><spring:message
							code="device_userAddress" /></td>
					<td>${ device.userAddress }</td>
				</tr>
				  				<tr>
					<td class="biao_bt3"><spring:message
							code="device_userIphone" /></td>
					<td>${ device.userIphone }</td>
				</tr>
				  				<tr>
					<td class="biao_bt3"><spring:message
							code="device_userMail" /></td>
					<td>${ device.userMail }</td>
				</tr>
				  				<tr>
					<td class="biao_bt3"><spring:message
							code="device_remark" /></td>
					<td>${ device.remark }</td>
				</tr>
				  				<tr>
					<td class="biao_bt3"><spring:message
							code="device_dataSort" /></td>
					<td>${ device.dataSort }</td>
				</tr>
				  				<tr>
					<td class="biao_bt3"><spring:message
							code="device_dataState" /></td>
					<td>${ device.dataState }</td>
				</tr>
				  			<%-- 	<tr>
					<td class="biao_bt3"><spring:message
							code="device_createUser" /></td>
					<td>${ device.createUser }</td>
				</tr>
				  				<tr>
					<td class="biao_bt3"><spring:message
							code="device_updateUser" /></td>
					<td>${ device.updateUser }</td>
				</tr> --%>
				  				<tr>
					<td class="biao_bt3"><spring:message
							code="device_createIp" /></td>
					<td>${ device.createIp }</td>
				</tr>
				  				<tr>
					<td class="biao_bt3"><spring:message
							code="device_updateIp" /></td>
					<td>${ device.updateIp }</td>
				</tr>
				  		<%-- 		<tr>
					<td class="biao_bt3"><spring:message
							code="device_createDate" /></td>
					<td>${ device.createDate }</td>
				</tr>
				  				<tr>
					<td class="biao_bt3"><spring:message
							code="device_updateDate" /></td>
					<td>${ device.updateDate }</td>
				</tr> --%>
				   			</table>
		</div>
	</div>
</div>
<script type="text/javascript">
$ .parser.onComplete = function() {
	parent.$ .messager.progress('close');
};
</script>



