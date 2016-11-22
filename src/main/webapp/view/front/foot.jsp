<%--
  Created by IntelliJ IDEA.
  User: lp
  Date: 2016/11/7
  Time: 22:32
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<style type="text/css">
    #FloatMenu {display:none;position:fixed;_position:absolute;bottom:30px;_top:expression(eval(document.documentElement.scrollTop+document.documentElement.clientHeight)-230+"px");left:91%;width:70px;zoom:1;}
    #FloatMenu a#totop{background:#635448;color:#fff;display:block;width:90px;height:30px;font:normal 12px/30px 'MicroSoft Yahei';text-align:center;-webkit-transition: all 0.2s ease-in-out;-moz-transition: all 0.2s ease-in-out;-o-transition: all 0.2s ease-in-out;-ms-transition: all 0.2s ease-in-out;transition: all 0.2s ease-in-out;}
    #FloatMenu a#totop:hover {background:#ff6100;}
</style>

<div id="FloatMenu">
    <a id="totop" href="javascript:;">回到顶部</a>

</div>
<!--底部-->
<a name="foot"></a>
<!--底部-->
<div class="foot">
    <div class="foot_all">
        <div class="foot_left">
            <div class="foot_left_one">
                <ul class="ul_clear">
                    <li class="foot_left_one_li" style="color:#fff; margin-top:-7px; margin-left:6px;">学院介绍</li>
                    <li class="foot_left_one_li" style="margin-top:4px;"><a style="color:#9A9EA7;"
                                                                            href="production.html">关于学院</a></li>
                    <li class="foot_left_one_li">服务条款</li>
                    <li class="foot_left_one_li">隐私保护</li>
                    <li class="foot_left_one_li"><a style="color:#9A9EA7;" href="#foot">联系我们</a></li>
                </ul>
            </div>
            <div class="foot_left_two">
                <ul>
                    <li class="foot_left_two_li" style="color:#fff; margin-top:-5px; margin-left:21px;">课程介绍</li>
                    <li class="foot_left_two_li" style="margin-top:5px;"><a style="color:#9A9EA7;" href="#center_title">了解课程</a>
                    </li>
                    <li class="foot_left_two_li"><a style="color:#9A9EA7;" href="production.html">学院优势</a></li>
                    <li class="foot_left_two_li"><a style="color:#9A9EA7;" href="teachers.html">师资力量</a></li>
                </ul>
            </div>
            <div class="foot_left_three">
                <ul>
                    <li class="foot_left_three_li" style="margin-left:21px; color:#fff; margin-top:-6px;">如何报名</li>
                    <li class="foot_left_three_li" style="margin-top:5px; margin-left:20px;  margin-top:6px;"><a
                            style="color:#9A9EA7;" href="#foot">报名</a></li>
                </ul>
            </div>
        </div>
        <div class="foot_right">
            <p style="  color:#fff; font-size:14px;">联系我们</p>
            <p style=" color:#fff; font-size:29px;"><img src="${pageContext.request.contextPath}/static/img/front/call.png"
                                                         style=" margin-bottom:-3px; margin-right:10px;"/>400-000-0000
            </p>
            <p style=" color:#9A9EA7; font-size:14px;">传真：0991-15026085265</p>
            <p style=" color:#9A9EA7; font-size:14px; margin-top:-6px;">联系电话：15026085265</p>
            <p style=" color:#9A9EA7; font-size:14px; line-height:20px; margin-top:1px;">学院地址：XXX</p>
        </div>
    </div>
</div>
<script type="text/javascript">
    $(window).scroll(function () {
        if($(window).scrollTop()>1000){
            $("#FloatMenu").show();
        }else{
            $("#FloatMenu").hide();
        }

    });
    $("#FloatMenu").click(function () {
        $('body').animate({ scrollTop: 0 }, 1000);
        return false;
    }) ;

</script>