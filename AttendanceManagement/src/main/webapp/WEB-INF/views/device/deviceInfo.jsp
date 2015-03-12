<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>

<div id="three">
	<div class="contenttable">
		<h3>
			<spring:message code="device_title" />
		</h3>
		<div class="contenttable1">
			<table class="content" style="width: 99%;">
				<tr>
					<td class="biao_bt3"><spring:message code="device_deviceName" /></td>
					<td>${deviceInfo.deviceName }</td>
					<td class="biao_bt3"><spring:message
							code="device_moduleNumber" /></td>
					<td>${deviceInfo.moduleNumber }</td>
					<td class="biao_bt3"><spring:message code="device_beginDate" /></td>
					<td>${deviceInfo.beginDate }</td>
				</tr>
				<tr>
					<td class="biao_bt3"><spring:message code="device_userName" /></td>
					<td>${deviceInfo.userName}</td>
					<td class="biao_bt3"><spring:message code="device_userMail" /></td>
					<td>${deviceInfo.userMail }</td>
					<td class="biao_bt3"><spring:message code="device_userIphone" /></td>
					<td>${deviceInfo.userIphone }</td>
				</tr>
				<tr>
					<td class="biao_bt3"><spring:message code="device_userAddress" /></td>
					<td colspan="5">${deviceInfo.userAddress }</td>
				</tr>
				<tr style="height: 100px;">
					<td class="biao_bt3" colspan="2"><spring:message
							code="device_remark" /></td>
					<td colspan="4">${deviceInfo.remark }</td>
				</tr>
			</table>
		</div>
		<h3>
			<spring:message code="tbdevicestate_title" />
		</h3>
		<div class="contenttable1">
			<table class="content" style="width: 99%;">
				<tr>
					<td class="biao_bt3"><spring:message
							code="tbdevicestate_deviceUnitState" /></td>
					<td>${deviceStateInfo.deviceUnitState}</td>
					<td class="biao_bt3"><spring:message
							code="tbdevicestate_runMode" /></td>
					<td>${deviceStateInfo.runMode}</td>
					<td class="biao_bt3"><spring:message
							code="tbdevicestate_moduleNum" /></td>
					<td>${deviceStateInfo.moduleNum}</td>
				</tr>
				<tr>
					<td class="biao_bt3"><spring:message
							code="tbdevicestate_environmentCelsius" /></td>
					<td>${deviceStateInfo.environmentCelsius}</td>
					<td class="biao_bt3"><spring:message
							code="tbdevicestate_coolingCelsius" /></td>
					<td>${deviceStateInfo.coolingCelsius}</td>
					<td class="biao_bt3"><spring:message
							code="tbdevicestate_heatingCelsius" /></td>
					<td>${deviceStateInfo.heatingCelsius}</td>
				</tr>
				<tr>
					<td class="biao_bt3" colspan="2"><spring:message
							code="tbdevicestate_effluentCelsius" /></td>
					<td>${deviceStateInfo.effluentCelsius}</td>
					<td class="biao_bt3" colspan="2"><spring:message
							code="tbdevicestate_rewaterCelsius" /></td>
					<td>${deviceStateInfo.rewaterCelsius}</td>
				</tr>
				<tr>
					<td class="biao_bt3"><spring:message
							code="tbdevicestate_totalRunDate" /></td>
					<td colspan="5">${deviceStateInfo.totalRunDate}</td>
				</tr>
			</table>
			<div>
				<h3>
					<spring:message code="tbmodule_title" />
				</h3>
			</div>
			<table class="content" style="width: 99%;">
				<tr>
					<td class="biao_bt3"><spring:message code="tbmodule_name" /></td>
					<td class="biao_bt3"><spring:message code="tbmodule_address" /></td>
					<td class="biao_bt3"><spring:message code="tbmodule_mstate" /></td>
					<td class="biao_bt3" colspan="2"><spring:message
							code="tbmodule_operation" /></td>
				</tr>
				
				<c:if test="${tbmoduleInfo==null}">
				No Data
				</c:if>
				
				<c:if test="${tbmoduleInfo!=null}">
				<c:forEach items="${tbmoduleInfo}"  var="tbmodule" varStatus="indexs">
				<tr>
					<td>${ indexs.index +1 }</td>
					<td>${ tbmodule.address}</td>
					<td>${ tbmodule.mstate}</td>
					<td style="line-height: 1px;"><form:form id="useForm1"
							name="useForm1" modelAttribute="tbcommand" method="post"
							class="form-horizontal">
							<input type="hidden" id="command_use" name="command" /><!--  value="01 03 23 20 FF FF ${ tbmodule.address}" -->
							<input type="hidden" name="uuid" id="test"
								value="${deviceInfo.id}" />
							<a href="#" id="usebutton1" class="easyui-linkbutton"
								data-options="iconCls:'',plain:false" onclick="useClick('${ tbmodule.address}')" ><spring:message
									code="tbmodule_use" /></a>
						</form:form></td>
					<td style="line-height: 1px;"><form:form id="useForm2"
							name="useForm2" modelAttribute="tbcommand" method="post"
							class="form-horizontal">
							<input type="hidden" id="command_ban" name="command"  /><!--  value="01 06 23 20 00 00 ${ tbmodule.address}"-->
							<input type="hidden" name="uuid" id="test"
								value="${deviceInfo.id}" />
							<a href="#" id="banbutton1" class="easyui-linkbutton"  onclick="banClick('${ tbmodule.address}')" 
								data-options="iconCls:'',plain:false"><spring:message
									code="tbmodule_ban" /></a>
						</form:form></td>
				</tr>
				</c:forEach>
						</c:if>
						
				
				<%-- <tr>
					<td>2</td>
					<td>01</td>
					<td><spring:message code="tbmodule_use" /></td>
					<td style="line-height: 1px;"><form:form id="useForm3"
							name="useForm3" modelAttribute="tbcommand" method="post"
							class="form-horizontal">
							<input type="hidden" name="command" value="01 03 23 20 FF FF 01" />
							<input type="hidden" name="uuid" id="test"
								value="${deviceInfo.id}" />
							<a href="#" id="usebutton2" class="easyui-linkbutton"
								data-options="iconCls:'',plain:false"><spring:message
									code="tbmodule_use" /></a>
						</form:form></td>
					<td style="line-height: 1px;"><form:form id="useForm4"
							name="useForm4" modelAttribute="tbcommand" method="post"
							class="form-horizontal">
							<input type="hidden" name="command" value="01 06 23 20 00 00 01" />
							<input type="hidden" name="uuid" id="test"
								value="${deviceInfo.id}" />
							<a href="#" id="banbutton2" class="easyui-linkbutton"
								data-options="iconCls:'',plain:false"><spring:message
									code="tbmodule_ban" /></a>
						</form:form></td>
						</tr> --%>
						
						
			</table>
		</div>
		<h3>
			<spring:message code="tbcommand_title" />
		</h3>

		<div class="contenttable1">

			<table class="content" style="width: 99%;">
				<form:form id="runMode_Form" name="runMode_Form"
					modelAttribute="tbcommand" method="post" class="form-horizontal">
					<input type="hidden" name="uuid" id="test" value="${deviceInfo.id}" />
					<tr>

						<td class="biao_bt3"><spring:message
								code="tbdevicestate_runMode" /></td>
						<td><select name="command" id="commandValue1"
							style="width: 200px;"><option value="choice">choice</option>
								<option value="01 06 23 00 00 01">heating mode</option>
								<option value="01 06 23 00 00 02">cooling mode</option>
								<option value="01 06 23 00 00 03">auto mode</option>
						</select></td>

						<td style="line-height: 1px;"><a href="#" id="submitRunMode"
							class="easyui-linkbutton" data-options="iconCls:'',plain:false"><spring:message
									code="deviceInfo_settings" /></a></td>
					</tr>
				</form:form>
				<form:form id="heatingCelsiusForm" name="heatingCelsiusForm"
					modelAttribute="tbcommand" method="post" class="form-horizontal">
					<input type="hidden" name="uuid" id="test" value="${deviceInfo.id}" />
					<tr>
						<td class="biao_bt3"><spring:message
								code="tbdevicestate_heatingCelsius" /></td>
						<td><input type="text" id="commandValue2" name="command"
							value="" /></td>
						<td style="line-height: 1px;"><a href="#"
							id="submitheatCelsius" class="easyui-linkbutton"
							data-options="iconCls:'',plain:false"><spring:message
									code="deviceInfo_settings" /></a></td>
					</tr>
				</form:form>
				<form:form id="coolCelsiusForm" name="coolCelsiusForm"
					modelAttribute="tbcommand" method="post" class="form-horizontal">
					<input type="hidden" name="uuid" id="test" value="${deviceInfo.id}" />
					<tr>
						<td class="biao_bt3"><spring:message
								code="tbdevicestate_coolingCelsius" /></td>
						<td><input type="text" id="commandValue3" name="command"
							value="" /></td>
						<td style="line-height: 1px;"><a href="#"
							id="submitcoolCelsius" class="easyui-linkbutton"
							data-options="iconCls:'',plain:false"><spring:message
									code="deviceInfo_settings" /></a></td>
					</tr>
				</form:form>
			</table>

			<div id="tbcommand_list_toolbar" align="left"
				style="padding-top: 10px; padding-bottom: 10px;">
				<form:form id="startForm" name="startForm"
					modelAttribute="tbcommand" method="post" class="form-horizontal">
					<input type="hidden" id="commandValue" name="command" value="" />
					<input type="hidden" name="uuid" id="test" value="${deviceInfo.id}" />
					<a href="#" id="submitStart" class="easyui-linkbutton"
						data-options="iconCls:'',plain:false"><spring:message
							code="deviceInfo_start" /></a>
					<a href="#" id="submitStop" class="easyui-linkbutton"
						data-options="iconCls:'',plain:false"><spring:message
							code="deviceInfo_stop" /></a>
					<a href="#" id="submitReset" class="easyui-linkbutton"
						data-options="iconCls:'',plain:false"><spring:message
							code="deviceInfo_reset" /></a>
					<a href="#" id="submitDefrost" class="easyui-linkbutton"
						data-options="iconCls:'',plain:false"><spring:message
							code="deviceInfo_defrost" /></a>
				</form:form>
			</div>

		</div>

	</div>
	
	
	<script>
	
	function useClick(val){
		
		
		
		document.getElementById("command_use").value="01 03 23 20 FF FF " +val;
	//	$('#command_use').val("01 03 23 20 FF FF "+val);
		$.post('device/parameterStatus/', $("#useForm1")
				.serialize(), function(response) {
			if (response == "Success") {
				alert("Success");
			}

		});
	}
	
