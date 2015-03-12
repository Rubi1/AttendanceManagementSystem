<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>
<div data-options="fit:true" class="easyui-panel">
	<div class="easyui-layout" data-options="fit:true">
		<div
			data-options="region:'north',border:false,title:'查询条件',iconCls:'icon-find'"
			style="height: 65px;overflow: hidden;">
			<form id="traffic_list_searchForm" method="post"
				style="width:100%;overflow:hidden;">
				<table class="search_table" style="width: 100%;">
					<tr>
						    						<th><spring:message code="traffic_headName" /></th>
						<td><input type="text" name="search_EQ_headName"
							value="${ param.search_EQ_headName}"
							id="search_EQ_headName" /></td>   						<th><spring:message code="traffic_id" /></th>
						<td><input type="text" name="search_EQ_id"
							value="${ param.search_EQ_id}"
							id="search_EQ_id" /></td>  						<th style="width:20%;">&nbsp;<a href="javascript:void(0);"
							id="traffic_list_searchBtn">查询</a>&nbsp;<a
							href="javascript:void(0);" id="traffic_list_clearBtn">清空</a></th>
					</tr>
				</table>
			</form>
		</div>
		<div data-options="region:'center',border:false">
			<table id="traffic_list_dg" style="display: none;"></table>
		</div>
		<div id="traffic_list_toolbar" style="display: none;">
				<a href="javascript:updateForm(traffic_list_create_url,'traffic_form_inputForm',traffic_list_datagrid,{title:'新增信息'});" class="easyui-linkbutton" data-options="iconCls:'icon-add',plain:false">添加</a> 			
		  	  <a href="javascript:deleteBatch(traffic_list_delete_url,traffic_list_datagrid);" class="easyui-linkbutton"  data-options="iconCls:'icon-remove',plain:false">删除</a>
			</div> 
	</div>
</div>
<script type="text/javascript">
	//列表DataGrid
	var traffic_list_datagrid;
	//列表DataGrid ID
	var traffic_list_datagrid_id = 'traffic_list_dg';
	//列表查询表单ID
	var traffic_list_searchform_id = 'traffic_list_searchForm';
	//列表toolbar ID
	var traffic_list_toolbar_id = 'traffic_list_toolbar';
	//操作链接
	var traffic_list_create_url =  '${ctx}/traffic/create';
	var traffic_list_update_url =  '${ctx}/traffic/update/';
	var traffic_list_delete_url =  '${ctx}/traffic/delete';
	var traffic_list_view_url =  '${ctx}/traffic/view/';
	var traffic_list_datagrid_load_url = '${ctx}/traffic/findList';
	
	//定义相关的操作按钮
	function traffic_list_actionFormatter(value,row,index){
		var str = '';	
		str += formatString(
				'<img onclick="updateForm(\'{0}\',\'traffic_form_inputForm\',traffic_list_datagrid,{title:\'编辑信息\'});" src="{1}" title="编辑"/>',
				traffic_list_update_url + row.id,
				'${ctx}/static/js/plugins/jquery-easyui-1.3.4/themes/icons/application_form_edit.png');
		str += '&nbsp;';
		str += formatString('<img onclick="deleteOne(\'{0}\',\'{1}\',traffic_list_datagrid);" src="{2}" title="删除"/>',
		                    row.id,traffic_list_delete_url,'${ctx}/static/js/plugins/jquery-easyui-1.3.4/themes/icons/application_form_delete.png');
		str += '&nbsp;';
		str += formatString(
				'<img onclick="view(\'{0}\',\'{1}\');" src="${ctx}/static/js/plugins/jquery-easyui-1.3.4/themes/icons/view.png" title="查看"/>',
				traffic_list_view_url + row.id);
		str += '&nbsp;';
		return str;
	}
	
	//DataGrid字段设置
	var traffic_list_datagrid_columns = [ [
	                    		{field : 'id',title : '编号',width : 150,checkbox : true,align:'center'},
	    	          					{field : 'message',title : '<spring:message code="traffic_message" />',width : 150,align:'center'},
			          					{field : 'headName',title : '<spring:message code="traffic_headName" />',width : 150,align:'center'},
			          	                    	{field : 'action',title : '操作',width : 80,align : 'center',formatter : traffic_list_actionFormatter} 
	                    		] ];
	/** 初始化DataGrid,加载数据 **/		
	function traffic_list_loadDataGrid(){		 
		traffic_list_datagrid = $('#'+traffic_list_datagrid_id).datagrid({
			url : traffic_list_datagrid_load_url,
			fit : true,
			border : false,
			fitColumns : true,
			singleSelect : false,
			striped : true,
			pagination : true,
			rownumbers : true,
			idField : 'id',
			pageSize : 15,
			pageList : [ 5, 10,15, 20, 30, 40, 50 ],
			columns : traffic_list_datagrid_columns,
			toolbar:'#'+traffic_list_toolbar_id,
			onLoadSuccess : function() {	
				$(this).datagrid('tooltip');
				$('#'+traffic_list_searchform_id+' table').show();
				$('#'+traffic_list_datagrid_id).show();
				$('#'+traffic_list_toolbar_id).show();
				parent. $ .messager.progress('close');
			}
		});
	}
	$ .parser.onComplete = function() {
		//加载DataGrid数据
		traffic_list_loadDataGrid();	
		//绑定按钮事件
		bindSearchBtn('traffic_list_searchBtn','traffic_list_clearBtn','traffic_list_searchForm',traffic_list_datagrid);
	};
</script>


