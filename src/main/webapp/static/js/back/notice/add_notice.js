var add_notice = {
	/**
	 *
	 * @returns {Boolean}
	 */
	add : function() {
		var params= {
			'imageUrl' :$("#imageUrl").val(),
			'noticeName' :$("#noticeName").val(),
			'noticeContent' : notice_ue.getContent()
		};
      commonUtil.ajaxSubmit("back/notice/insert.do",params,function () {
		  commonUtil.checkingshowmsg(false, "保存失败！", "", "", "errormsg");
		  $("#isSave").val("")
	  },function (res) {
		  $("#isSave").val("true");
		  commonUtil.successoperate("table")
	  });
	},
	// 上传数据
	upload : function(form) {
		if(!noticeoperate.chaeckinfo()){
			return false;
		}
		$('#errormsg').empty();
		var options = {
			url : commonUtil.getRealpath()+"/back/fileOperate/uploadImageStr.do?width=1920&remotePath="+commonUtil.constant.notice,
			type : 'post',
			success : function(data) {
				var result= eval('('+data+')');
				if(result.state=='SUCCESS'){
					$("#isUpload").val('true');
					$("#imageUrl").val(result.original)
					add_notice.add();
				}else {
					$("#isUpload").val('');
					commonUtil.checkingshowmsg(false, "上传失败！", "", "", "errormsg");
				}
			},
			error : function () {
				$("#isUpload").val('');
				commonUtil.checkingshowmsg(false, "请求网络失败！", "", "", "errormsg");
			}
		};
		$('#myForm').ajaxSubmit(options);
		return false;
	}
	,

	submit : function(){
         if($("#isUpload").val()=='true'){//如果已经上传了图片，直接保存数据库
			 if(!noticeoperate.chaeckinfo()){
				 return false;
			 }
			 add_notice.add();
		 }else{
			 $('#myForm').submit();
		 }

	}
};
