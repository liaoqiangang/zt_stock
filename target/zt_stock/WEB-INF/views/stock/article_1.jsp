<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<script>
var _basePath = "${ctx}";
</script>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!doctype html>
<html>
<head>
<base href="<%=basePath %>"></base>
<title>${article.title}</title>
<meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="description" content="">
  <meta name="keywords" content="">
  <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">

  <!-- Set render engine for 360 browser -->
  <meta name="renderer" content="webkit">

  <!-- No Baidu Siteapp-->
  <meta http-equiv="Cache-Control" content="no-siteapp"/>

  <link rel="icon" type="image/ico" href="<%=basePath%>resources/images/login/niuniu.ico">
  <meta name="mobile-web-app-capable" content="yes">
  <meta name="apple-mobile-web-app-capable" content="yes">
  <meta name="apple-mobile-web-app-status-bar-style" content="black">
  <meta name="apple-mobile-web-app-title" content="牛牛金融"/>
  <meta name="msapplication-TileColor" content="#0e90d2">
  <link rel="stylesheet" href="<%=basePath%>resources/css/searchTools/reset.css">
  <link rel="stylesheet" href="<%=basePath%>resources/css/news.css?v=4">
	<style>
		.aplayer-icon-loop{display:none;}
	</style>
</head>
<body>
<div style='margin:0 auto;width:0px;height:0px;overflow:hidden;'>
	<img src="<%=basePath%>resources/images/logo_big.jpg" width="400" height="400"/>
	<input type="hidden" id="fontSize" value="${fontSize}"/>
</div>
<div class="am-container m-container">
	<article class="am-article m-article">
	  <div class="am-article-hd">
	    <h1 class="am-article-title m-article-title">${entity.stockCode}</h1>
	    <p class="am-article-meta">
	  </div>
		<div class="am-article-bd" id="a-content">
	    ${entity.season}
	  </div>
	</article>
</div>
	<c:if test="${!empty rdxw_list}">
	<div class="line"></div>
	<div data-am-widget="list_news" class="am-list-news am-list-news-default am-news" >
  <!--列表标题-->
    <div class="am-list-news-hd am-cf"> <h2>推荐阅读</h2></div>
  <div class="am-list-news-bd">
  <ul class="am-list">
  	<c:forEach items="${rdxw_list}" var="rnews">
        <li class="am-g am-list-item-desced <c:if test="${!empty rnews.newsImg}">am-list-item-thumbed am-list-item-thumb-left</c:if>">
        	<c:if test="${!empty rnews.newsImg}">
        	<div class="am-u-sm-4 am-list-thumb">
	          <a href="${rnews.newsUrl}" class="">
	            <img src="${rnews.newsImg}" onerror="<%=basePath%>resources/images/ren.jpg" class="default"/>
	          </a>
	        </div>
        	</c:if>
        	<div class="<c:if test="${!empty rnews.newsImg}">am-u-sm-8</c:if> am-list-main">
	            <h3 class="am-list-item-hd"><a href="${rnews.newsUrl}" class="am-black">${rnews.title}</a></h3>
	            <div class="am-list-item-text"><fmt:formatDate value="${rnews.createTime}" pattern="yyyy-MM-dd HH:mm"/></div>
	        </div>
        </li>
        </c:forEach>
    </ul>
  </div>
</div>
</c:if>
<div class="wx_show">
	<div class="wx_qrcode">
	<img src="<%=basePath%>resources/images/attention.png" width="98%"/>
	<p>&nbsp;</p>
	</div>
	<div class="m_proTitle ">
		<div>
			<dl>
	  		<dt>
	  			<img src="<%=basePath%>resources/images/logo.jpg"/>
	  		</dt>
	  		<dd>
	  			<h5>牛牛金融</h5>
	  			<span>上市公司市值管理辅助服务平台</span>
	  		</dd>
	  	</dl>
		</div>  	
	  	<button class="am_down am-btn am-btn-primary  am-btn-sm">
			下载
		</button>
			<img src="<%=basePath%>resources/images/off.png" class="off">
	  </div>
	 </div>	  
<script src="<%=basePath%>resources/js/jquery-1.8.3.min.js"></script>
<script src="<%=basePath%>resources/script/APlayer/APlayer.min.js"></script>
<script src="<%=basePath%>resources/js/article/mobile.js?v=2"></script>
<c:if test="${!empty article.articleAudio}">
<script>
var ap1 = new APlayer({
	element: document.getElementById('player1'),
	narrow: false,
	autoplay: true,
	showlrc: false,
	mutex: true,
	theme: '#e6d0b2',
	preload: 'metadata',
	music: {
		title: '',
		author: '',
		url: '${imgDomain}${article.articleAudio.url}',
		pic: '<%=basePath%>resources/images/niuniu.jpg'
	}
});
ap1.init();
</script>
</c:if>
</body>
</html>
