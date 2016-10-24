/**
 * 用户查询界面js
 * @type {{isValite: boolean, realpath: null, dialog: null, init: userManager.init, selectClick: userManager.selectClick, addClickEvent: userManager.addClickEvent, updateClikEvent: userManager.updateClikEvent, update: userManager.update, add: userManager.add, userFocus: userManager.userFocus, delet: userManager.delet, editRole: userManager.editRole, resetPwd: userManager.resetPwd, resetPwdByClick: userManager.resetPwdByClick}}
 */
var userManager = {
    isValite : true,
    realpath : null,
    dialog :null,
	init : function(){
		commonUtil.init_dategrid("queryTable","用户查询", "back/user/find.do", "userId", null, "queryPart");
		// var  date= $("#permissionSession").val();
		// if(date.indexOf("resetPwd", 0)==-1){//权限控制
		// 	$('#queryTable').datagrid('hideColumn','opera');
		// }
		
	},
	//查询
	selectClick : function(){
		$('#queryTable').datagrid('load' ,{
			'loginName' : $('#loginName').val(),
			'userName' : $('#userName').val()
		 });
	},

	//删除
	delet:function(){
		commonUtil.deleteOperate("请选择要删除的用户", "back/user/delete.do", "queryTable", function(rows,customerArray){
			for (var i = 0; i < rows.length; i++) {
				 customerArray.push({'userId': rows[i].userId, 'loginName':  rows[i].loginName});
			}
		});
	},
	//分配角色
	editRole : function(){
		var rows=$('#queryTable').datagrid("getSelected");
		if(rows == null || rows == undefined||rows.length>1){
			commonUtil.showMessages("请选择一条分配角色的用户！",'提示');
			return;
		}else{
			commonUtil.openWin('view/back/user/editRole.jsp?userId='+rows.userId,"aa_11","分配角色",350,280);

		}
	},
	resetPwd : function(value,row,index){
		return commonUtil.returnStrByA('重置密码', 'userManager.resetPwdByClick("'+row.userId+'","'+row.loginName+'")');
	},
	//重置密码
	resetPwdByClick : function(userId,loginName){
		commonUtil.showConfirm('提示:','确定要操作？',function(){
			var param = {"userId":userId,"userName" :loginName};
			commonUtil.ajaxSubmit("back/user/resetPwd.do",param,function () {
				commonUtil.showMessages("重置密码失败！",'提示');
			},function (data) {
				commonUtil.showMessages("重置密码成功！",'提示');
				commonUtil.reloadtable("queryTable");
			})

		});
		
	},
	/**
	 *
	 */
	addClickEvent : function () {
          commonUtil.openWin("view/back/user/add_user.jsp","add_user","添加用户",800,400);

	},
	/**
	 *
	 */
	updateClickEvent : function () {
		var rows = commonUtil.getChecked("queryTable");
		if (rows == null || rows.length < 1 || rows.length > 1) {
			commonUtil.showMessages("请选择一条要修改的用户", "提示");
			return;
		}
		commonUtil.openWin("view/back/user/update_user.jsp","update_user","修改用户",800,400);

	}
	
};

$(function(){
	commonUtil.setpermissionbutton();
	userManager.init();
});
