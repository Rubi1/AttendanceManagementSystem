<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>


<%-- <script type="text/javascript"
	src="${ctx}/static/js/swfobject_modified.js"></script> --%>

<script>
var clickdevice_id; 
	$.parser.onComplete = function() {
		parent.$.messager.progress('close');
	};

var dynamicid="#comboxForm"+${deviceInfo.id};

 	$(dynamicid).form({
		onSubmit : function() {

			return $(this).form('validate');
		},
		success : function(data) {
			$.messager.show({
				title : '消息',
				msg : '设置成功！',
				timeout : 2000,
				showType : 'slide'
			});
		},
		error : function() {
			alert('error');
		}
	});
 	var dynamicid1="#combox1Form"+${deviceInfo.id};
 	$(dynamicid1).form({
		onSubmit : function() {

			return $(this).form('validate');
		},
		success : function(data) {
			$.messager.show({
				title : '消息',
				msg : '设置成功！',
				timeout : 2000,
				showType : 'slide'
			});
		},
		error : function() {
			alert('error');
		}
	}); 
 	var dynamic2id="#combox2Form"+${deviceInfo.id};
 	$(dynamic2id).form({
		onSubmit : function() {

			return $(this).form('validate');
		},
		success : function(data) {
			$.messager.show({
				title : '消息',
				msg : '设置成功！',
				timeout : 2000,
				showType : 'slide'
			});
		},
		error : function() {
			alert('error');
		}
	}); 

	function setTab(name, cursel, n) {
		
		for (i = 1; i <= n; i++) {
			var menu = document.getElementById(name + i);
			var con = document.getElementById("con_" + name + i);
			menu.className = i == cursel ? "hover" : "";
			con.style.display = i == cursel ? "block" : "none";
		}
	}

	function actionfunBut(clickbut,deviceid) {

		var command_values;
		if (clickbut.length != 0) {
			if (clickbut == "start") {
			//	$('#commandValue').val("01 05 00 00 FF 00 8C 3A");
				command_values="01 05 00 00 FF 00 8C 3A";
			} else if (clickbut == "stop") {
				//$('#commandValue').val("01 05 00 01 FF 00 DD FA");
				command_values="01 05 00 01 FF 00 DD FA";
			} else if (clickbut == "reset") {
				//$('#commandValue').val("01 05 00 08 FF 00 0D F8");
				command_values="01 05 00 08 FF 00 0D F8";
			} else if (clickbut == "defrost") {
				//$('#commandValue').val("01 05 00 10 FF 00 8D FF");
				command_values="01 05 00 10 FF 00 8D FF";
			}
		}

		//alert(command_values +deviceid);
		 $.ajax({
			type : "POST",
			//dataType: 'json',           
			//url : '${ctx}/device/parameterStatus/',
			//data : $("#startForm").serialize(),
			url : '${ctx}/device/parameterStatusData/',
			data : {"id":deviceid,"command":command_values},
			success : function(data) {
				$.messager.show({
					title : '消息',
					msg : '设置成功！',
					timeout : 2000,
					showType : 'slide'
				});
			},
			error : function() {
				alert('对不起，保存数据失败!');

			}

		});//ajax  

	}

	function actionfuncombox(comvalue,clickdeviceid) {
		
		if (comvalue == "1") {
			clickdevice_id=clickdeviceid;
			$('#comboxForm'+clickdeviceid).submit();
			
		} else if (comvalue == "2") {
			var vals = $('#combox1Form_inp'+clickdeviceid).val();
		
			$('#combox1Form_com'+clickdeviceid).val("01 06 23 02 00 " + vals);
			$('#combox1Form'+clickdeviceid).submit();
			
		} else if (comvalue == "3") {
			var valz = $('#combox2Form_inp'+clickdeviceid).val();
			$('#combox2Form_com'+clickdeviceid).val("01 06 23 01 00 " + valz);
			$('#combox2Form'+clickdeviceid).submit();
			
		}

	}

	function useactionfun(address,deviceId) {
		//01 03 23 20 FF FF 
		//$('#usebutValue').val("01 06 23 20 FF FF " + address);
		var commandvaluse = "01 06 23 20 FF FF "+address;
		$.ajax({
			type : "POST",
			//dataType: 'json',           
			url : '${ctx}/device/parameterStatusData/',
			//data : $("#useForm").serialize(),
				data : {"id":deviceId,"command":commandvaluse},
			success : function(data) {
				$.messager.show({
					title : '消息',
					msg : '设置成功！',
					timeout : 2000,
					showType : 'slide'
				});
			},
			error : function() {
				alert('对不起，保存数据失败!');

			}

		});//ajax 

	}
	function banactionfun(address,deviceId) {
		//$('#usebutValue').val("01 06 23 20  00 00 " + address);
		var commandval = "01 06 23 20 00 00 "+address;
		$.ajax({
			type : "POST",
			//dataType: 'json',           
			url : '${ctx}/device/parameterStatusData/',
			//data : $("#useForm").serialize(),
			data : {"id":deviceId,"command":commandval},
			success : function(data) {
				$.messager.show({
					title : '消息',
					msg : '设置成功！',
					timeout : 2000,
					showType : 'slide'
				});
			},
			error : function() {
				alert('对不起，保存数据失败!');

			}

		});//ajax 

	}
