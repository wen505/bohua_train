var notice_ue = KindEditor.create('#editor_id', {
	items : [ 'source', '|', 'undo', 'redo', '|', 'preview', 'print',
		'template', 'code', 'cut', 'copy', 'paste', 'plainpaste',
		'wordpaste', '|', 'justifyleft', 'justifycenter', 'justifyright',
		'justifyfull', 'insertorderedlist', 'insertunorderedlist',
		'indent', 'outdent', 'subscript', 'superscript', 'clearhtml',
		'quickformat', 'selectall', '|', 'fullscreen', '/', 'formatblock',
		'fontname', 'fontsize', '|', 'forecolor', 'hilitecolor', 'bold',
		'italic', 'underline', 'strikethrough', 'lineheight','image',
		'removeformat', '|','baidumap', 'table', 'hr', 'emoticons', 'pagebreak',
		'anchor', 'link', 'unlink' ],
	autoHeightMode : false,
	indentChar : false,
	wellFormatMode : false,//true时美化HTML数据。
	uploadJson : commonUtil.getRealpath()+"/back/fileOperate/uploadFile.do?remotePeath="+commonUtil.constant.notice,
	fileManagerJson  : commonUtil.getRealpath()+"/back/fileOperate/previewuploadImg.do?path="+commonUtil.constant.notice,//网络图片
	allowImageRemote:true,
	allowFileManager : true,
	filePostName : "file",
	resizeType:2//2或1或0，2时可以拖动改变宽度和高度，1时只能改变高度，0时不能拖动

});
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
		if (notice_ue.isEmpty()) {
			commonUtil.checkingshowmsg(false, "请输入公告内容！", "", "", "errormsg");
			return false;
		}
		return true;
	},
	onbeforeClose : function () {
		if($("#isUpload").val()=='true'&&$("#isSave").val()!='true'){//如果已经上传了文件，但没有保存数据库，则将文件删除
			commonUtil.ajaxSubmit("back/fileOperate/deteFile.do",{"filename":$("#imageUrl").val(),"fileType":commonUtil.constant.notice});
		}

	}
};
