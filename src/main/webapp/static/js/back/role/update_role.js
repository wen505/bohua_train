$(function() {
	var row = commonUtil.getParentWindows().commonUtil.getChecked("queryTable");
	$('#roleId').val(row[0].roleId);
	$('#enabledFlag').val(row[0].enabledFlag);
	$('#roleName').val(row[0].roleName);
	$('#memo').text(row[0].memo);
	
});
/**
 *
 * 
 * @returns {Boolean}
 */
function check() {
	if (!commonUtil.checkinfo('errormsg', null, 'roleName', '请输入角色名', false)) {
		return false;
	}
	commonUtil.ajaxSubmit("back/role/update.do",$("#myForm").serialize(),function () {
		commonUtil.checkingshowmsg(false, "修改失败！", "", "", "errormsg");
	},function (result) {
		commonUtil.successoperate("queryTable");
	});

}
