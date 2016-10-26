 
/**
 * checkinfo()为js/common/common.js中的方法
 * @returns {Boolean}
 */
function check(){
    if(!commonUtil.checkinfo('errormsg',null,'roleName','请输入角色名',false)){
		 return false;
    }
   commonUtil.ajaxSubmit("back/role/insert.do",$("#myForm").serialize(),function () {
       commonUtil.checkingshowmsg(false, "添加失败！", "", "", "errormsg");
   },function (result) {
       commonUtil.successoperate("queryTable");
   });

}