function banClick(val){
		
		
		document.getElementById("command_ban").value="01 06 23 20 00 00 " +val;
		$.post('device/parameterStatus/', $("#useForm2")
				.serialize(), function(response) {
			if (response == "Success") {
				alert("Success");
			}

		});
	}
		$.parser.onComplete = function() {
			parent.$.messager.progress('close');
		};

		$('#submitStart').click(
				function(e) {
					$('#commandValue').val("01 05 00 00 FF 00 8C 3A");
					$.post('device/parameterStatus/', $("#startForm")
							.serialize(), function(response) {
						if (response == "Success") {
							alert("Success");
						}

					});
				});
		$('#submitStop').click(
				function(e) {
					$('#commandValue').val("01 05 00 01 FF 00 DD FA");
					$.post('device/parameterStatus/', $("#startForm")
							.serialize(), function(response) {
						if (response == "Success") {
							alert("Success");
						}

					});
				});
		$('#submitReset').click(
				function(e) {
					$('#commandValue').val("01 05 00 08 FF 00 0D F8");
					$.post('device/parameterStatus/', $("#startForm")
							.serialize(), function(response) {
						if (response == "Success") {
							alert("Success");
						}

					});
				});
		$('#submitDefrost').click(
				function(e) {
					$('#commandValue').val("01 05 00 10 FF 00 8D FF");
					$.post('device/parameterStatus/', $("#startForm")
							.serialize(), function(response) {
						if (response == "Success") {
							alert("Success");
						}

					});
				});
		$('#submitRunMode').click(
				function(e) {
				
					var cmdValue = $('#commandValue1').val();
					alert("jkkjk44"+cmdValue );
					if (cmdValue != "choice") {
						alert("jkkjk");
						
						$.post('device/parameterStatus/', $("#runMode_Form").serialize(), function(response) {
							if (response == "Success") {
								alert("Success");
							}

						});
						/* $.post('device/parameterStatus/', $("#runModeForm")
								.serialize(), function(response) {
							if (response == "Success") {
								$('#commandValue1').val("");
								alert("Success");
							}
						}); */
					} else {
						alert("empty");
						("#selectError").html("please select value");
					}

				});
		$('#submitheatCelsius').click(
				function(e) {
					var cmdValue = $('#commandValue2').val();
					if (cmdValue != "") {
						$('#commandValue2').val('01 06 23 02 00 ' + cmdValue);
						$.post('device/parameterStatus/', $(
								"#heatingCelsiusForm").serialize(), function(
								response) {
							if (response == "Success") {
								$('#commandValue2').empty();
								alert("Success");
							}

						});
					} else {
						alert("Fail");
					}
				});
		$('#submitcoolCelsius').click(
				function(e) {
					var cmdValue = $('#commandValue3').val();
					if (cmdValue != "") {
						$('#commandValue3').val('01 06 23 01 00 ' + cmdValue);
						$.post('device/parameterStatus/', $("#coolCelsiusForm")
								.serialize(), function(response) {
							if (response == "Success") {
								$('#commandValue3').empty();
								alert("Success");
							}

						});
					} else {
						alert("loss");
					}
				});
		/* $('#usebutton1').click(
				function(e) {
					$.post('device/parameterStatus/', $("#useForm1")
							.serialize(), function(response) {
						if (response == "Success") {
							alert("Success");
						}

					});
				}); */

		/* $('#banbutton1').click(
				function(e) {
					$.post('device/parameterStatus/', $("#useForm2")
							.serialize(), function(response) {
						if (response == "Success") {
							alert("Success");
						}

					});
				}); */
		$('#usebutton2').click(
				function(e) {
					$.post('device/parameterStatus/', $("#useForm3")
							.serialize(), function(response) {
						if (response == "Success") {
							alert("Success");
						}

					});
				});
		$('#banbutton2').click(
				function(e) {
					$.post('device/parameterStatus/', $("#useForm4")
							.serialize(), function(response) {
						if (response == "Success") {
							alert("Success");
						}

					});
				});
	</script>