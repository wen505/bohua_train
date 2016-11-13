<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <title>编辑行配置信息</title>
    <%@ include file="/view/common/taglibs.jsp"%>
    <%@ include file="/view/common/meta_css.jsp"%>
    <%@ include file="/view/common/back_main_ui_comm.jsp"%>
    <!-- 本文件对象 -->
    <script type="text/javascript" src="${pageContext.request.contextPath}/static/js/back/dictionary/dictionaryDetail.js"></script>
</head>

<body style='margin: 0px;padding: 0px;'>
<table id="queryTable" width="100%" border="1" cellpadding="0" cellspacing="0" class="" >
    <thead>
    <tr>
        <th data-options="field:'lineId',align:'center',checkbox:true" scope="col" width="10%"></th>
        <th data-options="field:'lineName',editor:'text'" width="20%">行配置名称</th>
        <th data-options="field:'lineCode',editor:'text'" width="20%">行配置值</th>
        <th data-options="field:'isDefault',formatter: dictionaryDetail.typeFormatter,editor:{type:'combobox', options:{required:true, editable:false, data:[{'id':'Y','text':'是'},{'id':'N','text':'否'}], valueField:'id', textField:'text'}}" width="20%">是否默认</th>
        <th data-options="field:'sn',editor:'text'" width="20%">序列</th>
        <%--<th data-options="field:'dictionaryType',editor:'text', formatter: dictionaryDetail.typeFormatter" width="20%">配置类型</th>--%>
        <th data-options="field:'memo',editor:'text'" width="20%">备注</th>
    </tr>
    </thead>
</table>
<div id="queryPart">
    <div style='' align="right">
        <a href="#" class="easyui-linkbutton" iconCls="icon-add" id="showDictionaryDetail"  style="display: none;"  onclick="dictionaryDetail.addClickEvent()"  plain="true" title="添加行">添加行</a>
        <a href="#" class="easyui-linkbutton" iconCls="icon-edit" id="addDictionary"  style="display: none;"  onclick="dictionaryDetail.deleteClickEvent()"  plain="true" title="删除行">删除行</a>
    </div>
</div>

</body>
</html>
