<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@include file="../common/include.inc" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<script type="text/javascript">
function closexiugai(){
	navTab.closeTab("xiugai");
	var form = $("#pagerForm");
	navTabSearch(form);
}
function addStock(){
	$(".add").click();
}

function refreshListPage(){
	var form = $("#pagerForm");
	navTabSearch(form);
}
</script>
<div class="pageHeader">
	<form id="pagerForm" onsubmit="return navTabSearch(this);" action="<%=basePath%>stock/list" method="post">
		<input type="hidden" name="pageNum" value="${filter.pageNum}" />
		<input type="hidden" name="numPerPage" value="${filter.numPerPage}" />
	<div class="searchBar">
		<table class="searchContent">
			<tr>
				<td>
				<label>入选时间：</label>
					<input type="text" name="startTime" class="date" datefmt="yyyy-MM-dd" value="<fmt:formatDate value="${filter.startTime}" pattern="yyyy-MM-dd"/>" />
				<%-- 至
					<input type="text" name="endTime" class="date" datefmt="yyyy-MM-dd HH:mm:ss" value="<fmt:formatDate value="${filter.endTime}" pattern="yyyy-MM-dd HH:mm:ss"/>"  />
				 --%></td>
			<%-- 	<td>
					<label>入选类型：</label>
					<select name="type"  class="combox required" id="type">
						<option value="">全部</option>
						<option value="圈子" <c:if test="${filter.type eq '圈子'}">selected="selected"</c:if>>圈子</option>
						<option value="优股籍" <c:if test="${filter.type eq '优股籍'}">selected="selected"</c:if>>优股籍</option>
						<option value="短线宝" <c:if test="${filter.type eq '短线宝'}">selected="selected"</c:if>>短线宝</option>
					</select>
				</td> --%>
				<td>
					<label>板块：</label>
					<select name="plate" class="combox required" id="plate">
						<option value="">全部</option>
						<option value="沪市主板" <c:if test="${filter.plate eq '沪市主板'}">selected="selected"</c:if>>沪市主板</option>
						<option value="深市主板" <c:if test="${filter.plate eq '深市主板'}">selected="selected"</c:if>>深市主板</option>
						<option value="中小板" <c:if test="${filter.plate eq '中小板'}">selected="selected"</c:if>>中小板</option>
						<option value="创业板" <c:if test="${filter.plate eq '创业板'}">selected="selected"</c:if>>创业板</option>
					</select>
				</td>
			</tr>
			<tr>
				<td>
					<label>股票简称：</label>
					<input type="text" name="stockName" value="${filter.stockName}"/>
				</td>
				<td>
					<label>股票代码：</label>
					<input type="text" name="stockCode" value="${filter.stockCode}"/>
				</td>
				<%-- <td>
					<label>备注：</label>
					<input type="text" name="season" value="${filter.season}"/>
				</td> --%>
			</tr>
		</table>
		<div class="subBar">
			<ul>
				<li><div class="buttonActive"><div class="buttonContent"><button type="submit" id="sc_id">检索</button></div></div></li>
			</ul>
		</div>
	</div>
	</form>
</div>
<div class="pageContent">
	<div class="panelBar">
		<ul class="toolBar">
			<li><a class="add" href="<%=basePath%>stock/add?addType=${addType}" target="navTab" rel="xiugai" ><span>添加</span></a></li>
			<li><a class="edit" href="<%=basePath%>stock/edit/{sid_stock}" target="navTab" rel="xiugai" ><span>编辑</span></a></li>
			<li><a class="delete" href="<%=basePath%>stock/delete/{sid_stock}" target="ajaxTodo"  title="确定要删除吗?"><span>删除</span></a></li>
			<li><a class="icon" href="<%=basePath%>stock/edit/{sid_stock}?relType=1" target="navTab" ><span>查看详情</span></a></li>
			
			<li><a class="icon" href="<%=basePath%>stock/toImportFund" target="dialog" width="720"><span>涨停股票导入</span></a></li>
			<li><a class="add" href="<%=basePath%>stock/edit/{sid_stock}?relType=1" target="navTab" ><span>查看详情</span></a></li>
		</ul>
	</div>
	<table class="list" width="100%" layoutH="138">
		<thead>
			<tr>
				<th width="22"><input type="checkbox" group="ids" class="checkboxCtrl"></th>
				<th>序号</th>
				<th>涨跌幅</th>
				<th>现价</th>
				<th>股票</th>
				<th>备注</th>
				<th>买入价/加仓价</th>
				<th>板块</th>
				<th>入选时间</th>
				<th>操作</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${stockList}" var="item" varStatus="status">
				<tr target="sid_stock" rel="${item.id}">
					<td><input name="ids" value="${item.id}" type="checkbox"></td>
					<td><c:out value="${status.count}"/></td>
					<c:choose>
						<c:when test="${item.zdf>0 }">
							<td style="color:red">
								 <span style=" text-align:right; ">${item.zdf }%</span>
							</td>
							<td style="color:red" id="buy_${status.count}">
								<span style=" text-align:left; ">${item.buy}  </span>
							</td>
						</c:when>
						<c:otherwise>
							<td style="color:green">
								 <span style=" text-align:right; ">${item.zdf }%</span>
							</td>
							<td style="color:green" id="buy_${status.count}">
								<span style=" text-align:left; ">${item.buy}  </span>
							</td>
						</c:otherwise>
					</c:choose>
					<c:choose>
						<c:when test="${item.orderNum==1 }">
							<td style="color:red" id="show_${status.count}"><c:out value="${item.stockName}"/>(<c:out value="${item.stockCode}"/>)</td>
							<td style="color:red" id="reason_${status.count}">
								${item.season }
							</td>
							<td>${item.lPrice}/${item.zClose}</td>
							<td style="color:red"><c:out value="${item.plate}"/></td>
							<td style="color:red"><fmt:formatDate value="${item.selTime }" pattern="yyyy-MM-dd"/></td>
						</c:when>
						<c:otherwise>
							<td><c:out value="${item.stockName}"/>(<c:out value="${item.stockCode}"/>)</td>
							<td id="reason_${status.count}">
								${item.season }
							</td>
							<td>${item.lPrice}/${item.zClose}</td>
							<td><c:out value="${item.plate}"/></td>
							<td><fmt:formatDate value="${item.selTime }" pattern="yyyy-MM-dd"/></td>
						</c:otherwise>
					</c:choose>
						<td>
								<c:if test="${item.buy<item.lPrice}">
									买入
								</c:if>
						</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<%@include file="../common/page.inc" %>
</div>

<script type="text/javascript">
var str    = "My blog name is Benjamin-专注前端开发和用户体验",
   substr = "Benjamin";

function isContains(str, substr) {
    return str.indexOf(substr) >= 0;
}
function trimStr(str){
	return str.replace(/(^\s*)|(\s*$)/g,"");
}
$(function(){
	$("td[id^=buy_]").each(function(){
		var _this = $(this);
		var buy_id = _this.attr("id");
		var now_price = _this.text();
		var num = buy_id.split("_")[1];
		var reason = $("#reason_"+num).text();
//		if(isContains(reason, trimStr(now_price))){
//			$("#reason_"+num).attr("style","color:#ff1493");
//		}
	});	
});
</script>