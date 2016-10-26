<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>修改字典配置</title>
    <%@ include file="/view/common/taglibs.jsp"%>
    <%@ include file="/view/common/meta_css.jsp"%>
    <%@ include file="/view/common/meta_js.jsp"%>
    <script type="text/javascript" src="${ctx}/static/js/back/dictionary/updateDictionary.js"></script>
</head>

<body>
<form action="" method="post" target="mainFrame" id="myForm">
    <div id="td" style='margin-left: 10px'>
        <div align="center" style="border-color: blue;height: 20px;">
            <span id="errormsg"></span>
        </div>
        <table width="94%" border="0" cellpadding="1" cellspacing="2"
               class="tab_2">
            <tr>
                <td class="tab_style">配置名称：</td>
                <td class="tab_input"><input name="headerName"
                                             id="headerName" type="text" size=20
                                             class="easyui-input" /></td>
                <td class="tab_style">配置代码：</td>
                <td class="tab_input"><input name="headerCode"
                                             id="headerCode" type="text"  size=20
                                             class="easyui-input" onblur="updateDictionary.checkHeaderCode()"  /></td>
            </tr>
            <tr>
                <td class="tab_style">配置类型：</td>
                <td><select class="easyui-combobox"
                            name="dictionaryType" id="dictionaryType" style="width:150px;">
                    <option value="user">自定义</option>
                    <option value="system">系统</option>
                </select></td>
            </tr>
            <tr>
                <td class="tab_style">备注：</td>
                <td colspan="3"><textarea name="memo" style="width: 464px;height: 63px;"
                                          id="memo" size=80 class='textarea_css'></textarea>
                </td>
            </tr>

        </table>
        <div align="center" class="bottom_div">
            <a href="javascript:void(0)" class="easyui-linkbutton"
               data-options="iconCls:'icon-ok'" id='addButton'
               onclick="updateDictionary.update()">&nbsp;保存&nbsp;</a>
            &nbsp;&nbsp;&nbsp;&nbsp;<a href="#" class="easyui-linkbutton"
                                       data-options="iconCls : 'icon-cancel'" id="closes"
                                       onclick="commonUtil.closedialog()">&nbsp;关闭&nbsp;</a>
        </div>
    </div>
</form>
</body>
</html>