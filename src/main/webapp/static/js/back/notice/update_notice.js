$(function(){
	update_notice.init();
});

var update_notice={
	init : function(){
		var parentWindows=commonUtil.getParentWindows();
		var row=parentWindows.commonUtil.getSelect("table");
		commonUtil.ajaxSubmit("back/notice/getById.do", {"noticeId": row.noticeId}, function(){
			commonUtil.checkingshowmsg(false, "初始化公告内容失败！", "", "", "errormsg");
		}, function(res){
			notice_ue.ready(function() {//编辑器初始化完成再赋值
				notice_ue.setContent(res.data.noticeContent);  //赋值给UEditor
			});
		});
		$('#noticeName').val(row.noticeName);
		$('#noticeId').val(row.noticeId);
		//$("#imageUrl").val(row.imageUrl);
		$("#nextImageUrl").val(row.imageUrl);
		$("#isimage").val('true');
		$("#picurl").attr(
			"src",
			commonUtil.getRealpath()+"/upload/"+ commonUtil.constant.notice+"/"+ row.imageUrl + "?ss="
			+ Math.random());

	
	},
	/**
	 *
	 * @returns {Boolean}
	 */
	updte : function() {
		var params= {
			'noticeId' :$("#noticeId").val(),//本次修改后的图片
			'imageUrl' :$("#imageUrl").val(),//本次修改后的图片
			'noticeName' :$("#noticeName").val(),
			'noticeContent' : notice_ue.getContent(),
			'nextImageUrl':$("#nextImageUrl").val()//上次添加时候的图片
		};
		commonUtil.ajaxSubmit("back/notice/update.do",params,function () {
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
					update_notice.updte();
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
		if($("#isChangeImg").val()=='true'&&$("#isUpload").val()=='true'){//如果已经上传了图片，直接保存数据库
			if(!noticeoperate.chaeckinfo()){
				return false;
			}
			update_notice.updte();
		}else if($("#isChangeImg").val()!='true'){//如果没有改变图片
			if(!noticeoperate.chaeckinfo()){
				return false;
			}
			update_notice.updte();
		}else{
			$('#myForm').submit();
		}

	}
	
};
