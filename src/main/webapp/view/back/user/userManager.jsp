<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
  <head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"></meta>
    <title>用户管理</title>
	  <%@ include file="/view/common/taglibs.jsp"%>
	  <%@ include file="/view/common/meta_css.jsp"%>
	  <%@ include file="/view/common/back_main_ui_comm.jsp"%>
	<!-- 本文件对象 -->
	<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/back/user/userManager.js"></script>
  </head>
  
  <body style='margin: 0px;padding: 0px;'>
  <!-- 	<div style='width:1200px;height:430px' id='queryDiv'> -->
		<table id="queryTable" width="100%" border="1" cellpadding="0" cellspacing="0" class="" data-options="onClickRow: userManager.onClickRow">
			<thead>
				<tr>
					<th data-options="field:'userId',align:'center',checkbox:true"scope="col" width="7%"></th>
					<th data-options="field:'loginName',editor:'text'" width="40%">登录名称</th>
					<th data-options="field:'userName',editor:'text'" width="30%">用户名</th>
					<th data-options="field:'opera',editor:'text'" formatter="userManager.resetPwd" width="20%">操作</th>
				</tr>
			</thead>
		</table>
 <!--	</div> -->
	<div id="queryPart">
		<table border="0">
			<tr>
				<td>登录名:</td>
				<td><input type="text" id="loginName" name="loginName" value="" class="easyui-input" size=20 /></td>
				<td>用户名:</td>
				<td><input type="text" id="userName" name="userName" value="" class="easyui-input" size=20 /></td>
				<td><a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-search'" onclick="userManager.selectClick()" id="select">查询</a></td>
			</tr>
		</table>
		<div style='' align="right">
		<a href="#" class="easyui-linkbutton" iconCls="icon-add" id="addUser"  style="display: none;"  onclick="userManager.addClickEvent()"  plain="true" title="添加">添加</a>
			<a href="#" class="easyui-linkbutton" iconCls="icon-edit" id="editRole"  style="display: none;"  onclick="userManager.editRole()"  plain="true" title="分配角色">分配角色</a>
			 <a href="#" class="easyui-linkbutton" iconCls="icon-edit" id="updateUser"  style="display: none;" onclick="userManager.updateClickEvent()"  plain="true" title="修改用户">修改用户</a>
			<a href="#" class="easyui-linkbutton" iconCls="icon-cancel" id=""   style="display: none;"  onclick="userManager.delet()"  plain="true" title="删除">删除</a>

		</div>
	</div>

</body>
</html>
