var job_request = KindEditor.create('#job_request', {
	items : [ 'source', '|', 'undo', 'redo', '|', 'preview', 'print',
		'template', 'code', 'cut', 'copy', 'paste', 'plainpaste',
		'wordpaste', '|', 'justifyleft', 'justifycenter', 'justifyright',
		'justifyfull', 'insertorderedlist', 'insertunorderedlist',
		'indent', 'outdent', 'subscript', 'superscript', 'clearhtml',
		'quickformat', 'selectall', '|', 'fullscreen', '/', 'formatblock',
		'fontname', 'fontsize', '|', 'forecolor', 'hilitecolor', 'bold',
		'italic', 'underline', 'strikethrough', 'lineheight',
		'removeformat', '|','baidumap', 'table', 'hr', 'emoticons', 'pagebreak',
		'anchor', 'link', 'unlink' ],
	autoHeightMode : false,
	indentChar : false,
	wellFormatMode : false//true时美化HTML数据。

});

var job_duty = KindEditor.create('#job_duty', {
	items : [ 'source', '|', 'undo', 'redo', '|', 'preview', 'print',
		'template', 'code', 'cut', 'copy', 'paste', 'plainpaste',
		'wordpaste', '|', 'justifyleft', 'justifycenter', 'justifyright',
		'justifyfull', 'insertorderedlist', 'insertunorderedlist',
		'indent', 'outdent', 'subscript', 'superscript', 'clearhtml',
		'quickformat', 'selectall', '|', 'fullscreen', '/', 'formatblock',
		'fontname', 'fontsize', '|', 'forecolor', 'hilitecolor', 'bold',
		'italic', 'underline', 'strikethrough', 'lineheight',
		'removeformat', '|','baidumap', 'table', 'hr', 'emoticons', 'pagebreak',
		'anchor', 'link', 'unlink' ],
	autoHeightMode : false,
	indentChar : false,
	wellFormatMode : false//true时美化HTML数据。

});
var recruitoperate = {
	/**
	 * 验证输入信息
	 *
	 * @returns {Boolean}
	 */
	chaeckinfo : function() {
		if (!commonUtil.checkinfo('errormsg', null, 'recruitJob', '请输入职位',
				false)) {
			return false;
		}
		if(!commonUtil.checkinfo('errormsg',numberreg,'sn','请输入正确的排序号',true)){
			return false;
		}
		if (job_request.isEmpty()) {
			commonUtil.checkingshowmsg(false, "请输入任职资格内容！", "", "", "errormsg");
			return false;
		}
		if (job_duty.isEmpty()) {
			commonUtil.checkingshowmsg(false, "请输入职位责任内容！", "", "", "errormsg");
			return false;
		}
		return true;
	}
};
