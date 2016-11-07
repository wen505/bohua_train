<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>

<title>招聘管理</title>
	<%@ include file="/view/common/taglibs.jsp"%>
	<%@ include file="/view/common/meta_css.jsp"%>
	<%@ include file="/view/common/back_main_ui_comm.jsp"%>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/static/js/back/recruit/recruit.js"></script>
</head>
<body style="padding: 1px">
	<form action="" method="post" id="myform">
		<div id="toolbar">
			<span>招聘名称：</span><input name="recruitJob" id="recruitJob"
				type="text" size=20 class="easyui-input" />
			 <a href="javascript:void(0)" class="easyui-linkbutton"
				data-options="iconCls:'icon-search'"
				onclick="recruitManager.selectClick()" id="select" title="查找招聘">查找</a>
			<div style='' align="right">
				<a href="#" class="easyui-linkbutton" iconCls="icon-add"
					id="addsrecruit" style="display: none;"
					onclick="recruitManager.add()" plain="true" title="添加招聘">添加</a> <a
					href="#" class="easyui-linkbutton" iconCls="icon-edit"
					id="updaterecruit" style="display: none;"
					onclick="recruitManager.update()" plain="true" title="修改招聘">修改</a>
				<a href="#" class="easyui-linkbutton" iconCls="icon-cancel"
					id="delrecruit" style="display: none;"
					onclick="recruitManager.delet()" plain="true" title="下架招聘">删除</a>
			</div>
		</div>
	</form>
	<table id="table" width="100%" border="0" cellpadding="0"
		cellspacing="0" class="tab">
		<thead>
			<tr align="center">
				<th data-options="field:'recruitId',align:'center',checkbox:true"
					scope="col" width="7%"></th>
				<th data-options="field:'recruitJob',align:'center'" scope="col"
					width="50%">招聘职位</th>
				<th data-options="field:'sn',align:'center'" scope="col"
					width="20%">排序</th>
				<th data-options="field:'releaseTime',align:'center'" scope="col"
					width="20%">发布时间</th>
			</tr>
		</thead>
	</table>
</body>
</html>
