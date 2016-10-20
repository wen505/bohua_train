<%@ page contentType="text/html;charset=utf-8"%>
<%@ include file="common/taglibs.jsp"%>
<%@ include file="common/meta_css.jsp"%>
<%@ include file="common/meta_js.jsp"%>
<!DOCTYPE html>
<html>
<head>
<title>运维管理平台</title>
<script type="text/javascript">
$(function() {
	tabClose();
	tabCloseEven();
	$.getJSON("/static/menu.json", function(data){
		addNav(data);
		InitLeftMenu(data);
	});
});

function addNav(data) {

	$.each(data, function(i, sm) {
		var menulist = "";
		menulist += '<ul>';
		$.each(sm.menus, function(j, o) {
			menulist += '<li><div><a ref="' + o.menuid + '" href="#" rel="'
					+ o.url + '" ><span class="icon ' + o.icon
					+ '" >&nbsp;</span><span class="nav">' + o.menuname
					+ '</span></a></div></li> ';
		});
		menulist += '</ul>';

		$('#menu').accordion('add', {
			title : sm.menuname,
			content : menulist,
			iconCls : 'icon ' + sm.icon
		});

	});
	$("#menu").accordion('getSelected').panel('collapse')
}

// 初始化左侧
function InitLeftMenu(data) {
	
	hoverMenuItem();

	$('#menu li').on('click', 'a', function() {
		var tabTitle = $(this).children('.nav').text();

		var url = $(this).attr("rel");
		var menuid = $(this).attr("ref");
		var icon = getIcon(menuid, data);

		addTab(tabTitle, url, icon);
		$('#menu li div').removeClass("selected");
		$(this).parent().addClass("selected");
	});

}

/**
 * 菜单项鼠标Hover
 */
function hoverMenuItem() {
	$(".easyui-accordion").find('a').hover(function() {
		$(this).parent().addClass("hover");
	}, function() {
		$(this).parent().removeClass("hover");
	});
}

// 获取左侧导航的图标
function getIcon(menuid, data) {
	var icon = 'icon ';
	$.each(data, function(j, o) {
		$.each(o.menus, function(k, m){
			if (m.menuid == menuid) {
				icon += m.icon;
				return false;
			}
		});
	});
	return icon;
}

function addTab(subtitle, url, icon) {
	if (!$('#tabs').tabs('exists', subtitle)) {
		$('#tabs').tabs('add', {
			title : subtitle,
			content : createFrame(url),
			closable : true,
			icon : icon
		});
	} else {
		$('#tabs').tabs('select', subtitle);
		$('#mm-tabupdate').click();
	}
	tabClose();
}

