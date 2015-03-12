<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>
<div class="easyui-accordion"
	data-options="fit:true,iconCls:'icon-ok',border:false">
	
	
	<div class="menuItem" title='设备列表' data-options="iconCls:'icon-webcam'"
		style="padding: 10px;">
		<ul>
		<c:forEach var="device" items="${devices}">
		<li><a data-options="plain:true" href="javascript:void(0)"
				class="user easyui-linkbutton"
				onclick="indexTabsAddTab('href',{title:'${device.deviceName}',url:'${ctx}/device/devicelist/${device.id}',iconCls:'icon-webcam'})">
				   <img
					src="${ctx}/static/js/plugins/jquery-easyui-1.3.4/themes/icons/webcam_add.png" />&nbsp;${device.deviceName}
			</a></li>
		</c:forEach>
		
		</ul>
	</div>
	<%-- 
	<div class="menuItem" title='设备监控' data-options="iconCls:'icon-monitor'"
		style="padding: 10px;">
		<ul>
			<li><a data-options="plain:true" href="javascript:void(0)"
				class="user easyui-linkbutton"
				onclick="indexTabsAddTab('href',{title:'设备管理',url:'${ctx}/device',iconCls:'icon-monitor_go'})">
					<img
					src="${ctx}/static/js/plugins/jquery-easyui-1.3.4/themes/icons/monitor_go.png" />&nbsp;设备管理
			</a></li>
			
			<li><a data-options="plain:true" href="javascript:void(0)"
				class="user easyui-linkbutton"
				onclick="indexTabsAddTab('href',{title:'命令管理',url:'${ctx}/tbcommand',iconCls:'icon-monitor_go'})">
					<img
					src="${ctx}/static/js/plugins/jquery-easyui-1.3.4/themes/icons/monitor_go.png" />&nbsp;命令管理
			</a></li>
			
			<li><a data-options="plain:true" href="javascript:void(0)"
				class="user easyui-linkbutton"
				onclick="indexTabsAddTab('href',{title:'设备状态',url:'${ctx}/tbdevicestate',iconCls:'icon-monitor_go'})">
					<img
					src="${ctx}/static/js/plugins/jquery-easyui-1.3.4/themes/icons/monitor_go.png" />&nbsp;设备状态
			</a></li>
			
						
			<li><a data-options="plain:true" href="javascript:void(0)"
				class="user easyui-linkbutton"
				onclick="indexTabsAddTab('href',{title:'执行结果',url:'${ctx}/tbfeedback',iconCls:'icon-monitor_go'})">
					<img
					src="${ctx}/static/js/plugins/jquery-easyui-1.3.4/themes/icons/monitor_go.png" />&nbsp;执行结果
			</a></li>
			
			<li><a data-options="plain:true" href="javascript:void(0)"
				class="user easyui-linkbutton"
				onclick="indexTabsAddTab('href',{title:'模块管理',url:'${ctx}/tbmodule',iconCls:'icon-monitor_go'})">
					<img
					src="${ctx}/static/js/plugins/jquery-easyui-1.3.4/themes/icons/monitor_go.png" />&nbsp;模块管理
			</a></li>
		</ul>
	</div>
	--%>
	<div class="menuItem" title='系统设置' data-options="iconCls:'icon-cog'"
		style="padding: 10px;">
		<ul>
			<li><a data-options="plain:true" href="javascript:void(0)"
				class="user easyui-linkbutton"
				onclick="indexTabsAddTab('href',{title:'用户管理',url:'${ctx}/account/user',iconCls:'icon-user_gray'})">
					<img
					src="${ctx}/static/js/plugins/jquery-easyui-1.3.4/themes/icons/user_gray.png" />&nbsp;用户管理
			</a></li>
			<li><a data-options="plain:true" href="javascript:void(0)"
				class="user easyui-linkbutton"
				onclick="indexTabsAddTab('href',{title:'角色管理',url:'${ctx}/account/role',iconCls:'icon-group_key'})">
					<img
					src="${ctx}/static/js/plugins/jquery-easyui-1.3.4/themes/icons/group_key.png" />&nbsp;角色管理
			</a></li>
			<li><a data-options="plain:true" href="javascript:void(0)"
				class="user easyui-linkbutton"
				onclick="indexTabsAddTab('href',{title:'权限管理',url:'${ctx}/account/permission',iconCls:'icon-key'})">
					<img src="${ctx}/static/js/plugins/jquery-easyui-1.3.4/themes/icons/key.png" />&nbsp;权限管理
			</a></li>
			<li><a data-options="plain:true" href="javascript:void(0)"
				class="user easyui-linkbutton"
				onclick="indexTabsAddTab('href',{title:'参数管理',url:'${ctx}/parameter',iconCls:'icon-plugin'})">
					<img
					src="${ctx}/static/js/plugins/jquery-easyui-1.3.4/themes/icons/plugin.png" />&nbsp;参数管理
			</a></li>
		</ul>
	</div>
</div>



