<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@include file="../include.inc" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<script type="text/javascript">
	function resetSubmit() {
	    $("#model").val("");
	    $("#day").val("");
	    $("input[name='createTime']").val("");
        var form = $("#pagerForm");
        console.log(form);
        navTabSearch(form);
    }


</script>
<div class="pageHeader">
	<form id="pagerForm" onsubmit="return navTabSearch(this);" action="<%=basePath%>maintain/buyStock/list" method="post">
		<input type="hidden" name="pageNum" value="${filter.pageNum}" />
		<input type="hidden" name="numPerPage" value="${filter.numPerPage}" />
	<div class="searchBar">
		<table class="searchContent">
			<tr>
				<td>
					<label>类型：</label>
					<select name="model" class="combox required" id="model">
						<option value="">全部</option>
						<option value="关注" <c:if test="${filter.model eq '关注'}">selected="selected"</c:if>>关注</option>
						<option value="买入" <c:if test="${filter.model eq '买入'}">selected="selected"</c:if>>买入</option>
						<option value="加仓" <c:if test="${filter.model eq '加仓'}">selected="selected"</c:if>>加仓</option>
					</select>
				</td>

				<td>
					<label>入选时间：</label>
					<input type="text" name="createTime" class="date" datefmt="yyyyMMdd" value="${filter.createTime}" />
				</td>
				<td>
					<label>回调天数：</label>
					<select name="day" class="combox required" id="day">
						<option value="">全部</option>
						<option value="1" <c:if test="${filter.day==1}">selected="selected"</c:if>>1天</option>
						<option value="2" <c:if test="${filter.day==2}">selected="selected"</c:if>>2天</option>
						<option value="3" <c:if test="${filter.day==3}">selected="selected"</c:if>>3天</option>
						<option value="4" <c:if test="${filter.day==4}">selected="selected"</c:if>>4天</option>
					</select>
				</td>
			</tr>
		</table>
		<div class="subBar">
			<ul>
				<li><div class="buttonActive"><div class="buttonContent"><button onclick="resetSubmit()">重置</button></div></div></li>
				<li><div class="buttonActive"><div class="buttonContent"><button type="submit">检索</button></div></div></li>
			</ul>
		</div>
	</div>
	</form>
</div>
<div class="pageContent">
	<div class="panelBar">
		<ul class="toolBar">
			<li><a class="add" href="<%=basePath%>maintain/buyStock/add" target="navTab"><span>添加</span></a></li>
			<li class="line">line</li>
			<li><a class="delete" href="<%=basePath%>maintain/buyStock/batchDelete/" target="selectedTodo" rel="ids" title="确定要删除吗?"><span>批量删除</span></a></li>
		</ul>
	</div>
	<table class="list" width="100%" layoutH="115">
		<thead>
			<tr>
				<th width="22"><input type="checkbox" group="ids" class="checkboxCtrl"></th>
				<th>序号</th>
				      	<th>盈利比率</th>
				      	<th>股票名称</th>
				      	<th>股票代码</th>
				      	<th>预警时间</th>
				      	<th>预警日期</th>
				      	<th>预警价</th>
				      	<th>涨跌幅</th>
				      	<th>预警类型</th>
				      	<th>备注</th>
				      	<th>回调天数</th>
				<%--<th>操作</th>--%>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${buyStockList}" var="item" varStatus="status">
				<c:if test="${item.ylPortal<=0}">
					<tr target="sid_buyStock" rel="${item.id}" style="color: green">
						<td><input name="ids" value="${item.id}" type="checkbox"></td>
						<td><c:out value="${status.count}"/></td>
						<td><c:out value="${item.ylPortal}%" /></td>
						<td><c:out value="${item.stockName}" /></td>

						<td>

							<a href="<%=basePath%>stock/detail?stockCode=${item.stockCode}" target="navTab" >
								<c:out value="${item.stockCode}" />
							</a>

						</td>

						<td><c:out value="${item.createTime}" /></td>
						<td><c:out value="${item.riqi}" /></td>
						<td><c:out value="${item.nowPrice}" /></td>
						<td><c:out value="${item.zhangdiefu}%" /></td>
						<td>
							${item.model}
						</td>
						<td><c:out value="${item.remark}" /></td>
						<td><c:out value="${item.day}" /></td>
							<%--<td>--%>
							<%--<a class="btnEdit" href="<%=basePath%>maintain/buyStock/edit/${item.id}" target="navTab" title="修改"></a>--%>
							<%--<a class="btnDel" href="<%=basePath%>maintain/buyStock/delete/${item.id}" target="ajaxTodo" title="确定要删除吗?" title="删除"></a>--%>
							<%--</td>--%>
					</tr>
				</c:if>
				<c:if test="${item.ylPortal>0}">
					<tr target="sid_buyStock" rel="${item.id}" style="color: red" >
						<td><input name="ids" value="${item.id}" type="checkbox"></td>
						<td><c:out value="${status.count}"/></td>
						<td><c:out value="${item.ylPortal}%" /></td>
						<td><c:out value="${item.stockName}" /></td>
						<td>
							<a href="<%=basePath%>stock/detail?stockCode=${item.stockCode}" target="navTab" >
								<c:out value="${item.stockCode}" />
							</a>
						</td>
						<td><c:out value="${item.createTime}" /></td>
						<td><c:out value="${item.riqi}" /></td>
						<td><c:out value="${item.nowPrice}" /></td>
						<td><c:out value="${item.zhangdiefu}%" /></td>
						<td>
							${item.model}
						</td>
						<td><c:out value="${item.remark}" /></td>
						<td><c:out value="${item.day}" /></td>
							<%--<td>--%>
							<%--<a class="btnEdit" href="<%=basePath%>maintain/buyStock/edit/${item.id}" target="navTab" title="修改"></a>--%>
							<%--<a class="btnDel" href="<%=basePath%>maintain/buyStock/delete/${item.id}" target="ajaxTodo" title="确定要删除吗?" title="删除"></a>--%>
							<%--</td>--%>
					</tr>
				</c:if>




			</c:forEach>
			
		</tbody>
	</table>
	<%@include file="../common/page.inc" %>
</div>
