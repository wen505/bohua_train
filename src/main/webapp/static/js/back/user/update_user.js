var update_user={
    initUi : function () {
        var row = commonUtil.getParentWindows().commonUtil
            .getSelect("queryTable");
        $('#loginName').val(row.loginName);
        $('#userName').val(row.userName);
        $('#sex').combobox("setValue", row.sex);
        $('#userType').combobox("setValue", row.userType);
        $('#telephone').val(row.telephone);
        $('#email').val(row.email);
        $('#indentity').val(row.indentity);
        $('#address').text(commonUtil.checkNull(row.address));
        $('#userId').val(row.userId);
        $('#educationalStatus').text(row.educationalStatus);

    },
    /**
     * 修改用户信息
     * @returns {Boolean}
     */    update : function(){
        if(!commonUtil.checkinfo('errormsg',null,'loginName','请输入登录名',false)){
            return false;
        }else if(!commonUtil.checkinfo('errormsg',null,'userName','请输入姓名',false)){
            return false;
        }else if(!commonUtil.checkinfo('errormsg',mobilephonereg,'telephone','请输入电话',false)){
            return false;
        }else{
            $('#errormsg').empty();
        }
        commonUtil.ajaxSubmit("back/user/update.do",$('#myForm').serialize(),function () {
            commonUtil.checkingshowmsg(false, "保存失败！", "", "", "errormsg");
        },function (date) {
            commonUtil.successoperate("queryTable");
        });

    }
};
$(function () {
    update_user.initUi();
});