</script>


<div class="shebeiall">
	<!--三个目录的开始-->
	<div class="shebeimulu">
		<ul>
			<li id="see${deviceInfo.id}_1" onmouseover="setTab('see${deviceInfo.id}_',1,3)" class="hover">设备信息</li>
			<li id="see${deviceInfo.id}_2" onmouseover="setTab('see${deviceInfo.id}_',2,3)">设备状态</li>
			<li id="see${deviceInfo.id}_3" onmouseover="setTab('see${deviceInfo.id}_',3,3)">设备控制</li>
		</ul>
	</div>
	<!--三个目录的结束-->
	<div class="clear"></div>
	<div class="sbxxtable" id="con_see${deviceInfo.id}_1">
		<table width="970" border="0" cellpadding="1" cellspacing="0">
			<tr class="line1">
				<td width="88" height="55" align="center" valign="middle" class="br">设备名称</td>
				<td width="315" class="br">${deviceInfo.deviceName }</td>
				<td width="122" align="center" valign="middle" class="br">模块数</td>
				<td width="179" class="br">${deviceInfo.moduleNumber }</td>
				<td width="99" align="center" valign="middle" class="br">启用时间</td>
				<td class="bb" width="153">${deviceInfo.beginDate }</td>
			</tr>
			<tr style="background: #e9fff3">
				<td height="60" align="center" valign="middle" class="br">用户名称</td>
				<td class="br">${deviceInfo.userName}</td>
				<td class="br" align="center" valign="middle">用户邮箱</td>
				<td class="br">${deviceInfo.userMail }</td>
				<td class="br" align="center" valign="middle">用户电话：</td>
				<td class="bb">${deviceInfo.userIphone }</td>
			</tr>
			<tr style="background: #f6f6f6">
				<td class="br" height="54" align="center" valign="middle">用户地址</td>
				<td class="bb" colspan="5">${deviceInfo.userAddress }</td>
			</tr>
			<tr style="background: #e6fcff">
				<td class="brr" height="110" align="center" valign="middle">备注</td>
				<td style="text-indent: 2em; line-height: 24px;" colspan="5">${deviceInfo.remark }</td>
			</tr>
		</table>

	</div>
	<!--设备信息结束-->


	<!--设备状态制开始-->

	<div id="con_see${deviceInfo.id}_2" style="display: none;" class="shebeizt">

		<table width="975" height="477" border="0" cellpadding="1"
			cellspacing="0">
			<tr style="background: #edfff5;">
				<td class="br" width="147" height="76" align="center">机组状态</td>
				<td class="br" width="162" align="center">${deviceStateInfo.deviceUnitState}
				<%-- <c:if test="${deviceStateInfo.deviceUnitState =='0' }">机组待机态</c:if>
				<c:if test="${deviceStateInfo.deviceUnitState =='1' }">机组正在启动中</c:if>
				<c:if test="${deviceStateInfo.deviceUnitState =='2' }">机组运行态</c:if>
				<c:if test="${deviceStateInfo.deviceUnitState =='3' }">机组正在停机中</c:if>
				<c:if test="${deviceStateInfo.deviceUnitState =='4' }">机组严重报警态</c:if>
				<c:if test="${deviceStateInfo.deviceUnitState =='8' }">机组预热</c:if>
				<c:if test="${deviceStateInfo.deviceUnitState =='9' }">机组有故障</c:if>
				<c:if test="${deviceStateInfo.deviceUnitState =='10' }">机组防冻</c:if>--%>
				</td>
				<td class="br" width="154" align="center">运行模式</td>
				<td class="br" width="154" align="center">
				<c:if test="${deviceStateInfo.runMode =='1' }">制热模式</c:if>
				<c:if test="${deviceStateInfo.runMode =='2' }">制冷模式</c:if>
				<c:if test="${deviceStateInfo.runMode =='3' }">自动模式</c:if>
				</td>
				<td class="br" width="154" align="center">模块个数</td>
				<td class="bb" width="164" align="center">${deviceStateInfo.moduleNum}</td>
			</tr>
			<tr>
				<td class="br" height="93" align="center"
					style="background: #dfffee"><img
					src="${ctx}/static/images/images_new/2014-12-31_155303.jpg"
					height="45" width="42" alt="" /><br />环境温度</td>
				<td class="br" style="background: #dfffee" align="center">
					${deviceStateInfo.environmentCelsius} ℃</td>
				<td class="br" align="center" style="background: #aff4fe"><img
					src="${ctx}/static/images/images_new/2014-12-31_155409.jpg"
					height="42" width="40" alt="" /><br />制冷温度</td>
				<td class="br" style="background: #aff4fe" align="center">${deviceStateInfo.coolingCelsius}
					℃</td>
				<td class="br" align="center" style="background: #ffd8d8"><img
					src="${ctx}/static/images/images_new/2014-12-31_155419.jpg"
					height="45" width="42" alt="" /><br />制热温度</td>
				<td class="bb" style="background: #ffd8d8" align="center">${deviceStateInfo.heatingCelsius}
					℃</td>
			</tr>
			<tr style="background: #e6fcff">
				<td class="br" height="95" colspan="2" align="center"><img
					src="${ctx}/static/images/images_new/2014-12-31_155428.jpg"
					height="53" width="49" alt="" /><br />蒸发（空调系统）出水温度</td>
				<td class="br" align="center">${deviceStateInfo.effluentCelsius}℃</td>
				<td class="br" colspan="2" align="center"><img
					src="${ctx}/static/images/images_new/2014-12-31_155438.jpg"
					height="53" width="47" alt="" /><br />蒸发（空调系统）回水温度</td>
				<td class="bb" align="center">${deviceStateInfo.rewaterCelsius}℃</td>
			</tr>
			<tr bgcolor="ffe9e9">
				<td class="br" height="86" colspan="2" align="center"><img
					src="${ctx}/static/images/images_new/2014-12-31_155445.jpg"
					height="53" width="44" alt="" /><br />机组累计运行时间</td>
				<td class="bb" colspan="4" align="left">${deviceStateInfo.totalRunDate}</td>
			</tr>
			<tr bgcolor="f7f7f7">
				<td height="45" align="left" colspan="6">&nbsp;&nbsp;&nbsp;&nbsp;模块状态</td>
			</tr>
			<tr bgcolor="f7f7f7">
				<td colspan="6">
					<table width="98%" border="0" cellpadding="1" cellspacing="0"
						style="margin: 0px 0 10px 10px;">
						<tr>
							<td class="biao_bt3"><spring:message code="tbmodule_name" /></td>
							<td class="biao_bt3"><spring:message code="tbmodule_address" /></td>
							<td class="biao_bt3"><spring:message code="tbmodule_mstate" /></td>
							<td class="biao_bt3" colspan="2">操作</td>
						</tr>
						<c:if test="${tbmoduleInfo !=null }">
							<c:forEach items="${tbmoduleInfo}" var="mdule_item"
								varStatus="indexs">
								<tr>
									<!--${ indexs.index +1}  -->
									<td class="br" height="24" align="center">${mdule_item.name }
									</td>
									<td class="br" align="center">${mdule_item.address }</td>
									<td class="br" align="center">
										<c:if test="${mdule_item.mstate =='0' }">启用</c:if>
										<c:if test="${mdule_item.mstate =='1' }">禁用</c:if></td>
									<td class="bb" width="50px"><c:if
											test="${mdule_item.mstate  !=null }">
											<c:if test="${mdule_item.mstate =='0' }">
												<a id="btn" href="#" disabled class="easyui-linkbutton"
													onclick="javascript:useactionfun('${mdule_item.address }','${deviceInfo.id}');">启用</a>
												<a id="btn" href="#" class="easyui-linkbutton"
													onclick="javascript:banactionfun('${mdule_item.address }','${deviceInfo.id}');">禁用</a>
											</c:if>
											<c:if test="${mdule_item.mstate =='1' }">
												<a id="btn" href="#" class="easyui-linkbutton"
													onclick="javascript:useactionfun('${mdule_item.address }','${deviceInfo.id}');">启用</a>
												<a id="btn" href="#" disabled class="easyui-linkbutton"
													onclick="javascript:banactionfun('${mdule_item.address }','${deviceInfo.id}');">禁用</a>
											</c:if>

										</c:if></td>
								</tr>
							</c:forEach>
						</c:if>

					</table>
				</td>
			</tr>
		</table>
		<br /><br />
		<br /><br />



	</div>

	<!--设备状态结束-->


	<!--设备控制开始-->
	<div class="shebeikz" id="con_see${deviceInfo.id}_3" style="display: none;">
		<table width="975" border="0" cellpadding="0" cellspacing="0">
			<tr bgcolor="f6f6f6">
				<td colspan="2" height="123" align="center" valign="middle"><a
					href="#" onclick="javascript:actionfunBut('start','${deviceInfo.id}')"><img
						src="${ctx}/static/images/images_new/2014-12-31_160044.jpg"
						height="56" width="133" alt="" /></a></td>
				<td width="195" align="center" valign="middle"><a href="#"
					onclick="javascript:actionfunBut('stop','${deviceInfo.id}')"><img
						src="${ctx}/static/images/images_new/2014-12-31_160106.jpg"
						height="56" width="133" alt="" /></a></td>
				<td width="219" align="center" valign="middle"><a href="#"
					onclick="javascript:actionfunBut('reset','${deviceInfo.id}')"><img
						src="${ctx}/static/images/images_new/2014-12-31_160118.jpg"
						height="56" width="133" alt="" /></a></td>
				<td width="310" align="center" valign="middle"><a href="#"
					onclick="javascript:actionfunBut('defrost','${deviceInfo.id}')"><img
						src="${ctx}/static/images/images_new/2014-12-31_160150.jpg"
						height="56" width="133" alt="" /></a></td>
			</tr>
			<tr bgcolor="f0fdff">

				<td width="112" height="96" align="right" valign="middle"><img
					src="${ctx}/static/images/images_new/2014-12-31_160213.jpg"
					height="53" width="45" alt="" /></td>
				<td width="137" align="center">运行模式</td>
				<td colspan="2"><form:form id="comboxForm${deviceInfo.id}"
						modelAttribute="tbcommand" method="post" class="form-horizontal"
						action="${ctx}/device/parameterStatus">
						<input type="hidden" id="id" name="id" value="${deviceInfo.id }" />
						<select id="comboxcommand${deviceInfo.id}" name="command"
							class=" easyui-validatebox inputmiddle"
							data-options="missingMessage:'运行模式  不能为空.',required:true">
							<option value="">请选择</option>
							<option value="01 06 23 00 00 01">制热模式</option>
							<option value="01 06 23 00 00 02">制冷模式</option>
							<option value="01 06 23 00 00 03">自动模式</option>
						</select>
					</form:form></td>
				<td><a href="#" onclick="javascript:actionfuncombox('1','${deviceInfo.id}')">
						<img src="${ctx}/static/images/images_new/2014-12-31_160258.jpg"
						height="36" width="70" alt="" />
				</a></td>
			</tr>
			<tr bgcolor="f0fdff">
				<td height="100" align="right" valign="middle"><img
					src="${ctx}/static/images/images_new/2014-12-31_160221.jpg"
					height="44" width="44" alt="" /></td>
				<td align="center">制热温度</td>
				<td colspan="2">
					<!-- <select class="teshu">
        	<option>天宝空气能热泵</option>
        </select> --> <form:form id="combox1Form${deviceInfo.id}"
						modelAttribute="tbcommand" method="post" class="form-horizontal"
						action="${ctx}/device/parameterStatus">
						<input type="hidden" id="id" name="id" value="${deviceInfo.id }" />
						<!-- <select id="comboxcommand" name="command" class=" easyui-validatebox"  data-options="missingMessage:'运行模式  不能为空.',required:true">
        	<option value="">天宝空气能热泵</option>
        	<option value="01 06 23 00 00 01">heating mode</option>
			<option value="01 06 23 00 00 02">cooling mode</option>
			<option value="01 06 23 00 00 03">auto mode</option>
        </select> -->
						<input id="combox1Form_com${deviceInfo.id}" type="hidden" name="command">
						<input class="easyui-validatebox inputmiddle" id="combox1Form_inp${deviceInfo.id}"
							type="text" name="command1"
							data-options="missingMessage:'运行模式  不能为空.',required:true">
					</form:form>
				</td>
				<td><a href="#" onclick="javascript:actionfuncombox('2','${deviceInfo.id}')"><img
						src="${ctx}/static/images/images_new/2014-12-31_160258.jpg"
						height="36" width="70" alt="" /></a></td>
			</tr>
			<tr bgcolor="f0fdff">
				<td height="106" align="right" valign="middle"><img
					src="${ctx}/static/images/images_new/2014-12-31_160231.jpg"
					height="46" width="43" alt="" /></td>
				<td align="center">制冷温度</td>
				<td colspan="2"><form:form id="combox2Form${deviceInfo.id}"
						modelAttribute="tbcommand" method="post" class="form-horizontal"
						action="${ctx}/device/parameterStatus">
						<input type="hidden" id="id" name="id" value="${deviceInfo.id }" />
						<input id="combox2Form_com${deviceInfo.id}" type="hidden" name="command">
						<input class="easyui-validatebox inputmiddle" type="text"
							id="combox2Form_inp${deviceInfo.id}" name="command2"
							data-options="missingMessage:'运行模式  不能为空.',required:true">
					</form:form> <!-- <select class="teshu" class="easyui-combobox">
        	<option>天宝空气能热泵</option>
        	<option value="1">1</option>
        	<option value="2">2</option>
        </select> --></td>
				<td><a href="#" onclick="javascript:actionfuncombox('3','${deviceInfo.id}')"><img
						src="${ctx}/static/images/images_new/2014-12-31_160258.jpg"
						height="36" width="70" alt="" /></a></td>
		</table>

	</div>
	<!--设备控制结束-->

	<%-- <form:form id="startForm" name="startForm" modelAttribute="tbcommand"
		method="post" class="form-horizontal" style="display: none;">
		<input type="hidden" id="commandValue" name="command" value="" />
		<input type="hidden" id="id" name="id" value="${deviceInfo.id }" />
	</form:form> --%>

	<%-- <form:form id="useForm" name="useForm" modelAttribute="tbcommand"
		method="post" class="form-horizontal" style="display: none;">
		<input type="hidden" id="usebutValue" name="command" value="" />
		<input type="hidden" id="id" name="id" value="${deviceInfo.id }" />
	</form:form> --%>

