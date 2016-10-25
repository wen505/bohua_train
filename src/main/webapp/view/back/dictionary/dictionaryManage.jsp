<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
  <head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <title>字典配置</title>
	  <%@ include file="/view/common/taglibs.jsp"%>
	  <%@ include file="/view/common/meta_css.jsp"%>
	  <%@ include file="/view/common/back_main_ui_comm.jsp"%>
	<!-- 本文件对象 -->
<%--
	<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/back/user/userManager.js"></script>
--%>
  </head>
  
  <body style='margin: 0px;padding: 0px;'>
  <!-- 	<div style='width:1200px;height:430px' id='queryDiv'> -->
		<table id="queryTable" width="100%" border="1" cellpadding="0" cellspacing="0" class="" data-options="onClickRow: dictionaryManager.onClickRow">
			<thead>
				<tr>
					<th data-options="align:'center',checkbox:true"scope="col" width="10%"></th>
					<th data-options="field:'headerName',editor:'text'" >配置名称</th>
					<th data-options="field:'headerCode',editor:'text'" >配置代码</th>
					<th data-options="field:'dictionaryType',editor:'text'" >配置类型</th>
					<th data-options="field:'dictionaryType',editor:'text'" >备注</th>
				</tr>
			</thead>
		</table>
 <!--	</div> -->
	<div id="queryPart">
		<table border="0">
			<tr>
				<td>配置名称:</td>
				<td><input type="text" id="headerName" name="headerName" value="" class="easyui-input" size=20 /></td>
				<td>配置代码:</td>
				<td><input type="text" id="headerCode" name="headerCode" value="" class="easyui-input" size=20 /></td>
				<td>配置类型:</td>
				<td><input type="text" id="dictionaryType" name="dictionaryType" value="" class="easyui-input" size=20 /></td>
				<td><a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-search'" onclick="dictionaryManager.selectClick()" id="select">查询</a></td>
			</tr>
		</table>
		<div style='' align="right">
			<a href="#" class="easyui-linkbutton" iconCls="icon-add" id="showDictionaryDetail"  style="display: none;"  onclick="dictionaryManager.addClickEvent()"  plain="true" title="编辑行配置">编辑行配置</a>
			<a href="#" class="easyui-linkbutton" iconCls="icon-edit" id="addDictionary"  style="display: none;"  onclick="dictionaryManager.addClickEvent()"  plain="true" title="添加配置">添加配置</a>
			<a href="#" class="easyui-linkbutton" iconCls="icon-edit" id="updateDictionary"  style="display: none;" onclick="dictionaryManager.updateClickEvent()"  plain="true" title="修改配置">修改配置</a>
			<a href="#" class="easyui-linkbutton" iconCls="icon-cancel" id="deleteDictionary"   style="display: none;"  onclick="dictionaryManager.delet()"  plain="true" title="删除配置">删除配置</a>
		</div>
	</div>

</body>
</html>
