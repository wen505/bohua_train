var job_request = UE.getEditor('job_request',{
	 toolbars: [[
	'fullscreen', 'source', '|', 'undo', 'redo', '|',
	'bold', 'italic', 'underline', 'fontborder', 'strikethrough', 'superscript', 'subscript', 'removeformat', 'formatmatch', 'autotypeset', 'blockquote', 'pasteplain', '|', 'forecolor', 'backcolor', 'insertorderedlist', 'insertunorderedlist', 'selectall', 'cleardoc', '|',
	'rowspacingtop', 'rowspacingbottom', 'lineheight', '|',
	'customstyle', 'paragraph', 'fontfamily', 'fontsize', '|',
	'directionalityltr', 'directionalityrtl', 'indent', '|',
	'justifyleft', 'justifycenter', 'justifyright', 'justifyjustify', '|', 'touppercase', 'tolowercase', '|',
	'link', 'unlink', 'anchor', '|','emotion', 'scrawl',  'map',  'insertframe', 'insertcode',  'pagebreak', 'template', 'background', '|',
	'horizontal', 'date', 'time', 'spechars', 'snapscreen', 'wordimage', '|',
	'inserttable', 'deletetable', 'insertparagraphbeforetable', 'insertrow', 'deleterow', 'insertcol', 'deletecol', 'mergecells', 'mergeright', 'mergedown', 'splittocells', 'splittorows', 'splittocols', 'charts', '|',
	'print', 'preview', 'searchreplace', 'drafts', 'help'
   ]],
	elementPathEnabled :false, //是否启用元素路径，默认是显示
	autoHeightEnabled :false //是否自动长高，默认true
});
var job_duty = UE.getEditor('job_duty',{
	toolbars: [[
		'fullscreen', 'source', '|', 'undo', 'redo', '|',
		'bold', 'italic', 'underline', 'fontborder', 'strikethrough', 'superscript', 'subscript', 'removeformat', 'formatmatch', 'autotypeset', 'blockquote', 'pasteplain', '|', 'forecolor', 'backcolor', 'insertorderedlist', 'insertunorderedlist', 'selectall', 'cleardoc', '|',
		'rowspacingtop', 'rowspacingbottom', 'lineheight', '|',
		'customstyle', 'paragraph', 'fontfamily', 'fontsize', '|',
		'directionalityltr', 'directionalityrtl', 'indent', '|',
		'justifyleft', 'justifycenter', 'justifyright', 'justifyjustify', '|', 'touppercase', 'tolowercase', '|',
		'link', 'unlink', 'anchor', '|','emotion', 'scrawl',  'map',  'insertframe', 'insertcode',  'pagebreak', 'template', 'background', '|',
		'horizontal', 'date', 'time', 'spechars', 'snapscreen', 'wordimage', '|',
		'inserttable', 'deletetable', 'insertparagraphbeforetable', 'insertrow', 'deleterow', 'insertcol', 'deletecol', 'mergecells', 'mergeright', 'mergedown', 'splittocells', 'splittorows', 'splittocols', 'charts', '|',
		'print', 'preview', 'searchreplace', 'drafts', 'help'
	]],
	elementPathEnabled :false, //是否启用元素路径，默认是显示
	autoHeightEnabled :false //是否自动长高，默认true
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
		if (!job_request.hasContents()) {
			commonUtil.checkingshowmsg(false, "请输入任职资格内容！", "", "", "errormsg");
			return false;
		}
		if (!job_duty.hasContents()) {
			commonUtil.checkingshowmsg(false, "请输入职位责任内容！", "", "", "errormsg");
			return false;
		}
		return true;
	}
};
