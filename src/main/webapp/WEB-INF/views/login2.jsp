<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@include file="include.inc" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html lang="zh_cn">
<script src="<%=basePath%>resources/js/jquery-1.7.2.min.js"></script>  
<script src="<%=basePath%>resources/js/jquery.form.js"></script>
<script type="text/javascript" src="${appctx}/resources/js/manager/cookie_util.js"></script>
<head>
	<title>${sysName}</title>
	<meta charset="UTF-8" />
	<meta http-equiv="X-UA-Compatible" content="IE=8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	<link rel="stylesheet" href="<%=basePath%>resources/bootstrap/css/bootstrap.min.css" />
	<link rel="stylesheet" href="<%=basePath%>resources/bootstrap/css/bootstrap-responsive.min.css" />
</head>
    <body>
        <p>
			欢迎：${sysUser.realName}
			<button style="margin-left:20px;"
				onclick="location.href='/sso/logout'">退出</button>
		</p>
		<ul>
			<% int i=0; %>
			<c:forEach items="${sysList }" var="sys">
				<li><a href="${sys.homeUrl }" target="_blank" id="homeUrl_<%=i++%>">${sys.name}</a>
				</li>
			</c:forEach>
		</ul>
    </body>
</html>