</div>

<style>
.shebeiall {
	width: 980px;
	margin: 0 auto;
}

.shebeimulu {
	width: 600px;
	position: relative;
	top: 10px;
	left: 300px;
}

.shebeimulu ul li {
	width: 110px;
	font-size: 15px;
	font-family: "微软雅黑";
	float: left;
	text-align: center;
	display: block;
	line-height: 35px;
	height: 35px;
}

.shebeimulu ul li.hover {
	width: 110px;
	height: 35px;
	display: block;
	text-align: center;
	background: #E8F2FE;
	line-height: 35px;
	color: #ED5756;
}

.sbxxtable {
	width: 972px;
	margin-top: 20px;
}

.sbxxtable table {
	border: #e0ecff 1px solid;
	font-size: 14px;
}

.br {
	border-right: #e0ecff 1px solid;
	border-bottom: #e0ecff 1px solid;
}

.bb {
	border-bottom: #e0ecff 1px solid;
}

.brr {
	border-right: #e0ecff 1px solid;
}

.line1 {
	background: #f6f6f6;
}

.shebeizt {
	margin-top: 20px;
}

.shebeizt table {
	border: #e0ecff 1px solid;
	font-size: 14px;
}

.shebeikz {
	margin-top: 20px;
}

.shebeikz table {
	border: #e0ecff 1px solid;
	font-size: 14px;
}

.teshu {
	width: 390px;
	height: 32px;
	line-height: 32px;
}

</style>

<script>
	
</script>