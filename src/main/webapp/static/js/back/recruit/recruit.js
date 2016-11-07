/**
 * 初始化eayui组件
 */
$(function() {
	commonUtil.setpermissionbutton();
	recruitManager.init();
});

var recruitManager = {
	init : function() {
		recruitManager.intiUI();
	},
	intiUI : function() {
		commonUtil.init_dategrid("table", "招聘列表","back/recruit/find.do", "recruitId", {
			
		}, "toolbar");
		

	},
	/**
	 * 查询
	 */
	selectClick : function() {
		$("#table").datagrid("load", {
			"recruitJob" : $("#recruitJob").val(),
		});
	},
	/**
	 * 添加
	 */
	add : function() {
		commonUtil.openWin("view/back/recruit/add_recruit.jsp", "add", "添加招聘", 1600,
				600);
	},
	/**
	 * 下架
	 */
	delet : function() {
		commonUtil.deleteOperate("请选择要下架的招聘", "back/recruit/delete.do", "table", function(rows,customerArray){
			for (var i = 0; i < rows.length; i++) {
				customerArray.push({
					'recruitId' : rows[i].recruitId,
					'recruitName' : rows[i].recruitName
				});
			}
		});
	},
	/**
	 * 修改
	 */
	update : function() {
		var rows = commonUtil.getChecked("table");
		if (rows == null || rows.length < 1 || rows.length > 1) {
			commonUtil.showMessages("请选择一条要修改的招聘", "提示");
			return;
		}
		commonUtil.openWin("view/back/recruit/update_recruit.jsp",
				'editrecruit', '修改招聘信息', 1600,
			600);
	}

	
};
