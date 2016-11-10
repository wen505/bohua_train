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
	<!-- 上传图片js -->
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/plugin/uploadPreview/main.css"></link>
	<script type="text/javascript"
			src="${pageContext.request.contextPath}/static/plugin/uploadPreview/jquery.form.js"></script>
	<script type="text/javascript"
			src="${pageContext.request.contextPath}/static/plugin/uploadPreview/uploadPreview.min.js"></script>

<script type="text/javascript"
	src="${pageContext.request.contextPath}/static/js/back/notice/update_notice.js"></script>
	<script>
		window.onload = function() {
			new uploadPreview({
				UpBtn : "file",
				DivShow : "imgdiv",
				ImgShow : "picurl",
				callback : function(){
					$("#errormsg").empty();
					var img = new Image();
					img.src = $("#picurl").attr("src");
					img.onload = function() {
						var imgWidth =  img.width;// 宽度缩放比例
						var imgHeight = img.height;// =高度缩放比例
						var size =img.fileSize;
						$("#isChangeImg").val('true');//是否改变了图片
						/*if(imgWidth==750&&imgHeight==396){
						 $("#isimage").val('true');//是否上传了图片
						 }else{
						 commonUtil.checkingshowmsg(false, "请选750X396规格的图片", "", "", "errormsg");
						 $("#isimage").val('');//是否上传了图片
						 $("#picurl").attr("src",commonUtil.getRealpath()+"/static/img/upload.png");
						 }*/
					};


				}

			});
		}
	</script>
</head>
<body style="margin: 0px;padding: 0px;" onunload="noticeoperate.onbeforeClose()">
<form id="myForm"  method="post"
	  enctype="multipart/form-data"
	  action="" onsubmit="return update_notice.upload(this);">
	<input type="hidden" name="isimage" id="isimage">
	<input type="hidden" name="nextImageUrl" id="nextImageUrl">
	<input type="hidden" name="noticeId" id="noticeId">
	<input type="hidden" name="isChangeImg" id="isChangeImg">
	<input type="hidden" name="isUpload" id="isUpload">
	<input type="hidden" name="imageUrl" id="imageUrl">
	<input type="hidden" name="isSave" id="isSave">
	<div align="center" style="border-color: blue;height: 20px;">
		<span id="errormsg"></span>
	</div>
	<div style="margin-left: 20px;">
		<div>
			<span>公告标题:</span>
					<span><input type="text" id="noticeName" name="noticeName"
								 value="" style="width: 400px" class="easyui-input" /></span>
		</div>
		<div style="margin-top: 11px;" id="imgDiv">
			<img
					src="${pageContext.request.contextPath}/static/img/upload.png"
					style="width: 480px;height: 155px;" alt="公告照片" id="picurl" /> <a
				href="javascript:;" class="a-upload" style="position: relative;
    display: inline-block;
    cursor: pointer;
    background: #00b7ee;
    padding: 10px 15px;
    color: #fff;
    text-align: center;
    border-radius: 3px;
    overflow: hidden;"> <input type="file"
															 id="file" name="file" />上传图片
		</a>
		</div>
		<div style="margin-top: 11px;">
			<script id="editor" type="text/plain" style="width:99%;height:300px;"></script>
		</div>

	</div>


</form>
<script type="text/javascript"
		src="${pageContext.request.contextPath}/static/js/back/notice/noticeoperate.js"></script>
<div align="center" class="bottom_div" style="z-index: 999">
	<a href="javascript:void(0)" class="easyui-linkbutton"
	   data-options="iconCls:'icon-ok'" id='addButton'
	   onclick="update_notice.submit() ">&nbsp;保存&nbsp;</a>
	&nbsp;&nbsp;&nbsp;&nbsp;<a href="#" class="easyui-linkbutton"
							   data-options="iconCls : 'icon-cancel'" id="closes"
							   onclick="commonUtil.closedialog()">&nbsp;关闭&nbsp;</a>
</div>
</body>
</html>