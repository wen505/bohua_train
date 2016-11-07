<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
  <head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"></meta>
    <title>角色管理</title>
	  <%@ include file="/view/common/taglibs.jsp"%>
	  <%@ include file="/view/common/meta_css.jsp"%>
	  <%@ include file="/view/common/back_main_ui_comm.jsp"%>
	<!-- 本文件对象 -->
	<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/back/role/role.js"></script>
  </head>
  
  <body style='margin: 0px;padding: 0px;'>
  <table id="queryTable" width="100%" border="1" cellpadding="0" cellspacing="0" class="">
	  <thead>
	  <tr>
		  <th data-options="field:'roleId',align:'center',checkbox:true"scope="col" width="7%"></th>
		  <th data-options="field:'roleName',editor:'text'" width="37%">角色名</th>
		  <th data-options="field:'memo',editor:'text'" width="45%">备注</th>

	  </tr>
	  </thead>
  </table>
 <!--	</div> -->
	<div id="queryPart">
		<table border="0">
			<tr>
				<td><input type="text" id="roleName" name="roleName" value="" class="easyui-input" size=20 /></td>
				<td><a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-search'" onclick="roleManager.findRole()" id="select">查询</a></td>
			</tr>
		</table>
		<div style='' align="right">
		<a href="#" class="easyui-linkbutton" iconCls="icon-add" id="addcRole"  style="display: none;"  onclick="roleManager.addClickEvent()"  plain="true" title="添加">添加</a>
			<a href="#" class="easyui-linkbutton" iconCls="icon-edit" id="editRoleUser"  style="display: none;"  onclick="roleManager.editUserRole()"  plain="true" title="分配角色">分配用户</a>
			 <a href="#" class="easyui-linkbutton" iconCls="icon-edit" id="updateUser"  style="display: none;" onclick="roleManager.updateClickEvent()"  plain="true" title="修改角色">修改角色</a>
			<a href="#" class="easyui-linkbutton" iconCls="icon-edit" id="editRolePermission"  style="display: none;" onclick="roleManager.editRolePermission()"  plain="true" title="编辑权限">编辑权限</a>
			<a href="#" class="easyui-linkbutton" iconCls="icon-cancel" id="delRole"   style="display: none;"  onclick="roleManager.delRole()"  plain="true" title="删除">删除</a>

		</div>
	</div>

</body>
</html>
