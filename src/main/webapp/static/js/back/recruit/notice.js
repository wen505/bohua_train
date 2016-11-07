/**
 * 初始化eayui组件
 */
$(function() {
	commonUtil.setpermissionbutton();
	noticeManager.init();
});

var noticeManager = {
	init : function() {
		noticeManager.intiUI();
	},
	intiUI : function() {
		commonUtil.init_dategrid("table", "公告列表","back/notice/find.do", "noticeId", {
			
		}, "toolbar");
		

	},
	/**
	 * 查询
	 */
	selectClick : function() {
		$("#table").datagrid("load", {
			"noticeName" : $("#noticeName").val(),
		});
	},
	/**
	 * 添加
	 */
	add : function() {
		commonUtil.openWin("view/back/notice/add_notice.jsp", "add", "添加公告", 1600,
				600);
	},
	/**
	 * 下架
	 */
	delet : function() {
		commonUtil.deleteOperate("请选择要下架的公告", "back/notice/delete.do", "table", function(rows,customerArray){
			for (var i = 0; i < rows.length; i++) {
				customerArray.push({
					'noticeId' : rows[i].noticeId,
					'noticeName' : rows[i].noticeName
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
			commonUtil.showMessages("请选择一条要修改的公告", "提示");
			return;
		}
		commonUtil.openWin("view/back/notice/update_notice.jsp",
				'editnotice', '修改公告信息', 1600,
			600);
	}

	
};
