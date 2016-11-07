<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>新增用户</title>
	<%@ include file="/view/common/taglibs.jsp"%>
	<%@ include file="/view/common/meta_css.jsp"%>
	<%@ include file="/view/common/meta_js.jsp"%>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/static/js/back/course/addCourse.js"></script>
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
					<td class="tab_style">课程类型：</td>
					<td class="tab_input"><input name="classType" id="classType" type="text" size=20 class="easyui-input"/></td>
					<td class="tab_style">课程名称：</td>
					<td class="tab_input"><input name="className"id="className" type="text"  size=20 class="easyui-input" /></td>
				</tr>
				<tr>
					<td class="tab_style">是否开课：</td>
					<td>
						<select class="easyui-combobox" name="isStart" id="isStart" style="width:150px;">
							<option value="Y">是</option>
							<option value="N">否</option>
						</select>
					</td>
					<td class="tab_style">课时：</td>
					<td class="tab_input"><input name="classHour" id="classHour" type="text"  size=20 class="easyui-input" /></td>
				</tr>
				<tr>
					<td class="tab_style">收费标准：</td>
					<td class="tab_input"><input name="chargingStandard" id="chargingStandard" type="text" size=20 class="easyui-input" /></td>
					<td class="tab_style">学员类型：</td>
					<td class="tab_input"><input name="studentType" id="studentType" type="text"  size=20 class="easyui-input" /></td>
				</tr>
				<tr>
					<td class="tab_style">人数：</td>
					<td class="tab_input"><input name="peopleNum" id="peopleNum" type="text" size=20 class="easyui-input" /></td>
					<td class="tab_style"></td>
					<td class="tab_input"></td>
				</tr>
				<tr>
					<td class="tab_style">课程说明：</td>
					<td colspan="3"><textarea name="description" style="width: 464px;height: 63px;"
																	id="description" size=80 class='textarea_css'></textarea>
					</td>
				</tr>

			</table>
			<div align="center" class="bottom_div">
				<a href="javascript:void(0)" class="easyui-linkbutton"
					data-options="iconCls:'icon-ok'" id='addButton'
					onclick="addCourse.add()">&nbsp;保存&nbsp;</a>
				&nbsp;&nbsp;&nbsp;&nbsp;<a href="#" class="easyui-linkbutton"
					data-options="iconCls : 'icon-cancel'" id="closes"
					onclick="commonUtil.closedialog()">&nbsp;关闭&nbsp;</a>
			</div>
		</div>
	</form>
</body>
</html>