/**
 * Created by zhuyy on 2016/10/26.
 */
var addDictionary = {
    init : function () {
        
    },
    add : function(){
        if(!commonUtil.checkinfo('errormsg',null,'headerName','请输入配置名称',false)){
            return false;
        }else if(!commonUtil.checkinfo('errormsg',null,'headerCode','请输入配置代码',false)){
            return false;
        }else if(!commonUtil.checkinfo('errormsg',null,'dictionaryType','请选择配置类型',false)){
            return false;
        }else{
            $('#errormsg').empty();
        }
        commonUtil.ajaxSubmit("back/dictionary/add",$('#myForm').serialize(),function () {
            commonUtil.checkingshowmsg(false, "保存失败！", "", "", "errormsg");
        },function (data) {
            commonUtil.successoperate("queryTable");
        });

    },

    checkHeaderCode : function () {
        var headerCode = $('#headerCode').val();
        commonUtil.ajaxSubmit("back/dictionary/checkHeaderCode",{"headerCode":headerCode},function (data) {
            commonUtil.checkingshowmsg(false, data.msg, "", "", "errormsg");
        },function (data) {

        });
    }
};
$(function () {
    addDictionary.init();
});