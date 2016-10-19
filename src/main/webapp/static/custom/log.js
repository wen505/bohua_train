$(function() {
	// 添加工具栏
	$('#resultList').datagrid({toolbar: '#tb'});
	$('#requestType').combobox({
		panelHeight:'auto',
		editable:false,
	    url:'/eoms/forward.do?serviceName=partner&serviceMethod=loadRequestTypeData.do',
	    valueField:'id',
	    textField:'text'
	});
});

function transPartner(value, row, index) {
	if (value == 'CAIC') {
		return "长安";
	} else if (value == 'CPIC') {
		return "太保";
	} else if (value == 'CCIC') {
		return "大地";
	} else {
		return "未知";
	}
}

function transStatus(value, row, index) {
	if (value == '0' || value == '000000') {
		return "成功";
	} else {
		return "失败";
	}
}

function showLogDetail(targetView) {
	var row = $('#resultList').datagrid('getSelected');
	if (row) {
		var url = "";
		var logType = row.logType;
		if (logType == '01') {
			var url = "/eoms/forward.do?serviceName=business&serviceMethod=logDataInfo.do";
		} else {
			var url = "/eoms/forward.do?serviceName=partner&serviceMethod=logDataInfo.do";
		}
		$.post(url, { logId : row.logId }, function(result) {
			$('#requestText').val(result.requestText);
			$('#responseText').val(result.responseText);
			$('#logDetailPanel').window('open');
			$('#logDetailTabs').tabs('select', '请求报文');    
        },"json");
	} else {
		alert("请选中一条记录");
	}
}

function executeQuery(){
	var requestType = $("#requestType").combobox("getValue");
	var partner = $("#partner").combobox("getValue");
	var businessNo = $("#businessNo").val();
	var modelCode = $("#modelCode").val();
	var quoteNo = $("#quoteNo").val();
	var proposalNo = $("#proposalNo").val();
	var responseCode = $("#responseCode").combobox("getValue");
	var createdDate = $("#createdDate").datebox("getValue");
	var logType = $("#logType").combobox("getValue");
	var url = "";
	if (logType == '01') {
		url = "/eoms/forward.do?serviceName=business&serviceMethod=loadLogData.do";
	} else {
		url = "/eoms/forward.do?serviceName=partner&serviceMethod=loadLogData.do";
	}
	$('#resultList').datagrid({
		url : url,
		queryParams : {
			requestType  : requestType,
			partner	     : partner,
			businessNo   : businessNo,
			modelCode    : modelCode,
			quoteNo      : quoteNo,
			proposalNo   : proposalNo,
			responseCode : responseCode,
			createdDate  : createdDate
		}
	});
}