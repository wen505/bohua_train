<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>新增角色</title>
	<%@ include file="/view/common/taglibs.jsp"%>
	<%@ include file="/view/common/meta_css.jsp"%>
	<%@ include file="/view/common/meta_js.jsp"%>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/static/js/back/role/add_role.js"></script>
</head>

<body>
	<form action="" method="post" target="mainFrame" id="myForm">
		<div id="td" style='margin-left: 10px'>
			<div align="center" style="border-color: blue;height: 20px;">
				<span id="errormsg"></span>
			</div>
			<table width="94%" border="0" cellpadding="1" cellspacing="2"
				class="tab_2">
				<tr>
					<td class="tab_style">角色名：</td>
					<td class="tab_input"><input name="roleName"
						id="roleName" type="text"  style="width: 264px;"
						class="easyui-input" /></td>
				<tr>
			</tr>
				<tr>
					<td class="tab_style">备注：</td>
					<td ><textarea name="memo"  style="width: 264px;height: 63px;"
																	ID="MEMO" SIZE=80 CLASS='TEXTAREA_CSS'></TEXTAREA>
				</td>
				</tr>

			</table>
			<div align="center" class="bottom_div">
				<a href="javascript:void(0)" class="easyui-linkbutton"
					data-options="iconCls:'icon-ok'" id='addButton'
					onclick="check()">&nbsp;保存&nbsp;</a>
				&nbsp;&nbsp;&nbsp;&nbsp;<a href="#" class="easyui-linkbutton"
					data-options="iconCls : 'icon-cancel'" id="closes"
					onclick="commonUtil.closedialog()">&nbsp;关闭&nbsp;</a>
			</div>
		</div>
	</form>
</body>
</html>