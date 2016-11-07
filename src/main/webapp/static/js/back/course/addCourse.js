/**
 * Created by ruanhua on 2016/11/06.
 */
var addCourse = {
    init : function () {

    },
    add : function(){
        if(!commonUtil.checkinfo('errormsg',null,'classType','请输入课程类型',false)){
            return false;
        }else if(!commonUtil.checkinfo('errormsg',null,'className','请输入课程名称',false)){
            return false;
        }else{
            $('#errormsg').empty();
        }
        commonUtil.ajaxSubmit("back/course/add",$('#myForm').serialize(),function () {
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