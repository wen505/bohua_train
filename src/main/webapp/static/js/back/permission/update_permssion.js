$(function(){
	update_permission.init();
});

var update_permission={
	init : function(){
		update_permission.initUI();
	},
	initUI : function(){
		var parentWindows=commonUtil.getParentWindows();
		var row=parentWindows.commonUtil.getSelect("queryTable");
		$('#parentId').val(row.parentId);
		$('#parentName').val(row.parentName);
		$('#permissionId').val(row.permissionId);
		$('#permissionType').combobox("setValue",row.permissionType);
		$('#enabledFlag').val(row.enabledFlag);
		$('#permissionName').val(row.permissionName);
		$('#permissionCode').val(row.permissionCode);
		$('#url').val(row.url);
		$('#permissionSn').val(row.permissionSn);
		$('#description').val(row.description);
		$('#memo').val(row.memo);
	},
	/**
	 * checkinfo()为js/common、common.js中的方法
	 * @returns {Boolean}
	 */
	update : function (){
		if(!commonUtil.checkinfo('errormsg',null,'permissionName','请输入权限名',false)){
			return false;
		}else if(!commonUtil.checkinfo('errormsg',null,'permissionCode','请输入权限编码',false)){
			return false;
		}else if(!commonUtil.checkinfo('errormsg',null,'url','请输入URL',false)){
			return false;
		}else if(!commonUtil.checkinfo('errormsg',numberreg,'permissionSn','请输入正确的排序号',false)){
			return false;
		}else{
			$('#errormsg').empty();
		}
		commonUtil.ajaxSubmit("back/permission/update.do",$('#myForm').serialize(),function () {
			commonUtil.checkingshowmsg(false, "保存失败！", "", "", "errormsg");
		},function () {
			if($("#permissionType").combobox("getValue")=="menu"){
				commonUtil.getParentWindows().permission.reloadTree();
			}
			commonUtil.successoperate("queryTable")
		});
	}
};
