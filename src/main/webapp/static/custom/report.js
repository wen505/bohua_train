$(function() {
	// 统计日期默认为当前日期前一天
	var current = new Date();
	current.setDate(current.getDate() - 1);
	var currentStr = current.getFullYear() + "-";
	currentStr += current.getMonth() + 1 + "-";
	currentStr += current.getDate();
	$('#createDate').datebox('setValue', currentStr);
	
	// 添加工具栏
	$('#resultList').datagrid({toolbar: '#tb'});
});

function executeQuery(){
	var areaCode = $("#areaCode").combobox("getValue");
	var partnerId = $("#partnerId").combobox("getValue");
	var createDate = $("#createDate").datebox("getValue");
	$('#resultList').datagrid({
		url : '/eoms/forward.do?serviceName=business&serviceMethod=loadReportData.do',
		queryParams : {
			areaCode   : areaCode,
			partnerId  : partnerId,
			createDate : createDate
		},
		rowStyler : function(index, row) {   
	        if (row.areaCode == null) {   
	            return 'background-color:rgba(0, 175, 80, 1);font-weight:bold;';   
	        }   
	    }
	});
}

function exportInfo(){
	var areaCode = $("#areaCode").combobox("getValue");
	var partnerId = $("#partnerId").combobox("getValue");
	var createDate = $("#createDate").datebox("getValue");
	var url = "/eoms/forward.do?serviceName=business&serviceMethod=exportReportInfoData.do";
	$.ajax({
		type : "POST",
		url : url,
		data : { areaCode : areaCode, partnerId : partnerId, createDate : createDate },
		dataType : "json",
		success : function(result) {
			location.href = "/eoms/download/"+result;
		},
		error : function() {
			alert("导出Excel异常！");
		}
	});
}

function exportDetail() {
	var reportId;
	var rows = $('#reportDetailGrid').datagrid('getRows');
	$.each(rows,function(i,row){
		reportId = row.reportId;
	});
	var areaCode = $("#areaCode").combobox("getValue");
	var partnerId = $("#partnerId").combobox("getValue");
	var createDate = $("#createDate").datebox("getValue");
	var url = "/eoms/forward.do?serviceName=business&serviceMethod=exportReportDetailData.do";
	$.ajax({
		type : "POST",
		url : url,
		data : { reportId : reportId, areaCode : areaCode, partnerId : partnerId, createDate : createDate },
		dataType : "json",
		success : function(result) {
			location.href = "/eoms/download/"+result;
		},
		error : function() {
			alert("导出Excel异常！");
		}
	});
}

function transPartner(value, row, index) {
	if (value == 'CAIC') {
		return "CAIC---长安";
	} else if (value == 'CPIC') {
		return "CPIC---太保";
	} else if (value == 'CCIC') {
		return "CCIC---大地";
	} else {
		return "未知";
	}
}

function addLink(value, row, index) {
	if (row.areaCode != null) {
		return '<a href="javascript:showDetail(' + row.reportId + ');">' + value + '</>';
	} else {
		return value;
	}
}

function showDetail(reportId) {
	$('#reportDetailPanel').window('open');
	$('#reportDetailGrid').datagrid({
		url : '/eoms/forward.do?serviceName=business&serviceMethod=loadReportDetailData.do',
		queryParams : { reportId   : reportId }
	});
}
