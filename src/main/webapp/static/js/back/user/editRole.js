/**
 * 编辑用户角色权限
 * @type {{init: editRole.init, submitClick: editRole.submitClick}}
 */
var editRole = {
		init:function(){
			var userId = commonUtil.getQueryString("userId");
			$('#userId').val(userId);
			var param={"userid":userId};
			$.post(commonUtil.getRealpath()+"/back/user/getUserRole.do",param,function(data){
				var msg=data.date;
				commonUtil.initztree("treeDemo", msg, true, false, false, { "Y" : "ps", "N" : "ps" } );
	         });
		},
		submitClick : function(){
			 var treeObj = $.fn.zTree.getZTreeObj("treeDemo");
		     var nodes = treeObj.getCheckedNodes(true);
		     var customerArray = new Array();
		     var  useridval =$('#userId').val();
		     for(var i=0;i<nodes.length;i++){
		    	 customerArray.push({'userId': useridval, 'roleId':  nodes[i].id});
		    }
			 commonUtil.submitList("back/user/updateUserRole.do?userId="+useridval,customerArray,function () {
				 $("#errormsg").html("<font color='red'>删除失败！</font>");
			 },function () {
				 commonUtil.closedialog();
			 });
		}
};

$(function(){
	editRole.init();
});