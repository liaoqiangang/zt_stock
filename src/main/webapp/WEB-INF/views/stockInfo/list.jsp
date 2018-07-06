<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@include file="../include.inc" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<div class="pageHeader">
	<form id="pagerForm" onsubmit="return navTabSearch(this);" action="<%=basePath%>maintain/stockInfo/list" method="post">
		<input type="hidden" name="pageNum" value="${filter.pageNum}" />
		<input type="hidden" name="numPerPage" value="${filter.numPerPage}" />
	<div class="searchBar">
		<table class="searchContent">
			<tr>
				<td>
				</td>
			</tr>
		</table>
		<div class="subBar">
			<ul>
				<li><div class="buttonActive"><div class="buttonContent"><button type="submit">检索</button></div></div></li>
			</ul>
		</div>
	</div>
	</form>
</div>
<div class="pageContent">
	<div class="panelBar">
		<ul class="toolBar">
			<li><a class="add" href="<%=basePath%>maintain/stockInfo/add" target="navTab"><span>添加</span></a></li>
			<li class="line">line</li>
<!-- 			<li><a class="delete" href="<%=basePath%>maintain/stockInfo/batchDelete/" target="selectedTodo" rel="ids" title="确定要删除吗?"><span>批量删除</span></a></li> -->
		</ul>
	</div>
	<table class="list" width="100%" layoutH="115">
		<thead>
			<tr>
				<th width="22"><input type="checkbox" group="ids" class="checkboxCtrl"></th>
				<th>序号</th>
				      	<th>股票代码</th>
				      	<th>公司简称</th>
				      	<th>股票类型</th>
				      	<th>上市日期</th>
				<!-- <th>操作</th> -->
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${stockInfoList}" var="item" varStatus="status">
				<tr target="sid_stockInfo" rel="${item.id}">
					<td><input name="ids" value="${item.id}" type="checkbox"></td>
					<td><c:out value="${status.count}"/></td>
					    <td><c:out value="${item.stockCode}" /></td>
					    <td><c:out value="${item.stockName}" /></td>
					    <td><c:out value="${item.stockType}" /></td>
					    <td><fmt:formatDate value="${item.listedTime}" pattern="yyyy-MM-dd"/></td>
					<%-- <td>
						<a class="btn" href="<%=basePath%>fetch/fetch/${item.stockCode}" target="ajaxTodo" title="确定抓取嘛？">抓取机构投资者</a>
					</td> --%>
				</tr>
			</c:forEach>
			
		</tbody>
	</table>
	<%@include file="../common/page.inc" %>
</div>
