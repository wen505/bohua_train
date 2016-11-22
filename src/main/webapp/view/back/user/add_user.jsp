<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>新增用户</title>
	<%@ include file="/view/common/taglibs.jsp"%>
	<%@ include file="/view/common/meta_css.jsp"%>
	<%@ include file="/view/common/meta_js.jsp"%>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/static/js/back/user/add_user.js"></script>
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
					<td class="tab_style">登录名：</td>
					<td class="tab_input"><input name="loginName"
						id="loginName" type="text" size=20
						class="easyui-input" onblur="add_user.checkLoginName()" /></td>
					<td class="tab_style">姓名：</td>
					<td class="tab_input"><input name="userName"
						id="userName" type="text"  size=20
						class="easyui-input" /></td>
				</tr>
				<tr>
					<td class="tab_style">性别：</td>
					<td><select class="easyui-combobox"
								name="sex" id="sex" style="width:150px;">
						<option value="1">男</option>
						<option value="2">女</option>
					</select></td>
					<td class="tab_style">电话：</td>
					<td class="tab_input"><input name="telephone"
												 id="telephone" type="text"  size=20
												 class="easyui-input" /></td>
				</tr>
				<tr>
					<td class="tab_style">身份证号：</td>
					<td class="tab_input"><input name="indentity"
												 id="indentity" type="text" size=20
												 class="easyui-input" /></td>
					<td class="tab_style">员工职位：</td>
					<td class="tab_input"><input name="userType"
												 id="userType" type="text"  size=20
												 class="easyui-combobox" data-options="panelHeight:'120px',valueField:'id',textField:'text',url:'${pageContext.request.contextPath}/back/common/getSelectData?headerCode=userType'" /></td>
				</tr><tr>
				<td class="tab_style">学历：</td>
				<td class="tab_input"><input name="educationalStatus"
											 id="educationalStatus" type="text" size=20
											 class="easyui-input" /></td>
				<td class="tab_style">邮箱：</td>
				<td class="tab_input"><input name="email"
											 id="email" type="text"  size=20
											 class="easyui-input" /></td>
			</tr>
				<tr>
					<td class="tab_style">家庭地址：</td>
					<td colspan="3"><textarea name="address" style="width: 464px;height: 63px;"
																	id="address" size=80 class='textarea_css'></textarea>
				</td>
				</tr>

			</table>
			<div align="center" class="bottom_div">
				<a href="javascript:void(0)" class="easyui-linkbutton"
					data-options="iconCls:'icon-ok'" id='addButton'
					onclick="add_user.add()">&nbsp;保存&nbsp;</a>
				&nbsp;&nbsp;&nbsp;&nbsp;<a href="#" class="easyui-linkbutton"
					data-options="iconCls : 'icon-cancel'" id="closes"
					onclick="commonUtil.closedialog()">&nbsp;关闭&nbsp;</a>
			</div>
		</div>
	</form>
</body>
</html>