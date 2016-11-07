/**
 * 课程管理界面js
 * @type {{isValite: boolean, realpath: null, dialog: null, init: courseManager.init, selectClick: courseManager.selectClick, addClickEvent: courseManager.addClickEvent, updateClikEvent: courseManager.updateClikEvent, update: courseManager.update, add: courseManager.add, delet: courseManager.delet}}
 */
var courseManager = {
    isValite : true,
    realpath : null,
    dialog :null,
	init : function(){
		commonUtil.init_dategrid("queryTable","课程查询", "back/course/find.do", "className", null, "queryPart");
	},
	//查询
	selectClick : function(){
		$('#queryTable').datagrid('load' ,{
			'classType' : $('#classType').val(),
			'className' : $('#className').val()
		 });
	},

	//删除
	delet:function(){
		commonUtil.deleteOperate("请选择要删除的课程", "back/course/delete.do", "queryTable", function(rows,customerArray){
			for (var i = 0; i < rows.length; i++) {
				 customerArray.push({'id': rows[i].id, 'className':  rows[i].className});
			}
		});
	},
	
	/**
	 *
	 */
	addClickEvent : function () {
          commonUtil.openWin("view/back/course/addCourse.jsp","add_course","添加课程信息",800,400);

	},
	/**
	 *
	 */
	updateClickEvent : function () {
		var rows = commonUtil.getChecked("queryTable");
		if (rows == null || rows.length < 1 || rows.length > 1) {
			commonUtil.showMessages("请选择一条要修改的课程", "提示");
			return;
		}
		commonUtil.openWin("view/back/course/updateCourse.jsp","update_course","编辑课程",800,400);

	}
	
};

$(function(){
	courseManager.init();
});
