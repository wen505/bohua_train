var editUser = {
	init : function() {
		var row = commonUtil.getParentWindows().commonUtil.getChecked("queryTable");
		var roleId = row[0].roleId;
		$('#roleId').val(roleId);
		//根据角色查询多少个用户
		commonUtil.init_dategrid("queryTable2", "已经配置此角色的用户", "back/role/findUserByRoleId.do", "userId", {
			"roleId" : roleId
		}, "queryPart", true, false,false);
		
		commonUtil.init_dategrid("queryTable", "没有配置此角色的用户",  "back/role/findNotUserByRoleId.do", "userId", {
			"roleId" : roleId
		}, "queryPart");
	},
	//箭头右
	addRoleUser : function() {
		var row = commonUtil.getChecked("queryTable");
		if (row.length <= 0) {
//			commonUtil.showMessages("请选择用户！", '提示');
			return;
		}
		var customerArray = new Array();
		for (var i = 0; i < row.length; i++) {
			customerArray.push({
				'roleId' : $('#roleId').val(),
				'userId' : row[i].userId
			});
		}
		commonUtil.submitList("back/role/insertRoleAndUserId.do",customerArray,function () {
			$("#errormsg").html("<font color='red'>操作失败！</font>");
		},function () {
			editUser.addUserRow();
		});

	},
	//箭头左
	deleteRoleUser : function() {
		var row = $("#queryTable2").datagrid("getChecked");
		if (row.length <= 0) {
//			commonUtil.showMessages("请选择用户！", '提示');
			return;
		}
		var userIds = "";
		for (var i = 0; i < row.length; i++) {
			if (i != row.length - 1) {
				userIds = userIds + row[i].userId + ",";
			} else {
				userIds = userIds + row[i].userId;
			}
		}
		var param = {
			"userIds" : userIds,
			"roleId" : $('#roleId').val()
		};
		commonUtil.ajaxSubmit("back/role/deleteRoleAndUserId.do",param,function () {
			commonUtil.showMessages("操作失败！", '提示');
		},function () {
			editUser.deleteUserRow();
		});
	},
	selectClick : function() {
		$("#queryTable").datagrid({
			queryParams : {
				"loginName" : $('#loginName').val(),
				"username" : $('#username').val(),
				"roleId" : $('#roleId').val()
			}
		});
	},
	/**
	 * 删除用户
	 */
	deleteUserRow : function(){
		var selectrows=$('#queryTable2').datagrid("getSelected");
		if(selectrows!=null){
			var camareid=selectrows.userId;
			var selectindex = $('#queryTable2').datagrid("getRowIndex",camareid);
			$('#queryTable2').datagrid("deleteRow",selectindex);
			$('#queryTable').datagrid("appendRow",selectrows);
			editUser.deleteUserRow();
		}else{
			return ;
		}
		
	},
	/**
	 * 添加用户
	 */
	addUserRow : function(){
		var selectrows=$('#queryTable').datagrid("getSelected");
		if(selectrows!=null){
			var userId=selectrows.userId;
			var selectindex = $('#queryTable').datagrid("getRowIndex",userId);
			$('#queryTable').datagrid("deleteRow",selectindex);
			$('#queryTable2').datagrid("appendRow",selectrows);
			editUser.addUserRow();
		}else{
			return;
		}
	},
};

$(function() {
	editUser.init();
});