<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta content="telephone=no" name="format-detection">
<!--针对数字默认为电话号码-->
<meta name="HandheldFriendly" content="true">
<!--针对老的不识别的浏览器，比如黑莓-->
<meta name="MobileOptimized" content="320">
<!--针对微软老式浏览器-->
<meta name="viewport"
	content="width=device-width,initial-scale=1.0,maximum-scale=1.0,user-scalable=no">
<title>公告详情</title>
<link href="${pageContext.request.contextPath}/static/css/front/main.css" rel="stylesheet" type="text/css"/>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/common/jquery-1.8.2.min.js"></script>
<style type="text/css">
*{
	margin: 0px auto;
	padding: -1px;
	list-style-type: none;
}

#title .notie_header {
	font-size: 30px;
	font-weight: 700;
	line-height: 42px;
	color: #444;
}
#contents {
    line-height: 2.3rem;
}
</style>
</head>

<body>
<!--顶部-->
<%@ include file="/view/front/top.jsp"%>
<div style="width:100%; height:350px; background:url(${pageContext.request.contextPath}/static/img/front/little_logo.jpg);">

</div>
 <input type="hidden" id="realpath" value="${pageContext.request.contextPath}"/>
	<div id="box">
		<div id="title">
			<div class="title_box" align="center">
				<p class="notie_header">${notice.noticeName}</p>
			</div>
			<div id="header_all" style="display: inline-block;width: 100%">
				<div class="CompanyName"
					style="font-size: 15px;
				    display: inline-block;
				    color: #666666;float: right;margin-right: 22px;">发布时间：${addTime}</div>
			</div>

		</div>
		<div id="contents" >
			<div id="content_text">
				<div class="my-gallery" data-pswp-uid="1" >${notice.noticeContent}</div>
			</div>
		</div>



	</div>
</body>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/plugin/photoswipe/jquery.lazyload.js"></script>
 <script type="text/javascript">
  $(document).ready(function($){
	  var realpath=$("#realpath").val();
	  $("img").lazyload({
	  placeholder:realpath+"/static/plugin/photoswipe/grey.gif", //加载图片前的占位图片
	  effect:"fadeIn" //加载图片使用的效果(淡入)
	  });
	  });
  </script>
<%@ include file="/view/front/foot.jsp"%>
</html>
