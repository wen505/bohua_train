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
        if(!commonUtil.checkinfo('errormsg',null,'headerName','请输入配置名称',false)){
            return false;
        }else if(!commonUtil.checkinfo('errormsg',null,'headerCode','请输入配置代码',false)){
            return false;
        }else if(!commonUtil.checkinfo('errormsg',null,'dictionaryType','请选择配置类型',false)){
            return false;
        }else{
            $('#errormsg').empty();
        }
        commonUtil.ajaxSubmit("back/dictionary/update",$('#myForm').serialize(),function (data) {
            commonUtil.checkingshowmsg(false, data.msg, "", "", "errormsg");
        },function (data) {
            commonUtil.successoperate("queryTable");
        });

    }
};
$(function () {
    updateDictionary.init();
});