$(function(){
	add_perimssion.init();

});
var add_perimssion={
	init : function(){
		add_perimssion.initUI();
	},
	initUI : function(){
		var parentWindows=commonUtil.getParentWindows();
		var rows=parentWindows.commonUtil.getTreeSelected("treeDemo");
		if(rows==null||rows.length<1){
			$('#parentId').val("0");
		}else{
			$('#parentId').val(rows[0].id);
			$("#parentName").val(rows[0].name);
		}
			
		
	},
	/**
	 * 添加权限以及校验
	 * @returns {Boolean}
	 */
	add : function(){
		if(!commonUtil.checkinfo('errormsg',null,'permissionName','请输入权限名',false)){
			 return false;
		}else if(!commonUtil.checkinfo('errormsg',null,'permissionCode','请输入权限编码',false)){
			 return false;
		}else if(hanzireg.test($("#permissionCode").val())){
			commonUtil.checkingshowmsg(false, "不支持汉字输入！", "", "permissionCode", "errormsg");
			return false;
		}else if(!commonUtil.checkinfo('errormsg',null,'url','请输入URL',false)){
			 return false;
		}else if(!commonUtil.checkinfo('errormsg',numberreg,'permissionSn','请输入正确的排序号',false)){
			return false;
		}else{
			$('#errormsg').empty();
		}
		commonUtil.ajaxSubmit("back/permission/insert.do",$('#myForm').serialize(),function () {
			commonUtil.checkingshowmsg(false, "保存失败！", "", "", "errormsg");
		},function () {
			if($("#permissionType").combobox("getValue")=="menu"){
				commonUtil.getParentWindows().permission.reloadTree();
			}
			commonUtil.successoperate("queryTable")
		});

	},
	//验证权限代码是否存在
	checkPermissionCode : function (){
		var permissionCode=$('#permissionCode').val();
		if(permissionCode==null || permissionCode==""){
			return;
		}
		var params={"permissionCode":permissionCode};
		commonUtil.ajaxSubmit("back/permission/isPermissionCode.do",params,function () {
			commonUtil.checkingshowmsg(false,"权限代码已存在！","","permissionCode","errormsg");
		},function () {
			$('#errormsg').html('');
			return true;
		});

	}
};
