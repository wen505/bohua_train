/**
 * Created by zhuyy on 2016/10/26.
 */
var updateDictionary = {
  
    init : function () {
        var row = commonUtil.getParentWindows().commonUtil.getSelect("queryTable");
        $('#headerName').val(row.headerName);
        $('#headerCode').val(row.headerCode);
        $('#dictionaryType').combobox("setValue", row.dictionaryType);
        $('#memo').text(commonUtil.checkNull(row.memo));
    },
    update : function () {
        if(!commonUtil.checkinfo('errormsg',null,'classType','请输入课程类型',false)){
            return false;
        }else if(!commonUtil.checkinfo('errormsg',null,'className','请输入课程名称',false)){
            return false;
        }else{
            $('#errormsg').empty();
        }
        commonUtil.ajaxSubmit("back/course/update",$('#myForm').serialize(),function (data) {
            commonUtil.checkingshowmsg(false, data.msg, "", "", "errormsg");
        },function (data) {
            commonUtil.successoperate("queryTable");
        });

    }
};
$(function () {
    updateDictionary.init();
});