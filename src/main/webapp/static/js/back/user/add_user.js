var add_user={
      
    /**
     * 修改用户信息
     * @returns {Boolean}
     */
    add : function(){
        if(!commonUtil.checkinfo('errormsg',null,'loginName','请输入登录名',false)){
            return false;
        }else if(hanzireg.test($("#loginName").val())){
            commonUtil.checkingshowmsg(false, "不支持汉字输入", "", "loginName", "errormsg");
            return false;
        }else if(!commonUtil.checkinfo('errormsg',null,'userName','请输入姓名',false)){
            return false;
        }else if(!commonUtil.checkinfo('errormsg',mobilephonereg,'telephone','请输入电话',false)){
            return false;
        }else{
            $('#errormsg').empty();
        }
        commonUtil.ajaxSubmit("back/user/insert.do",$('#myForm').serialize(),function () {
            commonUtil.checkingshowmsg(false, "保存失败！", "", "", "errormsg");
        },function (date) {
            commonUtil.successoperate("queryTable");
        });

    },/**
     * 验证用户名是否存在
     */
    checkLoginName : function() {
        var loginName = $("#loginName").val();
        if (!commonUtil.checkinfo('errormsg',null,'loginName','请输入登录名',false)) {
            commonUtil.checkingshowmsg(false, "请输入登录名！", "", "loginName", "errormsg");
            return false;
        }
        commonUtil.ajaxSubmit("back/user/isLoginName.do", {"loginName": loginName}, function () {
            commonUtil.checkingshowmsg(false, "登录名已经存在！", "", "loginName", "errormsg");
        }, function () {
            $('#errormsg').html('');
            return true;
        });
    }
};
