//var pageList = [10,20,50,150];
var emaliregexreg = /^([a-zA-Z0-9]+[_|\_|\.]?)*[a-zA-Z0-9]+@([a-zA-Z0-9]+[_|\_|\.]?)*[a-zA-Z0-9]+\.[a-zA-Z]{2,3}$/;// 邮箱正则表达式
var tphonereg = /^0\d{2,3}-?\d{7,8}$/;// 固定电话号码
var mobilephonereg = /^((13[0-9])|(15[0-9])|(18[0-9])|(15[0-9])|(15[0-9]))[0-9]{8}$/;// 手机号码
var numberreg = /^[0-9]*$/; // 输入数字
var decimalreg =/^([0]\.[0-9]*)|[1]{1}$/;//小数点
var ipreg =/^([0-9]+)\.([0-9]+)\.([0-9]+)\.([0-9]+)$/;//ip
var hanzireg = /^[\u4e00-\u9fa5]+$/;//汉字
var commonUtil = {
	
	/**
	 * 获取项目路径
	 * 
	 * @returns
	 */
	getRealpath : function() {
		return contextRootPath;
	},
			/**
	 * 获取项目路径
	 * @param name  路径?后面的名称
	 * @returns
	 */
	getQueryString : function(name) {
			var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)", "i");
			var r = window.location.search.substr(1).match(reg);
			if (r != null) return unescape(r[2]); return null;
	},
	checkNull : function(str) {
		if(str == undefined || str == null||str==''||str=='null'){
			str = "";
		}
		return str;
	},
	/**
	 *
	 * @param title  标题
	 * @param method 方法
	 * @returns {String}
	 */
	returnStrByA:function(title,method){
		return '<a href="javascript:void(0)" onclick='+method+'>'+title+'</a>';
	},
	/**
	 * /** 初始化datagrid方法
	 * 
	 * @param tableid
	 *            表格id
	 * @param title
	 *            标题
	 * @param url
	 *            一部提交url
	 * @param keyid
	 *            主键
	 * @param toolbarId
	 *            绑定的（例如：查询条件）div的id
	 * @param ispagination
	 *            是否有分页工具栏（true,false） 默认有
	 * @param issingleSelect
	 *            是否单选（true,false） 默认多选
	 * @param queryParams
	 *            查询参数
	 * @param isclearChecked
	 *           是否在刷新时清除勾选项
	 */
	init_dategrid : function(tableid, title, url, keyid, param, toolbarId,
			ispagination, issingleSelect,isclearChecked) {
		$('#' + tableid)
				.datagrid(
						{
							// title : title,
							width : 'auto',
							height : 'auto',
							fitColumns : true,// True
							// 就会自动扩大或缩小列的尺寸以适应表格的宽度并且防止水平滚动。
							border : true,
							collapsible : false,// 是否可折叠的
							nowrap : false,
							fit : true,// 自动大小(设置为true时 当最大化窗口也会跟着放大)
							striped : true,// True 就把行条纹化。（即奇偶行使用不同背景色）
							url :  (url==''||url==null) ? null :commonUtil.getRealpath()+"/"+url,
							remoteSort : false,
							queryParams : param,
							idField : keyid,
							singleSelect : (issingleSelect == "" || issingleSelect == null) ? false
									: issingleSelect,// 是否单选
							pagination : (ispagination !=false) ? true
									: ispagination,// 分页控件
							rownumbers : true,// 行号
							toolbar : '#' + toolbarId,
							loadMsg : '数据装载中......',
							onBeforeLoad : function() {
								if(isclearChecked!=false){
									$('#' + tableid).datagrid('clearChecked');// 刷新前清空所有勾选的
								}
								
							}
						});
		if((ispagination !=false)){
			// 设置分页控件
			var p = $('#' + tableid).datagrid('getPager');
			$(p).pagination({
				pageSize : 10,// 每页显示的记录条数，默认为10
				pageList : [ 5, 10, 15, 100 ],// 可以设置每页记录条数的列表
				beforePageText : '第',// 页数文本框前显示的汉字
				afterPageText : '页    共 {pages} 页',
				displayMsg : '当前显示 {from} - {to} 条记录   共 {total} 条记录'
			});
		}
		

	},

	/**
	 * 初始化datagrid方法
	 * 
	 * @param tableid
	 *            表格id
	 * @param title
	 *            标题
	 * @param url
	 *            一部提交url
	 * @param keyid
	 *            主键
	 * @param mergeCellsField
	 *            合并单元格的属性名
	 * @param ispagination
	 *            是否有分页工具栏（true,false）
	 * @param issingleSelect
	 *            是否单选（true,false）
	 * @param queryParams
	 *            查询参数
	 */
	inintmergeCellsDatagrid : function(tableid, title, url, keyid, param,
			mergeCellsField, toolbarId, ispagination, issingleSelect) {
		$('#' + tableid)
				.datagrid(
						{
							width : 'auto',
							height : 'auto',
							// title : title,
							fitColumns : true,// True
							// 就会自动扩大或缩小列的尺寸以适应表格的宽度并且防止水平滚动。
							border : true,
							collapsible : false,// 是否可折叠的
							nowrap : false,
							fit : true,// 自动大小(设置为true时 当最大化窗口也会跟着放大)
							striped : true,// True 就把行条纹化。（即奇偶行使用不同背景色）
							url :  commonUtil.getRealpath()+"/"+url,
							remoteSort : false,
							idField : keyid,
							queryParams : param,
							singleSelect : (issingleSelect == "" || issingleSelect == null) ? true
									: issingleSelect,// 是否单选
							pagination : (ispagination == "" || ispagination == null) ? true
									: ispagination,// 分页控件
							pageList : [ 10, 20, 50, 150 ],
							rownumbers : true,// 行号
							toolbar : '#' + toolbarId,
							loadMsg : '数据装载中......',
							onBeforeLoad : function() {
								$('#' + tableid).datagrid('clearChecked');
							},
							onLoadSuccess : function(rowData) {// 合并单元格
								commonUtil.MergeCells(tableid, mergeCellsField);
							}
						});

		// 设置分页控件
		var p = $('#' + tableid).datagrid('getPager');
		$(p).pagination({
			pageSize : 10,// 每页显示的记录条数，默认为10
			pageList : [ 5, 10, 15, 100 ],// 可以设置每页记录条数的列表
			beforePageText : '第',// 页数文本框前显示的汉字
			afterPageText : '页    共 {pages} 页',
			displayMsg : '当前显示 {from} - {to} 条记录   共 {total} 条记录'
		});
	},
	/**
	 * EasyUI DataGrid根据字段动态合并单元格
	 * 
	 * @param fldList
	 *            要合并table的id
	 * @param fldList
	 *            要合并的列,用逗号分隔(例如："name,department,office");
	 */
	MergeCells : function(tableID, fldList) {
		var Arr = fldList.split(",");
		var dg = $('#' + tableID);
		var fldName;
		var RowCount = dg.datagrid("getRows").length;
		var span;
		var PerValue = "";
		var CurValue = "";
		var length = Arr.length - 1;
		for (i = length; i >= 0; i--) {
			fldName = Arr[i];
			PerValue = "";
			span = 1;
			for (row = 0; row <= RowCount; row++) {
				if (row == RowCount) {
					CurValue = "";
				} else {
					CurValue = dg.datagrid("getRows")[row][fldName];
				}
				if (PerValue == CurValue) {
					span += 1;
				} else {
					var index = row - span;
					dg.datagrid('mergeCells', {
						index : index,
						field : fldName,
						rowspan : span,
						colspan : null
					});
					span = 1;
					PerValue = CurValue;
				}
			}
		}
	},
	
	/**
	 * 获取session中存的按钮级别的代码（控制权限）
	 */
	setpermissionbutton : function() {
		var date = $("#permissionSession").val();
		if (null!=date&&date.length > 0) {
			var permission = date.split(",");
			for (var i = 0; i < permission.length; i++) {
				$('#' + $.trim(permission[i])).show();
			}
		}
		$(".easyui-linkbutton").show();
	},
	/**
	 * 
	 * @param treeid
	 *            表单id
	 * @param data
	 *            封装树的数据
	 * @param isCheck
	 *            是否带复选框
	 * @param isedit
	 *            是否可拖拽
	 * @param isasync
	 *            是否异步
	 * @param chkboxType
	 *            父子关联关系类型 参考ztree参数定义
	 * @param url
	 *            异步的请求地址
	 * @param callbackEvent
	 *            各种事件的定义 例如{ onCheck:
	 *            zTreeOnClick,//zTreeOnClick为自己定义的点击事件的回调函数，其他事件参考ztree onDrop :
	 *            ZTreeMove,//移动事件 onCheck: zTreeOnCheck,
	 *            onExpand:zTreeOnExpand, onDblClick: zTreeOnDblClick }
	 */
	initztree : function(treeid, data, isCheck, isedit, isasync,
			chkboxTypeParam, url, callbackEvent) {
		var set = {
			data : {
				simpleData : {
					enable : true,
					isSimpleData : true, // 数据是否采用简单 Array 格式，默认false
					treeNodeKey : "id", // 在isSimpleData格式下，当前节点id属性
					treeNodeParentKey : "pId", // 在isSimpleData格式下，当前节点的父节点id属性
					showLine : true
				}
			},
			callback : callbackEvent
		};
		/**
		 * 是否带复选框
		 */
		if (isedit) {
			set['edit'] = {
				enable : true,
				showRemoveBtn : false,
				showRenameBtn : false,
				drag : {
					inner : false,
					prev : false,
					next : false,
					siMove : true,
					borderMax : 1000
				}

			};
		}
		/**
		 * 是否拖拽
		 */
		if (isCheck) {
			set['check'] = {
				enable : true,
				chkStyle : "checkbox",
				chkboxType : chkboxTypeParam
			};
		}
		/**
		 * 是否异步
		 */
		if (isasync) {
			set['async'] = {
				enable : true,
				url : url,
				type : "post",
				autoParam : [ "id", 'pId' ]
			};
		}
		var zNodes;
		zNodes = data;
		$.fn.zTree.init($("#" + treeid), set, zNodes);
	},
	/**
	 * 弹出框(用于二级弹出框)
	 * 
	 * @param url
	 * @param id
	 * @param title
	 * @param width
	 * @param height
	 */
	openWin : function(url, id, title, width, height) {
		art.dialog.open( commonUtil.getRealpath()+"/"+url, {
			"id" : id,
			lock : true,
			title : title,
			width : width,
			height : height,
			background : '#000', // 背景色
			opacity : 0, // 透明度
			resize : false,
			drag : false,//是否允许拖拽
			max : false,
			min : false
		});
	},
	/**
	 * confirm弹窗
	 * 
	 * @param title标题
	 * @param msg
	 *            信息
	 * @param callback
	 *            回调函数
	 */
	showConfirm : function(title, msg, callback) {
		$.messager.confirm(title, msg, function(r) {
			if (r) {
				if (jQuery.isFunction(callback))
					callback.call();
			}
		});
	},
	/**
	 * 性别
	 */
	sexFormatter : function(value,row,index){
		switch (value) {
			case "1":
				return "男";
				break;

			default:
				return "女";
				break;
		}
	},

	/**
	 * 截取字符串，用省略号代替
	 */
	longTextFormatter : function(value,row,index){
		if(index == null || index == ''){
			index = 10;
		}
		if(value != null && value.length >index){
			return value.substring(0,index)+"...";
		}
			return value;
	},

	/**
	 * 
	 * @param msg
	 * @param title
	 */
	showProgerss : function(msg, title) {
		if (!title) {
			title = "请稍等";
		}
		if (!msg) {
			msg = "正在保存数据。。。";
		}
		$.messager.progress({
			title : title,
			msg : msg
		});
	},
	/**
	 * easyui弹窗
	 * 
	 * @param msg
	 *            消息体
	 * @param title
	 *            窗口标题
	 * @param isAlert
	 *            可选 是否alert弹窗
	 * @param showType
	 *            可选 是否自动4秒关闭
	 */
	showMessages : function(msg, title, isAlert, showType) {
		var timeout = 0;
		if (!title) {
			title = "温馨提示";
		}
		if (!showType) {
			showType = "slide";
			timeout = 4000;
		}
		if (isAlert !== undefined && isAlert) {
			$.messager.alert(title, msg);
		} else {
			$.messager.show({
				title : title,
				msg : msg,
				timeout : timeout,
				showType : showType,
				style : {
					right : '',
					top : document.body.scrollTop
							+ document.documentElement.scrollTop,
					bottom : ''
				}
			});

		}
		$.messager.progress('close');
	},
	/**
	 * 用于弹出层使用 获取选中的列数据
	 * 
	 * @returns
	 */
	getChecked : function(id) {
		var rows = $('#' + id).datagrid('getChecked');
		return rows;
	},
	/**
	 * 用于弹出层使用 获取选中的列数据
	 * 
	 * @returns
	 */
	getSelect : function(id) {
		var rows = $('#' + id).datagrid('getSelected');
		return rows;
	},
	/**
	 * 刷新页面 id datagrid的id
	 */
	loadtable : function(id) {
		$("#" + id).datagrid("load");
	},

	/**
	 * 刷新当前页
	 * 
	 * @param id
	 *            datagrid的id
	 */
	reloadtable : function(id) {
		$("#" + id).datagrid("reload");
	},

	/**
	 * 全选
	 * 
	 * allCkb 全选复选框的id items 复选框的name
	 */
	allCheck : function(allCkb, items) {
		$('input[name=' + items + ']:checkbox').attr("checked",
				$("#" + allCkb).is(':checked '));
	},

	/**
	 * 关闭弹出框
	 */
	closedialog : function() {
		art.dialog.open.api.close();
	},
	/**
	 * 得到父类窗口的句柄
	 */
	getParentWindows : function() {
		return art.dialog.open.origin;
	},
	/**
	 * 验证不能为空以及允许为空但在空的情况下验证格式
	 * 
	 * @param showmsg
	 *            显示错误信息的id
	 * @param regex
	 *            验证的正则表达式
	 * @param inputid
	 *            要验证的输入框
	 * @param msg
	 *            错误消息
	 * @param isnull
	 *            是否允许为空
	 * @returns {Boolean}
	 */
	checkinfo : function(showmsg, regex, inputid, msg, isnull) {
		var inputname = $('#' + inputid).val();
		if (isnull == false && (inputname == null || inputname == '')) {
			$('#' + showmsg).empty();
			$('#' + showmsg).append("<font color='red'>" + msg + "</font>");
			$('#' + inputid).focus();
			return false;
		} else if (regex != null && inputname != "" && !regex.test(inputname)) {
			$('#' + showmsg).empty();
			$('#' + showmsg).append("<font color='red'>" + msg + "</font>");
			$('#' + inputid).val("");
			$('#' + inputid).focus();
			return false;
		} else {
			$('#' + showmsg).empty();
			return true;
		}
	},
	/**操作成功操作
	 * @param parentid
	 * @returns {boolean}
     */
	successoperate : function(parentid) {
		if (parentid != null) {
			commonUtil.getParentWindows().commonUtil.reloadtable(parentid);
		}
		commonUtil.closedialog();
		return true;

	},

	/**
	 * 
	 * @param issuccess 是否成功
	 * @param errormsg 错误信息
	 * @param successmsg 成功信息
	 * @param focusID 验证表单id
	 * @param showMsgId 显示错误信息id
	 * @returns {Boolean}
	 */
	checkingshowmsg : function(issuccess, errormsg, successmsg, focusID,
			showMsgId) {
		if (issuccess != true) {
			$('#' + showMsgId)
					.html("<font color='red'>" + errormsg + "</font>");
			if(null!=focusID){
				$('#' + focusID).val('');
				$('#' + focusID).focus();
			}
			return false;
		}else{
			$('#' + showMsgId)
			.html("");
		}
		return true;
	},
	/**
	 * 得到选中的节点
	 * 
	 * @param id
	 * @returns
	 */
	getTreeSelected : function(id) {
		var treeObj = $.fn.zTree.getZTreeObj(id);
		if(treeObj==null){
			return null;
		}
		var nodes = treeObj.getSelectedNodes();
		return nodes;
	},
	/**
	 *  删除操作
	 * @param errormsg  没有选择时的提示信息
	 * @param url  请求地址
	 * @param tableid dategrid表单id
	 * @param customerArray 提交的数据
	 * @param successCallBack 成功回调
     */
	deleteOperate : function(errormsg,url,tableid,pushArrayFuc,successCallBack,confirmMsg){
		var rows = commonUtil.getChecked(tableid);
		if (rows == null || rows.length < 1) {
			commonUtil.showMessages(errormsg, "提示");
			return;
		}
		var customerArray = new Array();
		if(pushArrayFuc!=null){
			pushArrayFuc(rows,customerArray);
		}
		if(confirmMsg==null||confirmMsg==''){
			confirmMsg="确认要删除？"
		}

		$.messager.confirm("操作提示",confirmMsg,function(re){
			if(!re){
				return false;
			}else{
				$.ajax({
					url :  commonUtil.getRealpath()+"/"+url,
					type : "POST",
					contentType : 'application/json;charset=utf-8', // 设置请求头信息
					dataType : "json",
					data : JSON.stringify(customerArray), // 将Json对象序列化成Json字符串，JSON.stringify()原生态方法
					success : function(data) {
						if (data.code=='1') {
							if(successCallBack!=null){
								successCallBack(rows);
							}
							commonUtil.reloadtable(tableid);
						} else {
							commonUtil.showMessages("删除失败！", '提示');
						}

					},
					error : function(res) {
						commonUtil.showMessages("删除失败！", '提示');
					}
				});
			}
		});
	},

	/**
	 *  提价数组
	 * @param url 提交地址
	 * @param customerArray 提价的数组
	 * @param errorCallBack 错误回掉函数
	 * @param successCallBack 成功回调函数
     */
	submitList : function(url,customerArray,errorCallBack,successCallBack){
		$.ajax({
			url : commonUtil.getRealpath()+"/"
			+ url,
			type : "POST",
			contentType : 'application/json;charset=utf-8', // 设置请求头信息
			dataType : "json",
			data : JSON.stringify(customerArray), // 将Json对象序列化成Json字符串，JSON.stringify()原生态方法
			success : function(data) {
				if (data.code=='1') {
					if(successCallBack!=null){
						successCallBack(data);
					}
				} else {
					if(errorCallBack!=null){
						errorCallBack();
					}
				}

			},
			error : function(res) {
				if(errorCallBack!=null){
					errorCallBack();
				}
			}
		});
	},
	/**
	 * ajax 提交
	 * @param url 请求地址
	 * @param errorCallBack 失败返回
	 * @param successCallBack 成功返回
	 */
	ajaxSubmit : function(url,params,errorCallBack,successCallBack){
		$.ajax({
			url : commonUtil.getRealpath()+"/"+url,
			type : "POST",
			dataType : "json",
			data : params,
			success : function(data) {
				if (data.code=='1') {
					if(successCallBack!=null){
						successCallBack(data);
					}
				} else {
					if(errorCallBack!=null){
						errorCallBack();
					}
				}

			},
			error : function(res) {
				if(errorCallBack!=null){
					errorCallBack();
				}
			}
		});
	},
	/**
	 * 常量定义
	 */
	constant :{
		notice : 'notice'//模板公共
	}

};
