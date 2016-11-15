<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>加入我们</title>
    <%@ include file="/view/common/taglibs.jsp"%>
    <%@ include file="/view/common/front_css.jsp"%>
    <%@ include file="/view/common/front_js.jsp"%>

</head>

<body>
<!--顶部-->
<%@ include file="/view/front/top.jsp"%>
<div style="width:100%; height:350px; background:url(${pageContext.request.contextPath}/static/img/front/little_logo.jpg);">

</div>
<div class="ddiv">
    <div class="teacher_center" >
        <h1>加入我们</h1>
        <hr color="#46474C" class="hra" style="width:80px;" size="1"/>
        <hr color="#BAC9C6" class="hrb" style="margin-left:188px;" size="1"/>
        <div style="height:100%;">
            <c:forEach var="bhRecruit" items="${bhRecruits}" step="1">
                <h4 style="margin-left:103px; font-family:'微软雅黑'; font-size:18px; margin-top:20px;">${bhRecruit.recruitJob}</h4>
                <ul style="list-style:none; margin-left:120px;line-height:30px; font-family:'微软雅黑'; font-size:17px; margin-top:20px;">
                   ${bhRecruit.jobDuty}
                </ul>
                <h4 style="margin-left:103px; font-family:'微软雅黑'; font-size:18px; font-weight:100; margin-top:20px;">
                    任职资格</h4>
                <ul style="list-style:none; margin-left:120px; line-height:30px; font-family:'微软雅黑'; font-size:17px; margin-top:20px;">
                        ${bhRecruit.jobRequest}
                </ul>
            </c:forEach>
            <h4 style="margin-left:503px; font-family:'微软雅黑'; font-size:18px; font-weight:100; margin-top:20px;">
                地址：XXX</h4>
            <h4 style="margin-left:583px; font-family:'微软雅黑'; font-size:18px; font-weight:100; margin-top:10px;">
                联系电话：15026085265 张欢老师(固定电话定下来再报)</h4>
        </div>

    </div>
</div>

<%@ include file="/view/front/foot.jsp"%>


</body>
</html>
