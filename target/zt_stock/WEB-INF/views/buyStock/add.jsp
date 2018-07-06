<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<div class="pageContent">
	<form method="post" id="formPost" action="<%=basePath%>maintain/buyStock/save" class="pageForm required-validate" onsubmit="return validateCallback(this,navTabAjaxDone)">
	<div class="pageFormContent nowrap" layoutH="56">
			<input name="id" type="hidden" value="${buyStock.id}"/>
			<dl>
				<dt>股票名称</dt>
				<dd><input name="stockName" class="required" type="text" size="30" value="${buyStock.stockName}"/></dd>
			</dl>
			<dl>
				<dt>股票代码</dt>
				<dd><input name="stockCode" class="required" type="text" size="30" value="${buyStock.stockCode}"/></dd>
			</dl>
			<dl>
				<dt>创建时间</dt>
				<dd><input name="createTime" class="required" type="text" size="30" value="${buyStock.createTime}"/></dd>
			</dl>
			<dl>
				<dt>现价</dt>
				<dd><input name="nowPrice" class="required" type="text" size="30" value="${buyStock.nowPrice}"/></dd>
			</dl>
			<dl>
				<dt>跳转多少天</dt>
				<dd><input name="day" class="required" type="text" size="30" value="${buyStock.day}"/></dd>
			</dl>
	</div>
	<div class="formBar">
		<ul>
			<li><div class="buttonActive"><div class="buttonContent"><button type="submit">保存</button></div></div></li>
			<li>
				<div class="button"><div class="buttonContent"><button type="button" class="close">取消</button></div></div>
			</li>
		</ul>
	</div>
	</form>
</div>

