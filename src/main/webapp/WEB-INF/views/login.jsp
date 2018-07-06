<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html lang="zh_cn">
<script src="<%=basePath%>resources/js/jquery-1.7.2.min.js"></script>
<script src="<%=basePath%>resources/js/jquery.form.js"></script>
<script type="text/javascript"
	src="${appctx}/resources/js/manager/cookie_util.js"></script>
<script type="text/javascript" src="${appctx}/resources/js/md5.js"></script>
<script type="text/javascript">
	var UNAME_COOKIE_NAME = "lastLoginUserName";
	
	$(function() {
		// 如果name没有value，将cookie中存储过的name值写入
		var eleName = $("input[name=userName]");
		eleName.val(Cookie.get(UNAME_COOKIE_NAME));
		
		// 登录按钮被点击时记住当前name
		$("form").submit(function() {
			Cookie.set(UNAME_COOKIE_NAME, $.trim(eleName.val()), null, 7 * 24 * 60);
		});
		// 加载验证码
		drawCaptcha();
	});
	
	function drawCaptcha() {	
		$.ajax({ 
			type: "GET",
			url: "${appctx}/sso/preLogin?id="+Math.random(),
			cache: false,
			dataType: "json",
			success: function(data){
				$("#captchaImg").attr("src", data.imgData);
			},
			error:function(){
				alert("验证码加载失败");
			}
		});
	}
</script>
<head>
<title>后台管理系统</title>
<meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=8">
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<link rel="stylesheet"
	href="<%=basePath%>resources/bootstrap/css/bootstrap.min.css" />
<link rel="stylesheet"
	href="<%=basePath%>resources/bootstrap/css/bootstrap-responsive.min.css" />
<link rel="stylesheet"
	href="<%=basePath%>resources/bootstrap/css/matrix-login.css" />
</head>
<body>
		<div id="loginbox">
			<form id="loginform" class="form-vertical"
				action="<%=basePath%>sso/login" method="post">
				<div class="control-group normal_text">
					<h3>后台管理系统</h3>
				</div>
				<input type="hidden" name="backUrl" value="${backUrl }"   />
				<input type="hidden" name="notLogin"  value="${notLogin }" />
				<div class="control-group">
					<div class="controls">
						<div class="main_input_box">
							<span class="add-on bg_lg"><i class="icon-user"></i>
							</span><input type="text" name="userName" value="" placeholder="用户名" />
						</div>
					</div>
				</div>
				<div class="control-group">
					<div class="controls">
						<div class="main_input_box">
							<span class="add-on bg_ly"><i class="icon-lock"></i>
							</span><input type="password" name="password" placeholder="密码" />
						</div>
					</div>
				</div>
				<div class="main_input_box">
					<span class="control-group normal_text">验证码</span> <input
						style="width:80px;height:22px;" type="text" name="captcha"
						autocomplete="off" /> <img src="" onclick="drawCaptcha();"
						id="captchaImg" style="cursor:pointer;">
				</div>
				<div class="form-actions">
					<c:if test="${not empty errorMsg}">
						<span style="color:red;font-weight:bold;">${errorMsg}</span>
					</c:if>
					<span
						class="pull-right"><input type="submit" id="loginBtn"
						class="btn btn-success" value="登录" />
					</span>
				</div>
			</form>
		</div>
</body>
</html>

