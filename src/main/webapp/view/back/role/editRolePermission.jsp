<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>编辑角色</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="编辑角色">
     <%@ include file="/view/common/taglibs.jsp"%>
     <%@ include file="/view/common/meta_css.jsp"%>
	  <%@ include file="/view/common/meta_js.jsp"%>
	  <%@ include file="/view/common/ztree.jsp"%>
	<!-- 本文件的js -->
  	<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/back/role/update_rolepermission.js"></script>

  </head>
  
  <body>
  <input type="hidden" id="roleId" name="roleId">
  <div align="center" style="border-color: blue;height: 20px;">
				<span id="errormsg"></span>
	</div>
    <div class="" id="permissionTree" style="padding-left:1px;overflow:auto;margin-left: 1px;padding-left:1px; height: 200px; ">
		<ul id="treeDemo" class="ztree"></ul>
	</div>
	<div align="center" class="bottom_div" >
			<a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-ok'" id='save' onclick="rolePermission.updateRole()">&nbsp;保存&nbsp;</a>
		&nbsp;&nbsp;&nbsp;&nbsp;<a href="#" class="easyui-linkbutton" data-options="iconCls : 'icon-cancel'" id="closes" onclick="commonUtil.closedialog()">&nbsp;关闭&nbsp;</a>
	</div>
  </body>
</html>
