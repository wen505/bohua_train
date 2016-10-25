<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
  <head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"></meta>
    <title>课程管理</title>
	  <%@ include file="/view/common/taglibs.jsp"%>
	  <%@ include file="/view/common/meta_css.jsp"%>
	  <%@ include file="/view/common/back_main_ui_comm.jsp"%>
	<!-- 本文件对象 -->
	<script type="text/javascript" src="${ctx}/static/js/back/course/courseManager.js"></script>
  </head>
  
  <body style='margin: 0px;padding: 0px;'>
  <!-- 	<div style='width:1200px;height:430px' id='queryDiv'> -->
		<table id="queryTable" width="100%" border="1" cellpadding="0" cellspacing="0" class="" data-options="onClickRow: courseManager.onClickRow">
			<thead>
				<tr>
					<th data-options="field:'userId',align:'center',checkbox:true"scope="col" width="7%"></th>
					<th data-options="field:'loginName',editor:'text'" width="20%">课程类型</th>
					<th data-options="field:'userName',editor:'text'" width="20%">课程名称</th>
                    <th data-options="field:'sex',editor:'text'" formatter="commonUtil.sexFormatter" width="60%">课程说明</th>
				</tr>
			</thead>
		</table>
 <!--	</div> -->
	<div id="queryPart">
		<table border="0">
			<tr>
				<td>课程类型:</td>
				<td><input type="text" id="classType" name="classType" value="" class="easyui-input" size=20 /></td>
				<td>课程名:</td>
				<td><input type="text" id="className" name="className" value="" class="easyui-input" size=20 /></td>
				<td><a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-search'" onclick="courseManager.selectClick()" id="select">查询</a></td>
			</tr>
		</table>
		<div style='' align="right">
			<a href="#" class="easyui-linkbutton" iconCls="icon-add" id="addCourse"  style="display: none;"  onclick="courseManager.addClickEvent()"  plain="true" title="添加">添加</a>
			<a href="#" class="easyui-linkbutton" iconCls="icon-edit" id="updateCourse"  style="display: none;" onclick="courseManager.updateClickEvent()"  plain="true" title="编辑">编辑课程</a>
			<a href="#" class="easyui-linkbutton" iconCls="icon-cancel" id="delCourse"   style="display: none;"  onclick="courseManager.delet()"  plain="true" title="删除">删除</a>

		</div>
	</div>

</body>
</html>
