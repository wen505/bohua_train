var add_recruit = {
	/**
	 *
	 * @returns {Boolean}
	 */
	add : function() {
		if(!recruitoperate.chaeckinfo()){
			return;
		}
		var params= {
			'recruitJob' :$("#recruitJob").val(),
			'sn' :$("#sn").val(),
			'jobDuty' :job_duty.html(),
			'jobRequest' : job_request.html()
		};
      commonUtil.ajaxSubmit("back/recruit/insert.do",params,function () {
		  commonUtil.checkingshowmsg(false, "保存失败！", "", "", "errormsg");
	  },function (res) {
		  commonUtil.successoperate("table")
	  });
	}
};
