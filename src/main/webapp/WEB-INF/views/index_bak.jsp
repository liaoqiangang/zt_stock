<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=7" />
<title>豆豆后台管理系统</title>

<link href="<%=basePath%>resources/dwz/themes/default/style.css" rel="stylesheet" type="text/css" media="screen"/>
<link href="<%=basePath%>resources/dwz/themes/css/core.css" rel="stylesheet" type="text/css" media="screen"/>
<link href="<%=basePath%>resources/dwz/themes/css/print.css" rel="stylesheet" type="text/css" media="print"/>
<link href="<%=basePath%>resources/dwz/uploadify/css/uploadify.css" rel="stylesheet" type="text/css" media="screen"/>
<!--[if IE]>
<link href="themes/css/ieHack.css" rel="stylesheet" type="text/css" media="screen"/>
<![endif]-->

<script src="<%=basePath%>resources/dwz/js/speedup.js" type="text/javascript"></script>
<script src="<%=basePath%>resources/js/jquery-1.7.2.js" type="text/javascript"></script>
<script src="<%=basePath%>resources/js/jquery.cookie.js" type="text/javascript"></script>
<script src="<%=basePath%>resources/js/jquery.validate.js" type="text/javascript"></script>
<script src="<%=basePath%>resources/js/jquery.qrcode.min.js" type="text/javascript"></script>
<script src="<%=basePath%>resources/js/jquery.bgiframe.js" type="text/javascript"></script>
<script src="<%=basePath%>resources/dwz/xheditor/xheditor-1.2.1.min.js" type="text/javascript"></script>
<script src="<%=basePath%>resources/dwz/uploadify/scripts/jquery.uploadify.js" type="text/javascript"></script>
<script src="<%=basePath%>resources/dwz/js/dwz.core.js" type="text/javascript"></script>
<script src="<%=basePath%>resources/dwz/js/dwz.util.date.js" type="text/javascript"></script>
<script src="<%=basePath%>resources/dwz/js/dwz.validate.method.js" type="text/javascript"></script>
<script src="<%=basePath%>resources/dwz/js/dwz.barDrag.js" type="text/javascript"></script>
<script src="<%=basePath%>resources/dwz/js/dwz.drag.js" type="text/javascript"></script>
<script src="<%=basePath%>resources/dwz/js/dwz.tree.js" type="text/javascript"></script>
<script src="<%=basePath%>resources/dwz/js/dwz.accordion.js" type="text/javascript"></script>
<script src="<%=basePath%>resources/dwz/js/dwz.ui.js" type="text/javascript"></script>
<script src="<%=basePath%>resources/dwz/js/dwz.theme.js" type="text/javascript"></script>
<script src="<%=basePath%>resources/dwz/js/dwz.switchEnv.js" type="text/javascript"></script>
<script src="<%=basePath%>resources/dwz/js/dwz.alertMsg.js" type="text/javascript"></script>
<script src="<%=basePath%>resources/dwz/js/dwz.contextmenu.js" type="text/javascript"></script>
<script src="<%=basePath%>resources/dwz/js/dwz.navTab.js" type="text/javascript"></script>
<script src="<%=basePath%>resources/dwz/js/dwz.tab.js" type="text/javascript"></script>
<script src="<%=basePath%>resources/dwz/js/dwz.resize.js" type="text/javascript"></script>
<script src="<%=basePath%>resources/dwz/js/dwz.dialog.js" type="text/javascript"></script>
<script src="<%=basePath%>resources/dwz/js/dwz.dialogDrag.js" type="text/javascript"></script>
<script src="<%=basePath%>resources/dwz/js/dwz.sortDrag.js" type="text/javascript"></script>
<script src="<%=basePath%>resources/dwz/js/dwz.cssTable.js" type="text/javascript"></script>
<script src="<%=basePath%>resources/dwz/js/dwz.stable.js" type="text/javascript"></script>
<script src="<%=basePath%>resources/dwz/js/dwz.taskBar.js" type="text/javascript"></script>
<script src="<%=basePath%>resources/dwz/js/dwz.ajax.js" type="text/javascript"></script>
<script src="<%=basePath%>resources/dwz/js/dwz.pagination.js" type="text/javascript"></script>
<script src="<%=basePath%>resources/dwz/js/dwz.database.js" type="text/javascript"></script>
<script src="<%=basePath%>resources/dwz/js/dwz.datepicker.js" type="text/javascript"></script>
<script src="<%=basePath%>resources/dwz/js/dwz.effects.js" type="text/javascript"></script>
<script src="<%=basePath%>resources/dwz/js/dwz.panel.js" type="text/javascript"></script>
<script src="<%=basePath%>resources/dwz/js/dwz.checkbox.js" type="text/javascript"></script>
<script src="<%=basePath%>resources/dwz/js/dwz.history.js" type="text/javascript"></script>
<script src="<%=basePath%>resources/dwz/js/dwz.combox.js" type="text/javascript"></script>
<script src="<%=basePath%>resources/dwz/js/dwz.print.js" type="text/javascript"></script>
 

