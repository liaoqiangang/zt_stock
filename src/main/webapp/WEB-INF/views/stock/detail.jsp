<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://"
            + request.getServerName() + ":" + request.getServerPort()
            + path + "/";
%>
<style>
    .show tr td {
        line-height: 3em
    }

    p span {
        color: red;
        font-size: 16px;
    }

    .fit_image {
        border: 0;
        max-width: 600px;
        width: expression(　
　　　function(img){　 
　　　　img.onload=function(){　 
　　　　　this.style.width='';　 
　　　　　this.style.width=(this.width>600)?"600px":this.width+"px"　 
　　　　};　 
　　　　return '700px' 
　　　}(this)　 
　　);
    }
</style>
<script type="text/javascript">
    var _basePath = "<%=basePath%>";
    
    function nextStock() {
        var getTimestamp=new Date().getTime();
        var url = "<%=basePath%>stock/detail?stockCode=${stockCode}&timestamp="+getTimestamp;
        console.log(url);
        navTab.reload(url);
    }

</script>


<div class="pageContent">

    <div class="panelBar">
        <ul class="toolBar">
            <li>
                <a class="add" onclick="nextStock(0)"><span>刷新</span>
                </a>
            </li>
        </ul>
    </div>

    <div class="pageFormContent nowrap" layoutH="56">
        <div class="tabs">
            <div class="tabsHeader">
                <div class="tabsHeaderContent">
                    <ul>
                        <li class="selected"><a href="#"><span>分时图</span></a></li>
                        <li><a href="#"><span>日K线图</span></a></li>
                        <li><a href="#"><span>周K线图</span></a></li>
                        <li><a href="#"><span>月K线图</span></a></li>
                    </ul>
                </div>
            </div>
            <div class="tabsContent" style="height:auto;width: auto">
                <div>
                    <img src="http://image.sinajs.cn/newchart/min/n/${stockParamer}.gif" class="fit_image"/>
                </div>
                <div>
                    <img src="http://image.sinajs.cn/newchart/daily/n/${stockParamer}.gif" class="fit_image"/>
                </div>
                <div>
                    <img src="http://image.sinajs.cn/newchart/weekly/n/${stockParamer}.gif" class="fit_image"/>
                </div>
                <div>
                    <img src="http://image.sinajs.cn/newchart/monthly/n/${stockParamer}.gif" class="fit_image"/>
                </div>
            </div>
            <div class="tabsFooter">
                <div class="tabsFooterContent"></div>
            </div>
        </div>
    </div>
</div>