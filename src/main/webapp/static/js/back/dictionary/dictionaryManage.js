/**
 * 字典配置
 * @type {{isValite: boolean, realpath: null, dialog: null, init: dictionaryManager.init, selectClick: dictionaryManager.selectClick, delet: dictionaryManager.delet, addClickEvent: dictionaryManager.addClickEvent, updateClickEvent: dictionaryManager.updateClickEvent}}
 */
var dictionaryManager = {
    isValite : true,
    realpath : null,
    dialog :null,
    init : function(){
        commonUtil.init_dategrid("queryTable","字典查询", "back/dictionary/find", "headerCode", null, "queryPart");
    },
    //查询
    selectClick : function(){
        $('#queryTable').datagrid('load' ,{
            'loginName' : $('#headerName').val(),
            'userName' : $('#headerCode').val(),
            'dictionaryType' : $('#dictionaryType').val()
        });
    },

    //删除
    delet:function(){
        commonUtil.deleteOperate("请选择要删除的字典配置", "back/dictionary/delete", "queryTable", function(rows,customerArray){
            for (var i = 0; i < rows.length; i++) {
                customerArray.push({'headerCode': rows[i].headerCode});
            }
        });
    },

    /**
     *
     */
    addClickEvent : function () {
        commonUtil.openWin("view/back/dictionary/addDictionary.jsp","add_dictionary","添加字典",800,400);

    },
    /**
     *
     */
    updateClickEvent : function () {
        commonUtil.openWin("view/back/dictionary/updateDictionary.jsp","update_dictionary","修改字典",800,400);

    },

    typeFormatter : function (value,row,index) {
        if(value == 'user'){
            return '自定义';
        }
        else if(value == 'system'){
            return '系统';
        }
    }

};

$(function(){
    commonUtil.setpermissionbutton();
    dictionaryManager.init();
});

