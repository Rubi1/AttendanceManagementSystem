<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>
<div data-options="fit:true" class="easyui-panel">
	<div class="easyui-layout" data-options="fit:true">
		<div
			data-options="region:'north',border:false,title:'查询条件',iconCls:'icon-find'"
			style="height: 65px;overflow: hidden;">
			<form id="specialbuy_list_searchForm" method="post"
				style="width:100%;overflow:hidden;">
				<table class="search_table" style="width: 100%;">
					<tr>
						    						<th><spring:message code="specialbuy_imagePath" /></th>
						<td><input type="text" name="search_EQ_imagePath"
							value="${ param.search_EQ_imagePath}"
							id="search_EQ_imagePath" /></td>   						<th><spring:message code="specialbuy_message" /></th>
						<td><input type="text" name="search_EQ_message"
							value="${ param.search_EQ_message}"
							id="search_EQ_message" /></td>    						<th style="width:20%;">&nbsp;<a href="javascript:void(0);"
							id="specialbuy_list_searchBtn">查询</a>&nbsp;<a
							href="javascript:void(0);" id="specialbuy_list_clearBtn">清空</a></th>
					</tr>
				</table>
			</form>
		</div>
		<div data-options="region:'center',border:false">
			<table id="specialbuy_list_dg" style="display: none;"></table>
		</div>
		<div id="specialbuy_list_toolbar" style="display: none;">
				<a href="javascript:updateForm(specialbuy_list_create_url,'specialbuy_form_inputForm',specialbuy_list_datagrid,{title:'新增信息'});" class="easyui-linkbutton" data-options="iconCls:'icon-add',plain:false">添加</a> 			
		  	  <a href="javascript:deleteBatch(specialbuy_list_delete_url,specialbuy_list_datagrid);" class="easyui-linkbutton"  data-options="iconCls:'icon-remove',plain:false">删除</a>
			</div> 
	</div>
</div>
<script type="text/javascript">
	//列表DataGrid
	var specialbuy_list_datagrid;
	//列表DataGrid ID
	var specialbuy_list_datagrid_id = 'specialbuy_list_dg';
	//列表查询表单ID
	var specialbuy_list_searchform_id = 'specialbuy_list_searchForm';
	//列表toolbar ID
	var specialbuy_list_toolbar_id = 'specialbuy_list_toolbar';
	//操作链接
	var specialbuy_list_create_url =  '${ctx}/specialbuy/create';
	var specialbuy_list_update_url =  '${ctx}/specialbuy/update/';
	var specialbuy_list_delete_url =  '${ctx}/specialbuy/delete';
	var specialbuy_list_view_url =  '${ctx}/specialbuy/view/';
	var specialbuy_list_datagrid_load_url = '${ctx}/specialbuy/findList';
	
	//定义相关的操作按钮
	function specialbuy_list_actionFormatter(value,row,index){
		var str = '';	
		str += formatString(
				'<img onclick="updateForm(\'{0}\',\'specialbuy_form_inputForm\',specialbuy_list_datagrid,{title:\'编辑信息\'});" src="{1}" title="编辑"/>',
				specialbuy_list_update_url + row.id,
				'${ctx}/static/js/plugins/jquery-easyui-1.3.4/themes/icons/application_form_edit.png');
		str += '&nbsp;';
		str += formatString('<img onclick="deleteOne(\'{0}\',\'{1}\',specialbuy_list_datagrid);" src="{2}" title="删除"/>',
		                    row.id,specialbuy_list_delete_url,'${ctx}/static/js/plugins/jquery-easyui-1.3.4/themes/icons/application_form_delete.png');
		str += '&nbsp;';
		str += formatString(
				'<img onclick="view(\'{0}\',\'{1}\');" src="${ctx}/static/js/plugins/jquery-easyui-1.3.4/themes/icons/view.png" title="查看"/>',
				specialbuy_list_view_url + row.id);
		str += '&nbsp;';
		return str;
	}
	
	//DataGrid字段设置
	var specialbuy_list_datagrid_columns = [ [
	                    		{field : 'id',title : '编号',width : 150,checkbox : true,align:'center'},
	    	          					{field : 'headName',title : '<spring:message code="specialbuy_headName" />',width : 150,align:'center'},
			          					{field : 'imagePath',title : '<spring:message code="specialbuy_imagePath" />',width : 150,align:'center'},
			          					{field : 'message',title : '<spring:message code="specialbuy_message" />',width : 150,align:'center'},
			          	                    	{field : 'action',title : '操作',width : 80,align : 'center',formatter : specialbuy_list_actionFormatter} 
	                    		] ];
	/** 初始化DataGrid,加载数据 **/		
	function specialbuy_list_loadDataGrid(){		 
		specialbuy_list_datagrid = $('#'+specialbuy_list_datagrid_id).datagrid({
			url : specialbuy_list_datagrid_load_url,
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
			columns : specialbuy_list_datagrid_columns,
			toolbar:'#'+specialbuy_list_toolbar_id,
			onLoadSuccess : function() {	
				$(this).datagrid('tooltip');
				$('#'+specialbuy_list_searchform_id+' table').show();
				$('#'+specialbuy_list_datagrid_id).show();
				$('#'+specialbuy_list_toolbar_id).show();
				parent. $ .messager.progress('close');
			}
		});
	}
	$ .parser.onComplete = function() {
		//加载DataGrid数据
		specialbuy_list_loadDataGrid();	
		//绑定按钮事件
		bindSearchBtn('specialbuy_list_searchBtn','specialbuy_list_clearBtn','specialbuy_list_searchForm',specialbuy_list_datagrid);
	};
</script>


