var add_user={
    /**
     * 添加用户信息
     * @returns {Boolean}
     */
    add : function(){
        if(!commonUtil.checkinfo('errormsg',null,'loginName','请输入登录名',false)){
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
            commonUtil.showmsg(true,date.msg,"添加成功！",null,"errormsg","queryTable");
        });

    },
    /**
     * 验证登陆名是否存在
     */
    checkLoginName : function (){
        var loginName=$('#loginName').val();
        if(loginName==null || loginName==""){
            return;
        }
        var params={"loginName":loginName};
        commonUtil.ajaxSubmit("back/user/isLoginName.do",params,function () {
            commonUtil.checkingshowmsg(false, "登陆名已存在！", "", "loginName", "errormsg");
        },function (date) {
            $("#errormsg").empty();
        });

    }
};
