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

function yuce(type){
	if(type==0){//成交量预测  
		//(240分钟÷前市9：30到看盘时为止的分钟数）×已有成交量（成交股数）
		var fz = $("#fz").val();
		if(!fz){
			alertMsg.warn("分钟数不能为空！");
			return false;
		}
		var cj = $("#cj").val();
		if(!cj){
			alertMsg.warn("成交量不能为空！");
			return false;
		}
		var vol_gs = "(240/"+fz+")*"+cj;
		var vol =  eval(vol_gs);
		$("#yuce_vol").html(vol);
	}else if(type==1){//5日均线预测
		var ma5 = $("#ma5").val();
		if(!ma5){
			alertMsg.warn("MA(5)不能为空！");
			return false;
		}
		var j_end = $("#j_end").val();
		if(!j_end){
			alertMsg.warn("今天收盘价不能为空！");
			return false;
		}
		var f_day_end = $("#f_day_end").val();
		if(!f_day_end){
			alertMsg.warn("5天前收盘不能为空！");
			return false;
		}
		var ma5_gs = ma5+"+("+j_end+"-"+f_day_end+")/5";
		var ma5_tomorrow =  eval(ma5_gs);
		$("#yuce_ma5").html(ma5_tomorrow);
	}
}
</script>
<div class="pageContent">
	<div class="panelBar">
		<ul class="toolBar">
			<li>
				<a class="add" onclick="yuce(0)"><span>成交量预判</span>
				</a>
			</li>
			<li>
				<a class="delete" onclick="yuce(1)"><span>5日均线预判</span>
				</a>
			</li>
		</ul>
	</div>
	<div class="pageFormContent nowrap" layoutH="56">
			<p>
				<label>当天成交量预测：</label>
				<span style="color: red">
					公式：(240分钟÷前市9：30到看盘时为止的分钟数）×已有成交量
				</span>
			</p>
			<p>
			</p>
			<p>
				<label>分钟数：</label>
				<select  id="fz" >
					<option value="15">15分钟</option>
					<option value="30">30分钟</option>
					<option value="45">45分钟</option>
					<option value="60">60分钟</option>
				</select>
			</p>
			<p>
				<label>成交量：</label>
				<input id="cj" value="" type="text" >
			</p>
			<p>
				<label>预测成交量：</label>
				<span id="yuce_vol"></span>
			</p>
			<div class="divider"></div>
			<p>
				<label>5日均线预测：</label>
				<span style="color: red">
					公式：MA(5)+（今天收盘 - 5天前收盘）/5
				</span>
			</p>
			<p>
			</p>
			<p>
				<label>MA(5)5日均线：</label>
				<input type="text"  id="ma5" >
			</p>
			<p>
				<label>今天收盘价：</label>
				<input id="j_end" value="" type="text" >
			</p>
			<p>
				<label>5天前收盘：</label>
				<input id="f_day_end" value="" type="text" >
			</p>
			<p>
			</p>
			<p>
				<label>明日预判5日均价：</label>
				<span id="yuce_ma5"></span>
			</p>
			<div class="divider"></div><div class="divider"></div><div class="divider"></div>
			<p>
			</p>
<p>
	<span>
		<a target="_blank" href="http://cmsjs.eastmoney.com/data/index/yidong.js?callback=yidong&rnd=620276&_=1489129827523">
			东方财富（异动）
		</a>
	</span>
</p>
<p>
	<span>
		<a target="_blank" href="http://stockpage.10jqka.com.cn/spService/000518/Header/realDxjl">
			同花顺（异动）
		</a>
	</span>
</p>
			
			
	</div>
</div>