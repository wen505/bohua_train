<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>编辑用户</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	  <%@ include file="/view/common/taglibs.jsp"%>
	  <%@ include file="/view/common/meta_css.jsp"%>
	  <%@ include file="/view/common/meta_js.jsp"%>
	<!-- 本文件的js -->
  	<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/back/role/update_userrole.js"></script>
  	
  </head>
  
  <body style="margin: 0px;padding: 0px;">
  	<input id="roleId" value="" type="hidden"></input>
  	<!-- 赛选条件 -->
  	<div style='width:100%;height: 30px;'>
  		<table >
			<tr>
				<td width="60px">登录名:</td>
				<td width="70px"><input type="text" id="loginName" name="loginName" value="" size=20 class='easyui-input' /></td>
				<td width="60px">用户名:</td>
				<td width="70px"><input type="text" id="userName" name="userName" value="" size=20 class='easyui-input' /></td>
				<td width="70px"><a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-search'" onclick="editUser.selectClick()" id="select">查询</a></td>
				<td><span id="errormsg"></span></td>
			</tr>
		</table>
  	</div>
	<div style='width:100%;height:350px;'>
		<!-- 没有在角色下的用户 -->
		<div style='width:320px;height:300px;float: left;'>
			<table id="queryTable" border="0" data-options="title : '不属于该角色的用户'">
				<thead>
					<tr>
						<th data-options="field:'userId',align:'center',checkbox:true" scope="col" width="7%"></th>
						<th data-options="field:'userName',editor:'text'" width="20px">用户名</th>
						<th data-options="field:'loginName',editor:'text'" width="20px">登录名</th>
					</tr>
				</thead>
			</table>
		</div>
		<div style="float: left;padding-top: 150px;margin-left: 26px;" align="center">
		   <input name="" type="button" value="&gt;&gt;&gt;" onclick="editUser.addRoleUser()" class="button_bt1" />
			<br/>
			<br/>
			<input name="" type="button" value="&lt;&lt;&lt;" onclick="editUser.deleteRoleUser()" class="button_bt1"/>
		</div>
		<!-- 存在角色下的用户 -->
		<div style='width:320px;height:300px;float:right;'>
			<table id="queryTable2" border="0" data-options="title : '属于该角色的用户'">
				<thead>
					<tr>
 						<th data-options="field:'userName',editor:'text'" width="20px">用户名</th>
						<th data-options="field:'loginName',editor:'text'" width="20px">登录名</th>
					</tr>
				</thead>
			</table>
		</div>
	</div>
<div align="center" class="bottom_div" style="margin-left: 55px;">
		&nbsp;&nbsp;&nbsp;&nbsp;<a href="#" class="easyui-linkbutton" data-options="iconCls : 'icon-cancel'" id="closes" onclick="commonUtil.closedialog()">&nbsp;关闭&nbsp;</a>
		</div>
</body>
</html>
