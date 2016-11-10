$(function(){
	update_recruit.init();
});

var update_recruit={
	init : function(){
		var parentWindows=commonUtil.getParentWindows();
		var row=parentWindows.commonUtil.getSelect("table");
		commonUtil.ajaxSubmit("back/recruit/getById.do", {"recruitId": row.recruitId}, function(){
			commonUtil.checkingshowmsg(false, "初始化招聘内容失败！", "", "", "errormsg");
		}, function(res){
			job_duty.ready(function() {//编辑器初始化完成再赋值
				job_duty.setContent(res.data.jobDuty);  //赋值给UEditor
			});
			job_request.ready(function() {//编辑器初始化完成再赋值
				job_request.setContent(res.data.jobRequest);  //赋值给UEditor
			});
		});
		$('#recruitJob').val(row.recruitJob);
		$('#recruitId').val(row.recruitId);
		$("#sn").val(row.sn);
	},
	/**
	 *
	 * @returns {Boolean}
	 */
	updte : function() {
		if(!recruitoperate.chaeckinfo()){
			return;
		}
		var params= {
			'recruitId' :$("#recruitId").val(),
			'recruitJob' :$("#recruitJob").val(),
			'sn' :$("#sn").val(),
			'jobDuty' :job_duty.getContent(),
			'jobRequest' : job_request.getContent()
		};
		commonUtil.ajaxSubmit("back/recruit/update.do",params,function () {
			commonUtil.checkingshowmsg(false, "保存失败！", "", "", "errormsg");
		},function (res) {
			commonUtil.successoperate("table")
		});
	}
	
};
