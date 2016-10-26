/**
 */
$(function() {
	commonUtil.setpermissionbutton();
	roleManager.init();
});

var roleManager ={
	   init : function(){
			commonUtil.init_dategrid("queryTable", "", "back/role/find.do", "roleId", null, "queryPart");
		},
	   delRole : function(){
			commonUtil.deleteOperate("请选择要删除的角色", "back/role/delte.do", "queryTable", function(rows,customerArray){
				for (var i = 0; i < rows.length; i++) {
					 customerArray.push({'roleId': rows[i].roleId, 'roleName':  rows[i].roleName});
				}
			});


		},
	   findRole : function(){
			$("#queryTable").datagrid('load',{
				"roleName" : $("#roleName").val()
			});
		},
	/**
	 * 添加用户事件
	 */
	   addClickEvent:function(){
			commonUtil.openWin('view/back/role/add_role.jsp', "addRole", "添加角色", 400, 285);
		},
	/**
	 * 修改角色事件
	 */
	   updateClickEvent : function(){
			var rows=commonUtil.getChecked("queryTable");
			if(rows == null || rows == undefined||rows.length<=0){
				commonUtil.showMessages('请选择一条要修改的角色！', '提示:');
				return;
			}else{
				commonUtil.openWin('view/back/role/update_role.jsp', "updateRole", "修改角色信息", 400, 285);
			}
		},
	  /**
	  * 编辑角色权限事件
	  */
	   editRolePermission : function(){
			var rows=commonUtil.getChecked("queryTable");
			if(rows == null || rows == undefined||rows.length<=0){
				commonUtil.showMessages('请选择一条的角色！', '提示:');
				return;
			}else{
				commonUtil.openWin('view/back/role/editRolePermission.jsp?roleId='
						+ rows[0].roleId, "addRole", "编辑角色权限", 400, 285);
			}
		},
    /**
	 * 编辑用户角色事件
	 */
	   editUserRole : function(){
			var rows=commonUtil.getChecked("queryTable");
			if(rows == null || rows == undefined||rows.length<=0){
				commonUtil.showMessages('请选择一条角色！', '提示:');
				return;
			}else{
				commonUtil.openWin( 'view/back/role/update_userrole.jsp?roleId='
						+ rows[0].roleId, "addRole", "编辑角色用户信息", 750, 390);
			}
		}
		
};

