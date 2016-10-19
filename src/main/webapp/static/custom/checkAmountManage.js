function createDateFormatter(value){
	return formatDate(new Date(value));
}
function showDetail(reconNo){
//	window.location.href = $('#reconNo').val()+"/business/pages/jsp/checkAmountListManage.jsp?reconNo="+value;
	$('#cmInfos').window('open');
	$('#resultInfos').datagrid({
		url : '/eoms/forward.do?serviceName=business&serviceMethod=findCheckAmountListByParams.do',
		queryParams : { reconNo   : reconNo }
	});
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
function resultFlagFormatter(value){
	if(value == '0'){
		return '失败';
	}
	else if(value == '1'){
		return '成功';
	}
}
function orderStatusFormatter(value){
	if(value == '3'){
		return '待支付';
	}
	else if(value == '5'){
		return '已完成';
	}
}
function reconNoFormatter(value){
	value1 = "'"+value+"'";
	return '<a href="javascript:showDetail('+value1+');">' + value + '</>';
	
}
function executeQuery() {
	var riskCode = $("#resultFlag").combobox("getValue");
	var reconNo = $("#reconNo").val();
	var tradStartDate = $("#tradStartDate").datebox("getValue");
	var tradEndDate = $("#tradEndDate").datebox("getValue");
	$('#resultList').datagrid({
		url : '/eoms/forward.do?serviceName=business&serviceMethod=findCheckAmountByParams.do',
		queryParams : { 
			riskCode : riskCode,
			reconNo : reconNo,
			tradStartDate : tradStartDate,
			tradEndDate : tradEndDate
		}
	});
}
function reInsureConfirm(){
	var selected = $('#resultInfos').datagrid('getSelected');
	if(selected != null ){
		var obj = eval(selected);
		if(obj.resultFlag == '1'){
			$.messager.alert('提示框', '该订单对账无误，请重新选择对账失败的订单！', 'error');
			$('#resultList').datagrid('reload');
			return;
		}
	}else{
		$.messager.alert('提示框', '请至少选择一条！', 'error');
	}
	var checkAmountInfo = eval(selected);
	var requestJson = "{cardSerialNo:"+checkAmountInfo.tradNo+",mchId:"+checkAmountInfo.mchId+",orderNo:"+checkAmountInfo.orderNo+",payTime:"+formatDate(new Date())+",payType:"+checkAmountInfo.payType+"}";
	$.ajax({
		url : "/eoms/forward.do?serviceName=business&serviceMethod=reInsureConfirm.do",
		async : true,
		data : {
			"requestStr" : requestJson
		},
		dataType : "json",
		type : "POST",
		success : function(data) {
			var errCode = eval(data).errCode;
			var errMsg = eval(data).errMsg;
			if (errCode == "0000") {
				$.messager.alert('提示框', '落地成功', 'info');
			} else {
				$.messager.alert('提示框', '落地失败', 'error');
			}
			$('#resultList').datagrid('reload');
		}
	});
}
