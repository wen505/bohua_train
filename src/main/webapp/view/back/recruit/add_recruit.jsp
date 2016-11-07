<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<!DOCTYPE HTML>
<html>
<head>
<title></title>
<meta http-equiv="Content-Type" content="text/html;charset=utf-8" />
	<%@ include file="/view/common/taglibs.jsp"%>
	<%@ include file="/view/common/meta_css.jsp"%>
	<%@ include file="/view/common/meta_js.jsp"%>
	<%@ include file="/view/common/kindeditor.jsp"%>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/static/js/back/recruit/add_recruit.js"></script>

</head>
<body style="margin: 0px;padding: 0px;">
<form id="myForm"  method="post"
	  action=""  >
		<div align="center" style="border-color: blue;height: 20px;">
			<span id="errormsg"></span>
		</div>
        <div style="margin-left: 20px;">
			<div>
				<span>招聘职位:</span>
					<span><input type="text" id="recruitJob" name="recruitJob"
								 value="" style="width: 200px" class="easyui-input" /></span>
				&nbsp;	&nbsp;	&nbsp;	&nbsp;
				<span>排序:</span>
					<span><input type="text" id="sn" name="sn"
								 value="" style="width: 200px" class="easyui-input" /></span>
			</div>
			<span style="margin-top: 11px;">职位责任:</span>
			<div>
						<textarea id="job_duty" name="content" style="width:99%;height:250px;">

						</textarea>
			</div>
			<span style="margin-top: 11px;">任职资格:</span>
			<div>
						<textarea id="job_request" name="content" style="width:99%;height:250px;">

						</textarea>
			</div>

		</div>


	</form>
	<script type="text/javascript"
			src="${pageContext.request.contextPath}/static/js/back/recruit/recruitoperate.js"></script>
	<div align="center" class="bottom_div">
		<a href="javascript:void(0)" class="easyui-linkbutton"
			data-options="iconCls:'icon-ok'" id='addButton'
			onclick="add_recruit.add() ">&nbsp;保存&nbsp;</a>
		&nbsp;&nbsp;&nbsp;&nbsp;<a href="#" class="easyui-linkbutton"
			data-options="iconCls : 'icon-cancel'" id="closes"
			onclick="commonUtil.closedialog()">&nbsp;关闭&nbsp;</a>
	</div>
</body>
</html>