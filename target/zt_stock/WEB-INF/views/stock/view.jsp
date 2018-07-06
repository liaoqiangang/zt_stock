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
<style>
.show tr td {
	line-height: 3em
}
p span{
color: red;
font-size: 16px;
}

.fit_image 
{ 
border:0; 
max-width:600px; 
width:expression(　 
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
function nextStock(nextType){
	var stockId = $("#stockId").val();
	if(stockId){
		$.ajax({
	         url: _basePath+"stock/nextStock/"+stockId+"?nextType="+nextType,
	         type: "get",
	         dataType: "json",
	         success: function (data) {
				if(data.msg=="ok"){
		         	printData(data);
	         	}else if(data.msg=="error"){
		         	alertMsg.warn("数据获取异常！");
	         	}else if(data.msg=="null"){
		         	alertMsg.warn("无数据！");
	         	} 			
	         },
	         error: function () {
	         }
	    });
    }else{
    	alertMsg.warn("ID为空！");
    }
}

function printData(data){
	var entity = data.entity;
	var stockId = data.stockId;
	if(stockId){
		$("#stockId").val(stockId);
	}
	$("#stockName").html(entity.stockName);
	$("#stockCode").html(entity.stockCode);
	$("#type").html(entity.type);
	$("#plate").html(entity.plate);
	$("#selTime").html(entity.showSelTime);
	$("#season").html(entity.season);
	if(entity.fileUrl){
		$("#fileUrl").attr("src",entity.fileUrl);
	}else{
		$("#fileUrl").attr("src","");
	}
}
</script>
<div class="pageContent">
	<div class="panelBar">
		<ul class="toolBar">
			<li>
				<a class="add" onclick="nextStock(0)"><span>上一条</span>
				</a>
			</li>
			<li>
				<a class="delete" onclick="nextStock(1)"><span>下一条</span>
				</a>
			</li>
		</ul>
	</div>
	<div class="pageFormContent nowrap" layoutH="56">
		<input type="hidden" id="stockId" value="${entity.id }">
		<table class="list show" width="99%" nowrapTD="false">
			<p>
				<label>股票名称：</label>
				<span id="stockName">${entity.stockName}</span>
			</p>
			<p>
				<label>股票代码：</label>
				<span id="stockCode">${entity.stockCode}</span>
			</p>
			<p>
				<label>入选类型：</label>
				<span id="type">${entity.type}</span>
			</p>
			<p>
				<label>板块：</label>
				<span id="plate">${entity.plate}</span>
			</p>
			<p>
				<label>入选时间：</label>
				<span id="selTime"><fmt:formatDate value="${entity.selTime}"
						pattern="yyyy-MM-dd" /></span>
			</p>
			<p>
				<label>图片信息：</label>
				<img src="${entity.fileUrl}" id="fileUrl" class="fit_image"/>
			</p>
			<p>
				<label>备注：</label>
				<span id="season">${entity.season}</span>
			</p>
		</table>
	</div>
</div>