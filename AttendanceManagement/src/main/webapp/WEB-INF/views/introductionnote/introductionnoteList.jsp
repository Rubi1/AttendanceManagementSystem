<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>
<div data-options="fit:true" class="easyui-panel">
	<div class="easyui-layout" data-options="fit:true">
		<div
			data-options="region:'north',border:false,title:'查询条件',iconCls:'icon-find'"
			style="height: 65px;overflow: hidden;">
			<form id="introductionnote_list_searchForm" method="post"
				style="width:100%;overflow:hidden;">
				<table class="search_table" style="width: 100%;">
					<tr>
						    						<th><spring:message code="introductionnote_message" /></th>
						<td><input type="text" name="search_EQ_message"
							value="${ param.search_EQ_message}"
							id="search_EQ_message" /></td>   						<th><spring:message code="introductionnote_imagePath" /></th>
						<td><input type="text" name="search_EQ_imagePath"
							value="${ param.search_EQ_imagePath}"
							id="search_EQ_imagePath" /></td>      						<th style="width:20%;">&nbsp;<a href="javascript:void(0);"
							id="introductionnote_list_searchBtn">查询</a>&nbsp;<a
							href="javascript:void(0);" id="introductionnote_list_clearBtn">清空</a></th>
					</tr>
				</table>
			</form>
		</div>
		<div data-options="region:'center',border:false">
			<table id="introductionnote_list_dg" style="display: none;"></table>
		</div>
		<div id="introductionnote_list_toolbar" style="display: none;">
				<a href="javascript:updateForm(introductionnote_list_create_url,'introductionnote_form_inputForm',introductionnote_list_datagrid,{title:'新增信息'});" class="easyui-linkbutton" data-options="iconCls:'icon-add',plain:false">添加</a> 			
		  	  <a href="javascript:deleteBatch(introductionnote_list_delete_url,introductionnote_list_datagrid);" class="easyui-linkbutton"  data-options="iconCls:'icon-remove',plain:false">删除</a>
			</div> 
	</div>
</div>
<script type="text/javascript">
	//列表DataGrid
	var introductionnote_list_datagrid;
	//列表DataGrid ID
	var introductionnote_list_datagrid_id = 'introductionnote_list_dg';
	//列表查询表单ID
	var introductionnote_list_searchform_id = 'introductionnote_list_searchForm';
	//列表toolbar ID
	var introductionnote_list_toolbar_id = 'introductionnote_list_toolbar';
	//操作链接
	var introductionnote_list_create_url =  '${ctx}/introductionnote/create';
	var introductionnote_list_update_url =  '${ctx}/introductionnote/update/';
	var introductionnote_list_delete_url =  '${ctx}/introductionnote/delete';
	var introductionnote_list_view_url =  '${ctx}/introductionnote/view/';
	var introductionnote_list_datagrid_load_url = '${ctx}/introductionnote/findList';
	
	//定义相关的操作按钮
	function introductionnote_list_actionFormatter(value,row,index){
		var str = '';	
		str += formatString(
				'<img onclick="updateForm(\'{0}\',\'introductionnote_form_inputForm\',introductionnote_list_datagrid,{title:\'编辑信息\'});" src="{1}" title="编辑"/>',
				introductionnote_list_update_url + row.id,
				'${ctx}/static/js/plugins/jquery-easyui-1.3.4/themes/icons/application_form_edit.png');
		str += '&nbsp;';
		str += formatString('<img onclick="deleteOne(\'{0}\',\'{1}\',introductionnote_list_datagrid);" src="{2}" title="删除"/>',
		                    row.id,introductionnote_list_delete_url,'${ctx}/static/js/plugins/jquery-easyui-1.3.4/themes/icons/application_form_delete.png');
		str += '&nbsp;';
		str += formatString(
				'<img onclick="view(\'{0}\',\'{1}\');" src="${ctx}/static/js/plugins/jquery-easyui-1.3.4/themes/icons/view.png" title="查看"/>',
				introductionnote_list_view_url + row.id);
		str += '&nbsp;';
		return str;
	}
	
	//DataGrid字段设置
	var introductionnote_list_datagrid_columns = [ [
	                    		{field : 'id',title : '编号',width : 150,checkbox : true,align:'center'},
	    	          					{field : 'name',title : '<spring:message code="introductionnote_name" />',width : 150,align:'center'},
			          					{field : 'message',title : '<spring:message code="introductionnote_message" />',width : 150,align:'center'},
			          					{field : 'imagePath',title : '<spring:message code="introductionnote_imagePath" />',width : 150,align:'center'},
			          					{field : 'headName',title : '<spring:message code="introductionnote_headName" />',width : 150,align:'center'},
			          	                    	{field : 'action',title : '操作',width : 80,align : 'center',formatter : introductionnote_list_actionFormatter} 
	                    		] ];
	/** 初始化DataGrid,加载数据 **/		
	function introductionnote_list_loadDataGrid(){		 
		introductionnote_list_datagrid = $('#'+introductionnote_list_datagrid_id).datagrid({
			url : introductionnote_list_datagrid_load_url,
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
			columns : introductionnote_list_datagrid_columns,
			toolbar:'#'+introductionnote_list_toolbar_id,
			onLoadSuccess : function() {	
				$(this).datagrid('tooltip');
				$('#'+introductionnote_list_searchform_id+' table').show();
				$('#'+introductionnote_list_datagrid_id).show();
				$('#'+introductionnote_list_toolbar_id).show();
				parent. $ .messager.progress('close');
			}
		});
	}
	$ .parser.onComplete = function() {
		//加载DataGrid数据
		introductionnote_list_loadDataGrid();	
		//绑定按钮事件
		bindSearchBtn('introductionnote_list_searchBtn','introductionnote_list_clearBtn','introductionnote_list_searchForm',introductionnote_list_datagrid);
	};
</script>


