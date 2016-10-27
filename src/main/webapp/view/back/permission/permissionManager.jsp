<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>权限管理</title>
	<%@ include file="/view/common/taglibs.jsp"%>
	<%@ include file="/view/common/meta_css.jsp"%>
	<%@ include file="/view/common/back_main_ui_comm.jsp"%>
	<%@ include file="/view/common/ztree.jsp"%>

<!-- 本文件对象 -->
<script type="text/javascript"
	src="${pageContext.request.contextPath}/static/js/back/permission/permission.js"></script>
</head>

<body style="padding: 0px;margin: 0px;width: 100% ; height: 100%"
	class="easyui-layout">
	<input type="hidden" id="selectPermissionId" />
	<div data-options="region:'west',title:' 权限结构',collapsible:false"
		style="width:250px;">
		<ul id="treeDemo" class="ztree" style='float: left;'></ul>
	</div>
	<div data-options="region:'center',split:true" id='cc'>
		<div id="queryPart">
			<table>
				<tr>
					<td>权限名称:</td>
					<td><input type="text" id="permissionName"
						name="permissionName" value="" class="easyui-input" size=20 /></td>
					<td>权限类型：</td>
					<td><select id="permissionType" class="easyui-combobox" name="permissionType" style="width:200px;">
					      <option value="">&nbsp;</option>   
					    <option value="menu">菜单</option>   
					    <option value="button">按钮</option>   
						</select> 
					</td>
					<td><a href="javascript:void(0)" class="easyui-linkbutton"
						data-options="iconCls:'icon-search'"
						onclick="permission.selectClick()" id="select">查询</a></td>
				</tr>
			</table>
			<div style='' align="right">
				<a href="#" class="easyui-linkbutton" iconCls="icon-add"
					id="addPermission"
					onclick="permission.addClickEvnt()" plain="true" title="添加">添加</a> <a
					href="#" class="easyui-linkbutton" iconCls="icon-edit"
					id="updatePermission" style="display: none;"
					onclick="permission.updateClickEvnt()" plain="true" title="修改">修改</a> <a
					href="#" class="easyui-linkbutton" iconCls="icon-cancel"
					id="deletePermission" style="display: none;"
					onclick="permission.delet()" plain="true" title="删除">删除</a>
			</div>
		</div>
		<table id="queryTable" border="0" cellpadding="0" cellspacing="0"
			class="">
			<thead>
				<tr align="center">
					<th data-options="field:'permissionId',align:'center',checkbox:true"
						scope="col" width="7%"></th>
					<th data-options="field:'permissionName',align:'center'"
						scope="col" width="20%">权限名称</th>
					<th data-options="field:'url',align:'center'" scope="col"
						width="20%">URL</th>
					<th data-options="field:'permissionCode',align:'center'"
						scope="col" width="20%">权限代码</th>
					<th data-options="field:'permissionType',align:'center'"
						scope="col" width="10%" formatter=permission.formatter>权限类型</th>
					<th data-options="field:'permissionSn',align:'center'"
						scope="col" width="5%" >排序</th>
					<th data-options="field:'description',align:'center'"
						scope="col" width="21s%" >说明</th>
				</tr>
			</thead>
		</table>
	</div>
</body>
</html>