<%--<script src="<%=basePath%>resources/dwz/js/dwz.min.js" type="text/javascript"></script>--%>
<script src="<%=basePath%>resources/dwz/js/dwz.regional.zh.js" type="text/javascript"></script>
<script type="text/javascript">
$(function(){
	DWZ.init("<%=basePath%>resources/dwz/dwz.frag.xml", {
		//loginUrl:"<%=basePath%>security/login",
		loginUrl:"<%=basePath%>maintain",
		statusCode:{ok:200, error:500, timeout:301}, //【可选】
		debug:false,	// 调试模式 【true|false】
		callback:function(){
			initEnv();
			$("#themeList").theme({themeBase:"resources/dwz/themes"}); // themeBase 相对于index页面的主题base路径
		}
	});
});
_baseAppPath = "<%=basePath%>";
</script>
<style>
	.logo_text {color:#ffffff;font-size:2em;line-height:2.2em; margin-left:5px;font-weight: bold;}
</style>
</head>

<body scroll="no">
	<div id="layout">
		<div id="header">
			<div class="headerNav">&nbsp; 
				<span class="logo_text">豆豆后台管理系统</span>
				<ul class="nav">
					<li><a>欢迎您，豆豆</a></li>
				</ul>
			</div>
		</div>

		<div id="leftside">
			<div id="sidebar_s">
				<div class="collapse">
					<div class="toggleCollapse"><div></div></div>
				</div>
			</div>
			<div id="sidebar">
				<div class="toggleCollapse"><h2>主菜单</h2><div>收缩</div></div>

				<div class="accordion" fillSpace="sidebar">
					<div class="accordionHeader">
						<h2><span>Folder</span>搜索引擎</h2>
					</div>
					<div class="accordionContent">
						<ul class="tree treeFolder">
							<li><a href="https://www.baidu.com/" target="navTab" rel="listSysMenu">测试用列</a></li>
							
							<li><a href="https://www.baidu.com/" target="navTab" rel="listSysMenu">百度</a></li>
							
							<li><a href="https://www.sogou.com/" target="navTab" rel="listSysMenu">搜狗</a></li>
							
							<li><a href="https://www.so.com/" target="navTab" rel="listSysMenu">360搜索</a></li>
							
<!-- 							<li><a href="/html/build.html" target="navTab" rel="listSysMenu">360搜索</a></li> -->
						</ul>
					</div>
				    <div class="accordionHeader">
						<h2><span>Folder</span>股票池</h2>
					</div>
					<div class="accordionContent">
						<ul class="tree treeFolder">
							<li><a href="<%=basePath%>stock/list?selType=1" target="navTab" rel="listSysMenu">精选股票池</a></li>
							
							<li><a href="<%=basePath%>stock/list?type=2&selType=1" target="navTab" rel="listSysMenu">圈子</a></li>
							
							<li><a href="<%=basePath%>stock/list?type=0&selType=1" target="navTab" rel="listSysMenu">优股籍</a></li>

							<li><a href="<%=basePath%>stock/list?type=1&selType=1" target="navTab" rel="listSysMenu">短线宝</a></li>
							
							<li><a href="<%=basePath%>stock/yuce" target="navTab" rel="listSysMenu">预测</a></li>
							
<!-- 						<li><a href="<%=basePath%>maintain/stockInfo/list" target="navTab" rel="listSysMenu">上市公司列表</a></li>
							<li><a href="<%=basePath%>fetch/tofetchstock/000001" target="navTab" rel="listSysMenu">抓取</li> -->
						</ul>
					</div> 
				</div>
			</div>
		</div>
		<div id="container">
			<div id="navTab" class="tabsPage">
				<div class="tabsPageHeader">
					<div class="tabsPageHeaderContent"><!-- 显示左右控制时添加 class="tabsPageHeaderMargin" -->
						<ul class="navTab-tab">
							<li tabid="main" class="main"><a href="javascript:void(0)"><span><span class="home_icon">首页</span></span></a></li>
						</ul>
					</div>
					<div class="tabsLeft">left</div><!-- 禁用只需要添加一个样式 class="tabsLeft tabsLeftDisabled" -->
					<div class="tabsRight">right</div><!-- 禁用只需要添加一个样式 class="tabsRight tabsRightDisabled" -->
					<div class="tabsMore">more</div>
				</div>
				<ul class="tabsMoreList">
					<li><a href="javascript:void(0)">首页</a></li>
				</ul>
				<div class="navTab-panel tabsPageContent layoutBox">
					<div>
						<div class="accountInfo">
							<div class="right">
							</div>
							<p><span>欢迎进入豆豆后台管理系统</p>
						</div>
						<div class="pageFormContent" layoutH="80">
								<span style="color: red;font-size: 58px;text-align: center;">学习成就梦想！</span>
								
								<table class="list" width="100%" layoutH="115">
									<thead>
										<tr>
											<th>名称</th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<td>内容</td>
											<td>内容</td>
										</tr>
										<tr>
											<td>内容</td>
											<td>内容</td>
										</tr>
										<tr>
											<td>内容</td>
											<td>内容</td>
										</tr>
										<tr>
											<td>内容</td>
											<td>内容</td>
										</tr>
										
									</tbody>
								</table>
						</div>
					</div>
				</div>
			</div>
		</div>

	</div>
</body>
</html>
