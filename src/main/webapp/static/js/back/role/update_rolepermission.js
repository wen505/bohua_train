$(function() {
	rolePermission.init();
});
var rolePermission = {
	init : function() {
		rolePermission.initTree();
	},
	initTree : function() {
		var id = commonUtil.getQueryString("roleId");
		var params = {
			"roleId" : id
		};
		$('#roleId').val(id);
		commonUtil.ajaxSubmit("back/role/findRolePermission.do",params,function () {
			commonUtil.showMessages("加载失败。", "提示!");
		},function (result) {
			commonUtil.initztree("treeDemo", result.data, true,
				false, false,  {"Y" : "ps", "N" : "s" });
		});

	},
	/**
	 * 修改角色权限
	 */
	updateRole : function() {
		var treeObj = $.fn.zTree.getZTreeObj("treeDemo");
	     var nodes = treeObj.getCheckedNodes(true);
	     var customerArray = new Array();
	     for(var i=0;i<nodes.length;i++){
	    	 customerArray.push({'roleId': $('#roleId').val(), 'permissionId':  nodes[i].id});
	    }
	     commonUtil.submitList("back/role/updateRolePermission.do?roleId="+$('#roleId').val(),customerArray,function () {
			 $("#errormsg").html("<font color='red'>编辑失败！</font>");
		 },function () {
			 commonUtil.closedialog();
		 });

	}
};
