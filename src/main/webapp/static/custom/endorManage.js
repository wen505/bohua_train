function executeQuery() {
	var partnerId = $("#partnerId").combobox("getValue");
	var riskCode = $("#riskCode").combobox("getValue");
	var policyNo = $("#policyNo").val();
	var orderNo = $("#orderNo").val();
	var status = $("#status").combobox("getValue");
	var endorType = $("#endorType").combobox("getValue");
	var startCreateDate = $("#startCreateDate").datebox("getValue");
	var endCreateDate = $("#endCreateDate").datebox("getValue");
	$('#resultList').datagrid({
		url : '/eoms/forward.do?serviceName=business&serviceMethod=findEndorByParams.do',
		queryParams : { 
			partnerId : partnerId,
			riskCode : riskCode,
			policyNo : policyNo,
			orderNo : orderNo,
			status : status,
			endorType : endorType,
			startCreateDate : startCreateDate,
			endCreateDate : endCreateDate
		}
	});
}
function outEndor() {
	var outFlag = true;
	var selections = $('#resultList').datagrid('getSelections');
	var param = "";
	if(selections.length > 0 ){
		for (var int = 0; int < selections.length; int++) {
			var obj = eval(selections[int]);
			if(obj.status == '1'){
				$.messager.alert('提示框', '推送数据中有已处理成功的批单,请重新选择！', 'error');
				$('#resultList').datagrid('reload');
				return;
			}else{
				param = param +"$"+obj.endorNo;
			}
		}
	}else{
		$.messager.alert('提示框', '请选中至少一条批单！', 'error');
	}
	var requestParam = param.substring(1, param.length);
	$.ajax({
		url : "/eoms/forward.do?serviceName=business&serviceMethod=outEndor.do",
		async : true,
		data : {
			"requestStr" : requestParam
		},
		dataType : "json",
		type : "POST",
		success : function(data) {
			var appCode = eval(data).appCode;
			var appMessage = eval(data).appMessage;
			if (appCode == "1") {
				$.messager.alert('提示框', '推送成功', 'info');
			} else {
				$.messager.alert('提示框', '推送失败', 'error');
			}
			$('#resultList').datagrid('reload');
		}
	});
}

function partnerFormatter(value){
	if(value == 'CAIC'){
		return '长安保险';
	}
	else if(value == 'CPIC'){
		return '太平洋保险';
	}
	else if(value == 'CCIC'){
		return '大地保险';
	}
}

function riskCodeFormatter(value){
	if(value == '0501' || value == '0520'){
		return '商业险';
	}
	else if(value == '0507'){
		return '交强险';
	}
}

function statusFormatter(value){
	if(value == '0'){
		return '未处理';
	}
	else if(value == '1'){
		return '成功';
	}
	else if(value == '2'){
		return '失败';
	}
}

function createDateFormatter(value){
	return formatDate(new Date(value));
}

function formatDate(now) {
	var year = now.getYear()+1900;
	var month = now.getMonth() + 1;
	var date = now.getDate();
	var hour = now.getHours();
	var minute = now.getMinutes();
	var second = now.getSeconds();
	return year + "-" + month + "-" + date + "   " + hour + ":" + minute + ":"
			+ second;
}