/**
 * 初始化eayui组件
 */
$(function() {

	commonUtil.setpermissionbutton();
	permission.init();
});

var permission = {
	init : function() {
		permission.intiUI();
		permission.initTree();
	},
	intiUI : function() {
		commonUtil.init_dategrid("queryTable", "权限列表", "null", "permissionId", {
			"parentId" : "0"
		}, "queryPart");
		

	},
	onTreeClick : function(event, treeId, treeNode) {
		$("#selectPermissionId").val(treeNode.id);
		$("#queryTable").datagrid("options").url=commonUtil.getRealpath()+"/back/permission/find.do";
		$("#queryTable").datagrid("load", {
			"parentId" : treeNode.id
		});
		
	},
	initTree : function(callback){
		commonUtil.ajaxSubmit("back/permission/selectPermissionTree.do",null,function () {

		},function (result) {
			commonUtil.initztree("treeDemo", result.data, false, false,
				false, {}, null, {
					onClick : permission.onTreeClick
				});
			if (typeof callback === "function"){
				callback();
			}
		});

	},
	
	selectTreeNode : function(){
		var treeObj = $.fn.zTree.getZTreeObj("treeDemo");
		var selectNode=$("#selectPermissionId").val();
		var nodes=treeObj.getNodeByParam("id", selectNode, null);
		treeObj.selectNode(nodes);
	},
	/**
	 * 刷新树
	 */
	reloadTree : function(){
		$.fn.zTree.destroy("treeDemo");
		permission.initTree(permission.selectTreeNode);
	},
	/**
	 * 查询
	 */
	selectClick : function() {
		$("#queryTable").datagrid("options").url=commonUtil.getRealpath()+"/back/permission/find.do"
		$("#queryTable").datagrid("load", {
			"permissionName" : $("#permissionName").val(),
			"permissionType" : $("#permissionType").combo("getValue")
		});
	},
	/**
	 * 添加事件
	 */
	addClickEvnt : function() {
		commonUtil.openWin("view/back/permission/add_permission.jsp", "add", "添加权限", 700,
				428);
	},
	/**
	 * 删除操作
	 */
	delet : function() {
		commonUtil.deleteOperate("请选择要删除的权限", "back/permission/delete.do", "queryTable", function(rows,customerArray){
			for (var i = 0; i < rows.length; i++) {
				customerArray.push({
					'permissionId' : rows[i].permissionId,
					'permissionName' : rows[i].permissionName
				});
			}
		},function (rows) {
			var treeObj = $.fn.zTree.getZTreeObj("treeDemo");
			for (var i = 0; i < rows.length; i++) {
				var nodes=treeObj.getNodeByParam("id", rows[i].permissionId, null);
				treeObj.removeNode(nodes);
			}
		},"如果所选权限有下级权限将拒绝删除，是否继续操作？");

	},
	/**
	 * 修改事件
	 */
	updateClickEvnt : function() {
		var rows = commonUtil.getChecked("queryTable");
		if (rows == null || rows.length < 1 || rows.length > 1) {
			commonUtil.showMessages("请选择一条要修改的权限", "提示");
			return;
		}
		commonUtil.openWin("view/back/permission/update_permission.jsp",
				'editpermisssion', '修改权限信息', 700, 428);
	},

	formatter : function(value, row, index) {
		if (value == 'button') {
			return "按钮";
		} else {
			return "菜单";
		}
	}
};
