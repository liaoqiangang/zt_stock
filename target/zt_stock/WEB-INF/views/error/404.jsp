<%@ page contentType="text/html;charset=UTF-8" isErrorPage="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<title>404 - 访问页面出错</title>
	<style>
	.m_notFound{ font-family:"微软雅黑";max-width:1010px;margin:0 auto;overflow: auto;}
	.m_notFound_1{ width:580px; height:auto; margin:0;float: right;}
	.m_notFound_1 h1,h2,h3{ text-align:center; font-weight:normal;}
	.m_notFound_1 h1{ color:#C4C4C4; font-size:10em;margin:0;}
	.m_notFound_1 h2{ color:#514C46; font-size:2em; line-height:2em;margin:0;}
	.m_notFound_1 h3{ color:#C4C4C4; font-size:25px;margin:0;}
	.m_notFound_2{ width:385px; height:405px; margin-top:50px; background-image:url(/resources/images/portals/404img_03.png);float:left;}
	.m_notFound_2 p{ margin-left:321px; font-size:24px; color:#C4C4C4; width:300px; line-height:13em;}
	</style>	
</head>

<body>
    <div class="m_notFound">
    	<div class="m_notFound_1">
    	<h1>404</h1><h2>很抱歉!</h2><h3>你需要的页面没有找到</h3></div>
        <div class="m_notFound_2"><p>%@#$&amp;*%........</p></div>
        <div style="display:none">
        <div>错误状态代码：${pageContext.errorData.statusCode}</div>
		<div>错误发生页面：${pageContext.errorData.requestURI}</div>
		<div>错误信息：<br/>
		${pageContext.exception}
		<c:forEach var="trace" items="${pageContext.exception.stackTrace}">
			${trace}
		</c:forEach>
		</div>
        </div>
    </div>
</body>
</html>