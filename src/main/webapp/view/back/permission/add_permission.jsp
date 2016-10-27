<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>新增权限</title>
	<%@ include file="/view/common/taglibs.jsp"%>
	<%@ include file="/view/common/meta_css.jsp"%>
	<%@ include file="/view/common/meta_js.jsp"%>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/static/js/back/permission/add_permission.js"></script>
</head>

<body>
	<form action="" method="post" target="mainFrame" id="myForm">
		<input type="hidden" name="parentId" id="parentId" />
		<div id="td" style='margin-left: 10px'>
			<div align="center" style="border-color: blue;height: 20px;">
				<span id="errormsg"></span>
			</div>
			<table width="94%" border="0" cellpadding="1" cellspacing="2"
				class="tab_2">
				<tr>
					<td class="tab_style">权限名：</td>
					<td class="tab_input"><input name="permissionName"
						id="permissionName" type="text"  size=20
						class="easyui-input" /></td>
					<td class="tab_style">权限代码：</td>
					<td class="tab_input"><input name="permissionCode"
						id="permissionCode" type="text"
						onblur="add_perimssion.checkPermissionCode()" size=20
						class="easyui-input" /></td>
				</tr>
				<tr>
					<td class="tab_style">URL：</td>
					<td class="tab_input"><input name="url" id="url" type="text"
						 size=20 class="easyui-input" /></td>
					<td class="tab_style">排序号：</td>
					<td class="tab_input"><input name="permissionSn"
						id="permissionSn" type="text"size=20
						class="easyui-input" /></td>
				</tr>
				<tr>
					<td class="tab_style">权限类型：</td>
					<td><select class="easyui-combobox"
						name="permissionType" id="permissionType" style="width:150px;">
							<option value="menu">菜单</option>
							<option value="button">按钮</option>
					</select></td>
					<td>父权限名称:</td>
					<td><input type="text" id="parentName" name="parentName"
						value="" class="easyui-input readyOnly_css" readonly="readonly"
						size=20 class='easyui-input' /></td>
				</tr>
				<tr>
					<td class="tab_style">权限说明：</td>
					<td colspan="3"><textarea name="description" style="width: 464px;height: 63px;"
							id="description"  class='textarea_css'></textarea></td>
				</tr>
				<tr>
					<td class="tab_style">备注：</td>
					<td colspan="3"><textarea name="memo" style="width: 464px;height: 63px;"
							id="memo" size=80 class='textarea_css'></textarea></td>
				</tr>
			</table>
			<div align="center" class="bottom_div">
				<a href="javascript:void(0)" class="easyui-linkbutton"
					data-options="iconCls:'icon-ok'" id='addButton'
					onclick="add_perimssion.add()">&nbsp;保存&nbsp;</a>
				&nbsp;&nbsp;&nbsp;&nbsp;<a href="#" class="easyui-linkbutton"
					data-options="iconCls : 'icon-cancel'" id="closes"
					onclick="commonUtil.closedialog()">&nbsp;关闭&nbsp;</a>
			</div>
		</div>
	</form>
</body>
</html>