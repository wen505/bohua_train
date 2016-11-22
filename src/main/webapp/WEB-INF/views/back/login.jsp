<%@ page session="false" %>
<%@ page contentType="text/html;charset=utf-8"%>
<%@ include file="common/taglibs.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <link rel="stylesheet" href="<c:url value='/static/css/home.css'/>" type="text/css" media="all" />
    <script src="${ctx}/static/js/jquery-2.1.1.min.js"></script>
    <font class="titleFont"/>
    <title>博华后台管理系统</title>
</head>
<body class="logon">
<form name="fm" action="/back/login" method="post">

    <table width="100%" height="100%" border="0" cellpadding="0" cellspacing="0">
        <tr>
            <td height="20" background="${ctx}/static/img/login/bglogontop_2.gif"></td>
        </tr>

        <tr>
            <td class="bg" >
                <table width="669" border="0" cellspacing="0" cellpadding="0" style="margin: auto;">
                <tr>
                    <td height="55">　　<img src="${ctx}/static/img/login/imglogonlogo.gif" ></td>
                </tr>
                <tr>
                    <td valign="top" class="centerbg"><table width="290" border="0" cellspacing="0" cellpadding="0">
                        <tr>
                            <td height="35"><input class="input_w w_22" maxlength="10" type="text" name="userName"  id="userName"  maxlength="10" tabindex="1"/></td>
                            <td rowspan="2" ><input type="image" name="loginButton" id="loginButton" src="${ctx}/static/img/login/btn_login.gif" tabindex="3"/></td>
                        </tr>
                        <tr>
                            <td height="35"><span class="username">
                            <input class="input_w w_22" type="password"  maxlength="25" name="password" id="password" tabindex="2"/>
                            </span> </td>
                        </tr>
                    </table>
                    </td>
                </tr>

            </table>
            </td>
        </tr>

        <tr>
            <td class="copyright">技术支持 博华艺术工作室信息技术部  </td>
        </tr>
    </table>
</form>
</body>

<script language="javascript">
    $('#loginButton').click(function () {
        var queryParam = "{'";
        $(".centerbg:visible input").each(function(){
            queryParam += $(this).attr("name") + "':'" + $(this).val() + "','";
        });
        queryParam = queryParam.substring(0,(queryParam.length)-2) + "}";
        queryParam = eval("("+queryParam+")");
        $.ajax({
            type: "POST",
            url: contextRootPath+"/back/login.do",
            data: queryParam,
            dataType : "json",
//            async : true,
            success: function(result){
                var code = result.code;
                if (code == '1') {
                    window.location.href = "home";
                }
                else if (code == '2') {
                    /*$('.form-group').eq(2).removeAttr('style');*/
                    alert(result.msg);
                }
                else {
                    alert(result.msg);
                }
            }
        });
    });
</script>

</html>