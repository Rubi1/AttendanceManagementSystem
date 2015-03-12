<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>
<div data-options="fit:true" class="easyui-panel">
	<div class="easyui-layout" data-options="fit:true">
		<div
			data-options="region:'north',border:false,title:'查询条件',iconCls:'icon-find'"
			style="height: 65px;overflow: hidden;">
			<form id="specialfood_list_searchForm" method="post"
				style="width:100%;overflow:hidden;">
				<table class="search_table" style="width: 100%;">
					<tr>
						    						<th><spring:message code="specialfood_message" /></th>
						<td><input type="text" name="search_EQ_message"
							value="${ param.search_EQ_message}"
							id="search_EQ_message" /></td>   						<th><spring:message code="specialfood_imagePath" /></th>
						<td><input type="text" name="search_EQ_imagePath"
							value="${ param.search_EQ_imagePath}"
							id="search_EQ_imagePath" /></td>    						<th style="width:20%;">&nbsp;<a href="javascript:void(0);"
							id="specialfood_list_searchBtn">查询</a>&nbsp;<a
							href="javascript:void(0);" id="specialfood_list_clearBtn">清空</a></th>
					</tr>
				</table>
			</form>
		</div>
		<div data-options="region:'center',border:false">
			<table id="specialfood_list_dg" style="display: none;"></table>
		</div>
		<div id="specialfood_list_toolbar" style="display: none;">
				<a href="javascript:updateForm(specialfood_list_create_url,'specialfood_form_inputForm',specialfood_list_datagrid,{title:'新增信息'});" class="easyui-linkbutton" data-options="iconCls:'icon-add',plain:false">添加</a> 			
		  	  <a href="javascript:deleteBatch(specialfood_list_delete_url,specialfood_list_datagrid);" class="easyui-linkbutton"  data-options="iconCls:'icon-remove',plain:false">删除</a>
			</div> 
	</div>
</div>
<script type="text/javascript">
	//列表DataGrid
	var specialfood_list_datagrid;
	//列表DataGrid ID
	var specialfood_list_datagrid_id = 'specialfood_list_dg';
	//列表查询表单ID
	var specialfood_list_searchform_id = 'specialfood_list_searchForm';
	//列表toolbar ID
	var specialfood_list_toolbar_id = 'specialfood_list_toolbar';
	//操作链接
	var specialfood_list_create_url =  '${ctx}/specialfood/create';
	var specialfood_list_update_url =  '${ctx}/specialfood/update/';
	var specialfood_list_delete_url =  '${ctx}/specialfood/delete';
	var specialfood_list_view_url =  '${ctx}/specialfood/view/';
	var specialfood_list_datagrid_load_url = '${ctx}/specialfood/findList';
	
	//定义相关的操作按钮
	function specialfood_list_actionFormatter(value,row,index){
		var str = '';	
		str += formatString(
				'<img onclick="updateForm(\'{0}\',\'specialfood_form_inputForm\',specialfood_list_datagrid,{title:\'编辑信息\'});" src="{1}" title="编辑"/>',
				specialfood_list_update_url + row.id,
				'${ctx}/static/js/plugins/jquery-easyui-1.3.4/themes/icons/application_form_edit.png');
		str += '&nbsp;';
		str += formatString('<img onclick="deleteOne(\'{0}\',\'{1}\',specialfood_list_datagrid);" src="{2}" title="删除"/>',
		                    row.id,specialfood_list_delete_url,'${ctx}/static/js/plugins/jquery-easyui-1.3.4/themes/icons/application_form_delete.png');
		str += '&nbsp;';
		str += formatString(
				'<img onclick="view(\'{0}\',\'{1}\');" src="${ctx}/static/js/plugins/jquery-easyui-1.3.4/themes/icons/view.png" title="查看"/>',
				specialfood_list_view_url + row.id);
		str += '&nbsp;';
		return str;
	}
	
	//DataGrid字段设置
	var specialfood_list_datagrid_columns = [ [
	                    		{field : 'id',title : '编号',width : 150,checkbox : true,align:'center'},
	    	          					{field : 'headName',title : '<spring:message code="specialfood_headName" />',width : 150,align:'center'},
			          					{field : 'message',title : '<spring:message code="specialfood_message" />',width : 150,align:'center'},
			          					{field : 'imagePath',title : '<spring:message code="specialfood_imagePath" />',width : 150,align:'center'},
			          	                    	{field : 'action',title : '操作',width : 80,align : 'center',formatter : specialfood_list_actionFormatter} 
	                    		] ];
	/** 初始化DataGrid,加载数据 **/		
	function specialfood_list_loadDataGrid(){		 
		specialfood_list_datagrid = $('#'+specialfood_list_datagrid_id).datagrid({
			url : specialfood_list_datagrid_load_url,
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
			columns : specialfood_list_datagrid_columns,
			toolbar:'#'+specialfood_list_toolbar_id,
			onLoadSuccess : function() {	
				$(this).datagrid('tooltip');
				$('#'+specialfood_list_searchform_id+' table').show();
				$('#'+specialfood_list_datagrid_id).show();
				$('#'+specialfood_list_toolbar_id).show();
				parent. $ .messager.progress('close');
			}
		});
	}
	$ .parser.onComplete = function() {
		//加载DataGrid数据
		specialfood_list_loadDataGrid();	
		//绑定按钮事件
		bindSearchBtn('specialfood_list_searchBtn','specialfood_list_clearBtn','specialfood_list_searchForm',specialfood_list_datagrid);
	};
</script>


