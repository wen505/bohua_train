<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>

<title>公告管理</title>
	<%@ include file="/view/common/taglibs.jsp"%>
	<%@ include file="/view/common/meta_css.jsp"%>
	<%@ include file="/view/common/back_main_ui_comm.jsp"%>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/static/js/back/notice/notice.js"></script>
</head>
<body style="padding: 1px">
	<form action="" method="post" id="myform">
		<div id="toolbar">
			<span>公告名称：</span><input name="noticeName" id="noticeName"
				type="text" size=20 class="easyui-input" />
			 <a href="javascript:void(0)" class="easyui-linkbutton"
				data-options="iconCls:'icon-search'"
				onclick="noticeManager.selectClick()" id="select" title="查找公告">查找</a>
			<div style='' align="right">
				<a href="#" class="easyui-linkbutton" iconCls="icon-add"
					id="addsnotice" style="display: none;"
					onclick="noticeManager.add()" plain="true" title="添加公告">添加</a> <a
					href="#" class="easyui-linkbutton" iconCls="icon-edit"
					id="updatenotice" style="display: none;"
					onclick="noticeManager.update()" plain="true" title="修改公告">修改</a>
				<a href="#" class="easyui-linkbutton" iconCls="icon-cancel"
					id="delnotice" style="display: none;"
					onclick="noticeManager.delet()" plain="true" title="下架公告">下架</a>
			</div>
		</div>
	</form>
	<table id="table" width="100%" border="0" cellpadding="0"
		cellspacing="0" class="tab">
		<thead>
			<tr align="center">
				<th data-options="field:'noticeId',align:'center',checkbox:true"
					scope="col" width="7%"></th>
				<th data-options="field:'noticeName',align:'center'" scope="col"
					width="50%">公告名称</th>
				<th data-options="field:'addTime',align:'center'" scope="col"
					width="20%">发布时间</th>
				<th data-options="field:'releaseUserName',align:'center'" scope="col"
					width="20%">发布人</th>
			</tr>
		</thead>
	</table>
</body>
</html>
