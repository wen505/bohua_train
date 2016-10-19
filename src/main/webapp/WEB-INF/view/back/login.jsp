<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="width=device-width,initial-scale=1,maximum-scale=1.0" />
    <title>Bootstrap响应式登录界面模板</title>

    <link rel="stylesheet" type="text/css" href="/static/plugin/bootstrap-3.3.5/css/bootstrap.min.css" />
    <link rel="stylesheet" type="text/css" href="/static/css/custom.css" />
    <script src="${jquery}"></script>

    <style type="text/css">
        html,body {
            height: 100%;
        }
        .box {
            filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#6699FF', endColorstr='#6699FF'); /*  IE */
            background-image:linear-gradient(bottom, #6699FF 0%, #6699FF 100%);
            background-image:-o-linear-gradient(bottom, #6699FF 0%, #6699FF 100%);
            background-image:-moz-linear-gradient(bottom, #6699FF 0%, #6699FF 100%);
            background-image:-webkit-linear-gradient(bottom, #6699FF 0%, #6699FF 100%);
            background-image:-ms-linear-gradient(bottom, #6699FF 0%, #6699FF 100%);

            margin: 0 auto;
            position: relative;
            width: 100%;
            height: 100%;
        }
        .login-box {
            width: 100%;
            max-width:500px;
            height: 400px;
            position: absolute;
            top: 50%;

            margin-top: -200px;
            /*设置负值，为要定位子盒子的一半高度*/

        }
        @media screen and (min-width:500px){
            .login-box {
                left: 50%;
                /*设置负值，为要定位子盒子的一半宽度*/
                margin-left: -250px;
            }
        }

        .form {
            width: 100%;
            max-width:500px;
            height: 275px;
            margin: 25px auto 0px auto;
            padding-top: 25px;
        }
        .login-content {
            height: 300px;
            width: 100%;
            max-width:500px;
            background-color: rgba(255, 250, 2550, .6);
            float: left;
        }


        .input-group {
            margin: 0px 0px 30px 0px !important;
        }
        .form-control,
        .input-group {
            height: 40px;
        }

        .form-group {
            margin-bottom: 0px !important;
        }
        .login-title {
            padding: 20px 10px;
            background-color: rgba(0, 0, 0, .6);
        }
        .login-title h1 {
            margin-top: 10px !important;
        }
        .login-title small {
            color: #fff;
        }

        .link p {
            line-height: 20px;
            margin-top: 30px;
        }
        .btn-sm {
            padding: 8px 24px !important;
            font-size: 16px !important;
        }
    </style>

</head>

<body>
<div class="box">
    <div class="login-box">
        <div class="login-title text-center">
            <h1><small>登录</small></h1>
        </div>
        <div class="login-content ">
            <div class="form">
                <form action="/login.html" method="post">
                    <div class="form-group">
                        <div class="col-xs-12  ">
                            <div class="input-group">
                                <span class="input-group-addon"><span class="glyphicon glyphicon-user"></span></span>
                                <input type="text" id="userName" name="userName" class="form-control" placeholder="用户名">
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-xs-12  ">
                            <div class="input-group">
                                <span class="input-group-addon"><span class="glyphicon glyphicon-lock"></span></span>
                                <input type="text" id="passWord" name="passWord" class="form-control" placeholder="密码">
                            </div>
                        </div>
                    </div>
                    <div class="form-group" style="display: none">
                        <div class="col-xs-12  ">
                            <div class="input-group">
                                <span class="input-group-addon"><span class="glyphicon glyphicon-lock"></span></span>
                                <input type="text" id="validCode" name="validCode" class="form-control" placeholder="验证码">
                            </div>
                            <div class="input-group">
                                <label for="img_captcha" class="field"></label> <img title="点击更换" id="img_captcha" onclick="javascript:refreshCaptcha();" src="servlet/captchaCode">(看不清<a href="javascript:void(0)" onclick="javascript:refreshCaptcha()">换一张</a>)
                            </div>
                        </div>
                    </div>
                    <div class="form-group form-actions">
                        <div class="col-xs-4 col-xs-offset-4 ">
                            <button type="button" class="btn btn-sm btn-info" id="loginButton"><span class="glyphicon glyphicon-off"></span> 登录</button>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-xs-6 link">
                            <p class="text-center remove-margin"><small>忘记密码？</small> <a href="javascript:void(0)" ><small>找回</small></a>
                            </p>
                        </div>
                        <div class="col-xs-6 link">
                            <p class="text-center remove-margin"><small>还没注册?</small> <a href="javascript:void(0)" ><small>注册</small></a>
                            </p>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>

<div style="text-align:center;">
    <p>来源：<a href="http://www.mycodes.net/" target="_blank">源码之家</a></p>
</div>

</body>
<script type="application/javascript">
    var _captcha_id = "#img_captcha";
    function refreshCaptcha() {
        $(_captcha_id).attr("src","servlet/captchaCode?t=" + Math.random());
    }
    $('#loginButton').click(function () {
        var queryParam = "{'";
        $(".input-group:visible input").each(function(){
            queryParam += $(this).attr("name") + "':'" + $(this).val() + "','";
        });
        $(".input-group:visible select").each(function(){
            queryParam += $(this).attr("name") + "':'" + $(this).val() + "','";
        });
        queryParam = queryParam.substring(0,(queryParam.length)-2) + "}";
        queryParam = eval("("+queryParam+")");
        $.ajax({
            type: "POST",
            url: "login.html",
            data: queryParam,
            success: function(result){
                result = JSON.parse(result);
                var code = result.code;
                if (code == 0) {
                    window.location.href = "success.html";
                }
                else if (code == 2) {
                    $('.form-group').eq(2).removeAttr('style');
                }
                else {
                    alert(result.msg);
                }
            }
        });
    });

    /*$("form").validate({
     ignore: "",
     rules:{
     userName:{
     notblank:true
     },
     passWord:{
     notblank:true
     }
     },messages:{
     provinceId:{
     notblank:"用户名不能为空"
     },
     cityId:{
     notblank:"密码不能为空"
     }
     }
     });*/
</script>
</html>