<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>
<div data-options="fit:true" class="easyui-panel">
	<div class="easyui-layout" data-options="fit:true">
		<div
			data-options="region:'north',border:false,title:'查询条件',iconCls:'icon-find'"
			style="height: 65px; overflow: hidden;">
			<form id="device_list_searchForm" method="post"
				style="width: 100%; overflow: hidden;">
				<table class="search_table" style="width: 100%;">
					<tr>
						<th><spring:message code="device_deviceName" /></th>
						<td><input type="text" name="search_EQ_deviceName"
							value="${ param.search_EQ_deviceName}" id="search_EQ_deviceName" /></td>
						<th><spring:message code="device_moduleNumber" /></th>
						<td><input type="text" name="search_EQ_moduleNumber"
							value="${ param.search_EQ_moduleNumber}"
							id="search_EQ_moduleNumber" /></td>
						<th style="width: 20%;">&nbsp;<a href="javascript:void(0);"
							id="device_list_searchBtn">查询</a>&nbsp;<a
							href="javascript:void(0);" id="device_list_clearBtn">清空</a></th>
					</tr>
				</table>
			</form>
		</div>
		<div data-options="region:'center',border:false">
			<table id="device_list_dg" style="display: none;"></table>
		</div>
		<div id="device_list_toolbar" style="display: none;">
			<a
				href="javascript:updateForm(device_list_create_url,'device_form_inputForm',device_list_datagrid,{title:'新增信息'});"
				class="easyui-linkbutton"
				data-options="iconCls:'icon-add',plain:false">添加</a> <a
				href="javascript:deleteBatch(device_list_delete_url,device_list_datagrid);"
				class="easyui-linkbutton"
				data-options="iconCls:'icon-remove',plain:false">删除</a>
		</div>
	</div>
</div>
<script type="text/javascript">
	//列表DataGrid
	var device_list_datagrid;
	//列表DataGrid ID
	var device_list_datagrid_id = 'device_list_dg';
	//列表查询表单ID
	var device_list_searchform_id = 'device_list_searchForm';
	//列表toolbar ID
	var device_list_toolbar_id = 'device_list_toolbar';
	//操作链接
	var device_list_create_url = '${ctx}/device/create';
	var device_list_update_url = '${ctx}/device/update/';
	var device_list_delete_url = '${ctx}/device/delete';
	var device_list_view_url = '${ctx}/device/view/';
	var device_list_datagrid_load_url = '${ctx}/device/findList';

	//定义相关的操作按钮
	function device_list_actionFormatter(value, row, index) {
		var str = '';
		str += formatString(
				'<img onclick="updateForm(\'{0}\',\'device_form_inputForm\',device_list_datagrid,{title:\'编辑信息\'});" src="{1}" title="编辑"/>',
				device_list_update_url + row.id,
				'${ctx}/static/js/plugins/jquery-easyui-1.3.4/themes/icons/application_form_edit.png');
		str += '&nbsp;';
		str += formatString(
				'<img onclick="deleteOne(\'{0}\',\'{1}\',device_list_datagrid);" src="{2}" title="删除"/>',
				row.id,
				device_list_delete_url,
				'${ctx}/static/js/plugins/jquery-easyui-1.3.4/themes/icons/application_form_delete.png');
		str += '&nbsp;';
		str += formatString(
				'<img onclick="view(\'{0}\',\'{1}\');" src="${ctx}/static/js/plugins/jquery-easyui-1.3.4/themes/icons/view.png" title="查看"/>',
				device_list_view_url + row.id);
		str += '&nbsp;';
		return str;
	}

	//DataGrid字段设置
	var device_list_datagrid_columns = [ [ {
		field : 'id',
		title : '编号',
		width : 150,
		checkbox : true,
		align : 'center'
	},
	/* {field : 'uuid',title : '<spring:message code="device_uuid" />',width : 150,align:'center'}, */
	{
		field : 'deviceName',
		title : '<spring:message code="device_deviceName" />',
		width : 150,
		align : 'center'
	}, {
		field : 'moduleNumber',
		title : '<spring:message code="device_moduleNumber" />',
		width : 150,
		align : 'center'
	}, {
		field : 'beginDate',
		title : '<spring:message code="device_beginDate" />',
		width : 150,
		align : 'center'
	}, {
		field : 'userName',
		title : '<spring:message code="device_userName" />',
		width : 150,
		align : 'center'
	}, {
		field : 'userAddress',
		title : '<spring:message code="device_userAddress" />',
		width : 150,
		align : 'center'
	}, {
		field : 'userIphone',
		title : '<spring:message code="device_userIphone" />',
		width : 150,
		align : 'center'
	}, {
		field : 'userMail',
		title : '<spring:message code="device_userMail" />',
		width : 150,
		align : 'center'
	}, 
	/*{
		field : 'remark',
		title : '<spring:message code="device_remark" />',
		width : 150,
		align : 'center'
	}, {
		field : 'dataSort',
		title : '<spring:message code="device_dataSort" />',
		width : 150,
		align : 'center'
	}, {
		field : 'dataState',
		title : '<spring:message code="device_dataState" />',
		width : 150,
		align : 'center'
	},
	 {field : 'createUser',title : '<spring:message code="device_createUser" />',width : 150,align:'center'},
	{field : 'updateUser',title : '<spring:message code="device_updateUser" />',width : 150,align:'center'}, 
	{
		field : 'createIp',
		title : '<spring:message code="device_createIp" />',
		width : 150,
		align : 'center'
	}, {
		field : 'updateIp',
		title : '<spring:message code="device_updateIp" />',
		width : 150,
		align : 'center'
	},*/
	/* {field : 'createDate',title : '<spring:message code="device_createDate" />',width : 150,align:'center'},
	{field : 'updateDate',title : '<spring:message code="device_updateDate" />',width : 150,align:'center'}, */
	{
		field : 'action',
		title : '操作',
		width : 80,
		align : 'center',
		formatter : device_list_actionFormatter
	} ] ];
	/** 初始化DataGrid,加载数据 **/
	function device_list_loadDataGrid() {
		device_list_datagrid = $('#' + device_list_datagrid_id).datagrid({
			url : device_list_datagrid_load_url,
			fit : true,
			border : false,
			fitColumns : true,
			singleSelect : false,
			striped : true,
			pagination : true,
			rownumbers : true,
			idField : 'id',
			pageSize : 15,
			pageList : [ 5, 10, 15, 20, 30, 40, 50 ],
			columns : device_list_datagrid_columns,
			toolbar : '#' + device_list_toolbar_id,
			onLoadSuccess : function() {
				$(this).datagrid('tooltip');
				$('#' + device_list_searchform_id + ' table').show();
				$('#' + device_list_datagrid_id).show();
				$('#' + device_list_toolbar_id).show();
				parent.$.messager.progress('close');
			}
		});
	}
	$.parser.onComplete = function() {
		//加载DataGrid数据
		device_list_loadDataGrid();
		//绑定按钮事件
		bindSearchBtn('device_list_searchBtn', 'device_list_clearBtn',
				'device_list_searchForm', device_list_datagrid);
	};
</script>


