<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<script type="text/javascript">
</script>
<div class="pageContent">
<div class="panelBar">
		<ul class="toolBar">
			<%-- <li><a class="add" href="<%=basePath%>fetch/ajaxFetchStock/1" target="ajaxTodo"><span>抓取基金持股持股信息</span></a></li>
			<li class="line">line</li>
			<li><a class="add" href="<%=basePath%>fetch/ajaxFetchStock/2" target="ajaxTodo"><span>抓取基金机构的公司信息，详细信息，基金经理</span></a></li>
			<li class="line">line</li>
			<li><a class="add" href="<%=basePath%>fetch/ajaxFetchStock/3" target="ajaxTodo"><span>抓取行业信息</span></a></li>
			<li class="line">line</li>
			<li><a class="add" href="<%=basePath%>fetch/ajaxFetchStock/4" target="ajaxTodo"><span>抓取板块信息</span></a></li>
			<li class="line">line</li>
			<li><a class="add" href="<%=basePath%>fetch/ajaxFetchStock/5" target="ajaxTodo"><span>抓取实时股价</span></a></li>
			<li class="line">line</li>
			<li><a class="icon" href="<%=basePath%>fetch/toImportFund" target="dialog" width="720"><span>基金信息导入</span></a></li>
			<li class="line">line</li>
			<li><a class="add" href="<%=basePath%>fetch/ajaxFetchStock/6" target="ajaxTodo"><span>抓取其他基金</span></a></li>
			<li class="line">line</li> --%>
			<li><a class="add" href="<%=basePath%>fetch/ajaxFetchStock/7" target="ajaxTodo"><span>抓取基金重仓持股</span></a></li>
		</ul>
	</div>
</div>
	
	