function createFrame(url) {
	var s = '<iframe scrolling="auto" frameborder="0"  src="' + url + '" style="width:100%;height:100%;"></iframe>';
	return s;
}
function tabClose() {
	/* 双击关闭TAB选项卡 */
	$(".tabs-inner").dblclick(function() {
		var subtitle = $(this).children(".tabs-closable").text();
		$('#tabs').tabs('close', subtitle);
	});
	/* 为选项卡绑定右键 */
	$(".tabs-inner").bind('contextmenu', function(e) {
		$('#mm').menu('show', {
			left : e.pageX,
			top : e.pageY
		});

		var subtitle = $(this).children(".tabs-closable").text();

		$('#mm').data("currtab", subtitle);
		$('#tabs').tabs('select', subtitle);
		return false;
	});
}
// 绑定右键菜单事件
function tabCloseEven() {
	// 刷新
	$('#mm-tabupdate').click(function() {
		var currTab = $('#tabs').tabs('getSelected');
		var url = $(currTab.panel('options').content).attr('src');
		$('#tabs').tabs('update', {
			tab : currTab,
			options : {
				content : createFrame(url)
			}
		});
	});
	// 关闭当前
	$('#mm-tabclose').click(function() {
		var currtab_title = $('#mm').data("currtab");
		$('#tabs').tabs('close', currtab_title);
	});
	// 全部关闭
	$('#mm-tabcloseall').click(function() {
		$('.tabs-inner span').each(function(i, n) {
			var t = $(n).text();
			$('#tabs').tabs('close', t);
		});
	});
	// 关闭除当前之外的TAB
	$('#mm-tabcloseother').click(function() {
		$('#mm-tabcloseright').click();
		$('#mm-tabcloseleft').click();
	});
	// 关闭当前右侧的TAB
	$('#mm-tabcloseright').click(function() {
		var nextall = $('.tabs-selected').nextAll();
		if (nextall.length == 0) {
			// msgShow('系统提示','后边没有啦~~','error');
			alert('后边没有啦~~');
			return false;
		}
		nextall.each(function(i, n) {
			var t = $('a:eq(0) span', $(n)).text();
			$('#tabs').tabs('close', t);
		});
		return false;
	});
	// 关闭当前左侧的TAB
	$('#mm-tabcloseleft').click(function() {
		var prevall = $('.tabs-selected').prevAll();
		if (prevall.length == 0) {
			alert('到头了，前边没有啦~~');
			return false;
		}
		prevall.each(function(i, n) {
			var t = $('a:eq(0) span', $(n)).text();
			$('#tabs').tabs('close', t);
		});
		return false;
	});

	// 退出
	$("#mm-exit").click(function() {
		$('#mm').menu('hide');
	});
}
</script>
</head>
<body class="easyui-layout">
	 <div region="north" split="true" border="false" style="overflow: hidden; height: 30px;background: url(/static/img/layout-browser-hd-bg.gif) #7f99be repeat-x center 50%;
        line-height: 20px;color: #fff; font-family: Verdana, 微软雅黑,黑体">
        <span style="float:right; padding-right:20px;" class="head">欢迎 管理员</span>
        <span style="padding-left:10px; font-size: 16px; float:left;"><img src="/static/img/blocks.gif" width="20" height="20" align="absmiddle" /> 运维管理平台</span>
    </div>
	
	<div region="west" split="true" title="导航菜单" style="width:200px;">
		<div id="menu" class="easyui-accordion" data-options="fit:true,border:false,animate:false">
		</div>
	</div>
	
	<div region="center" style="background: #eee; overflow-y:hidden">
		<div id="tabs" class="easyui-tabs"  fit="true" border="false" >
			<div title="欢迎使用" style="padding:20px;overflow:hidden;" id="home">
				<h1>Welcome to using !</h1>
			</div>
		</div>
	</div>
	<div region="south" split="true" style="height: 30px;">
        <div class="footer">版权所有 长安责任保险股份有限公司　copyright © 2009 all rights reserved</div>
    </div>
	
	<div id="mm" class="easyui-menu" style="width:150px;">
		<div id="mm-tabupdate">刷新</div>
		<div class="menu-sep"></div>
		<div id="mm-tabclose">关闭</div>
		<div id="mm-tabcloseall">全部关闭</div>
		<div id="mm-tabcloseother">除此之外全部关闭</div>
		<div class="menu-sep"></div>
		<div id="mm-tabcloseright">当前页右侧全部关闭</div>
		<div id="mm-tabcloseleft">当前页左侧全部关闭</div>
		<div class="menu-sep"></div>
		<div id="mm-exit">退出</div>
	</div>
	
</body>
</html>
<style>
a { color: Black; text-decoration: none; }
.footer { text-align: center; color: #15428B; margin: 0px; padding: 0px; line-height: 23px; font-weight: bold;}
.easyui-accordion ul { list-style-type: none; margin: 0px; padding: 10px; }
.easyui-accordion ul li { padding: 0px; }
.easyui-accordion ul li a { line-height: 24px; }
.easyui-accordion ul li div { margin: 2px 0px; padding-left: 10px; padding-top: 2px; }
.easyui-accordion ul li div.hover { border: 1px dashed #99BBE8; background: #E0ECFF; cursor: pointer; }
.easyui-accordion ul li div.hover a { color: #416AA3; }
.easyui-accordion ul li div.selected { border: 1px solid #99BBE8; background: #E0ECFF; cursor: default; }
.easyui-accordion ul li div.selected a { color: #416AA3; font-weight: bold; }
.icon { background: url(/static/plugin/jquery-easyui/themes/icons/tabicons.png) no-repeat; width: 18px; line-height: 18px; display: inline-block; }
.icon-sys { background-position: 0px -200px; }
.icon-set { background-position: -380px -200px; }
.icon-add { background-position: -20px 0px; }
.icon-add1 { background: url('icon/edit_add.png') no-repeat; }
.icon-nav { background-position: -100px -20px; }
.icon-users { background-position: -100px -480px; }
.icon-role { background-position: -360px -200px; }
.icon-set { background-position: -380px -200px; }
.icon-log { background-position: -380px -80px; }
.icon-delete16 { background: url('icon/delete.gif') no-repeat; width: 18px; line-height: 18px; display: inline-block; }
.icon-delete { background-position: -140px -120px; }
.icon-edit { background-position: -380px -320px; }
.icon-magic { background-position: 0px -500px; }
.icon-database { background-position: -20px -140px; }
.icon-expand { background: url('/images/coll2.gif') no-repeat; }
.icon-collapse { background: url('/images/coll3.gif') no-repeat; }
</style>