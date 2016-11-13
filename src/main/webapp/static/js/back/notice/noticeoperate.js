var notice_ue = UE.getEditor('editor',{
	elementPathEnabled :false, //是否启用元素路径，默认是显示
	autoHeightEnabled :false //是否自动长高，默认true
});
UE.Editor.prototype._bkGetActionUrl = UE.Editor.prototype.getActionUrl;
UE.Editor.prototype.getActionUrl = function(action){
	if(action == '/back/fileOperate/uploadImage.do'){
		return commonUtil.getRealpath()+'/back/fileOperate/uploadImage.do?remotePath='+commonUtil.constant.noticeImage;

	}else if(action == '/back/fileOperate/previewuploadImg.do'){
		return commonUtil.getRealpath()+'/back/fileOperate/previewuploadImg.do';
	}else {
		return this._bkGetActionUrl.call(this, action);
	}
}
var noticeoperate = {
	/**
	 * 验证输入信息
	 *
	 * @returns {Boolean}
	 */
	chaeckinfo : function() {
		if (!commonUtil.checkinfo('errormsg', null, 'noticeName', '请输入标题',
				false)) {
			return false;
		}
		if (!commonUtil.checkinfo('errormsg', null, 'isimage', '请选择上传模板图片',
				false)) {
			return false;
		}
		if (!notice_ue.hasContents()) {
			commonUtil.checkingshowmsg(false, "请输入公告内容！", "", "", "errormsg");
			return false;
		}
		return true;
	},
	onbeforeClose : function () {
		if($("#isUpload").val()=='true'&&$("#isSave").val()!='true'){//如果已经上传了文件，但没有保存数据库，则将文件删除
			commonUtil.ajaxSubmit("back/fileOperate/deleteFile.do",{"filename":$("#imageUrl").val(),"fileType":commonUtil.constant.notice});
		}

	}
};
