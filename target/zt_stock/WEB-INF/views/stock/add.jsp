<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<link rel="stylesheet" type="text/css" href="<%=basePath%>resources/statics/js/artDialog/skins/default.css" />
<link href="<%=basePath%>resources/uploadpicture/css/imgareaselect-default.css" rel="stylesheet" type="text/css" /> 
<style type="text/css" media="screen">
.pic_list{margin-top: 37px;}
.pic_list li{float: left;margin: 5px;position: relative;}
.btn_del{position: absolute;top: -6px;right:-5px;background-color: red;color: #fff;padding:3px 4px 2px;border-radius: 10px;text-align: center;cursor: pointer;}
</style>
<script type="text/javascript">
function relCloseAjaxDone(json){
	if(json.statusCode==200){
   	 	$("#stockId").val(json.stockId);
   	 	var submitType = $("#submitType").val();
	 	if(submitType=="0"){//关闭
   	 		window.parent.closexiugai();
 	 	}else if(submitType=="1"){//刷新
   	 		window.parent.addStock();
 	 	}
   	}else{
   	 	alertMsg.warn(json.message);
	}
}

function save(submitType){
	$("#submitType").val(submitType);
}

$(function(){
	//关闭刷新
	$(".close").click(function(){
   	 	window.parent.refreshListPage();
	});
	
	//文件上传
	$("#uploadFile").live("click",function(){ 
		var result = true;
		var stockId = $("#stockId").val();
		if(stockId==""||stockId==undefined){
			alertMsg.warn("请先保持股票信息，再上传附件！");
			result = false;
			return false;
		}
		if(result){
			omnipotent("upfile","/stock/swfuploadPage?id="+stockId,"上传文件");
		}
	}); 
});

//弹出对话框
function omnipotent(id, linkurl, title, close_type, w, h) {
    if (!w) w = 600;
    if (!h) h = 400;
    art.dialog.open(linkurl, {
        id: id,
        title: title,
        width: w,
        height: h,
        lock: true,
        fixed: true,
        background:"#CCCCCC",
        top:"5%",
        opacity:0,
        button: [{
            name: '确定',
            callback: function () {
                if (close_type == 1) {
                    return true;
                } else {
                    var d = this.iframe.contentWindow;
                    var fileId = d.document.getElementById('fileId').value;
                    var data = d.document.getElementById('return_data').value;
                    data = data.split(',');
					//附件aid
					var id = data[0];
					//附件地址
					var src = data[1];
					//附件类型
					var ext = data[2];
					//附件名称
					var filename = data[3];
					//上传失败，提示上传信息
					if(id != 0) {
						$("#fileId").val(src);
					} 
                }
                return true;
           },
           focus: true
        }]
    });
}

</script>
<div class="pageContent">
	<form method="post" id="formPost" action="<%=basePath%>stock/save" class="pageForm required-validate" onsubmit="return validateCallback(this, relCloseAjaxDone)">
	<div class="pageFormContent nowrap" layoutH="56">
			<input name="id" id="stockId" type="hidden" value="${entity.id}"/>
			
			<p>
				<label>股票名称</label>
				<input name="stockName" class="required" type="text" size="30" value="${entity.stockName}"/>
			</p>
			
			<p>
				<label>股票代码</label>
				<input name="stockCode" class="required" type="text" size="30" value="${entity.stockCode}"/>
			</p>
			<p>
				<label>入选类型：</label>
				<select name="type"  class="combox required" id="type">
					<option value="圈子" <c:if test="${entity.type eq '圈子'}">selected="selected"</c:if>>圈子</option>
					<option value="优股籍" <c:if test="${entity.type eq '优股籍'}">selected="selected"</c:if>>优股籍</option>
					<option value="短线宝" <c:if test="${entity.type eq '短线宝'}">selected="selected"</c:if>>短线宝</option>
				</select>
			</p>
			<%-- <p>
				<label>板块：</label>
					<select name="plate" class="combox required" id="plate">
						<option value="上交所" <c:if test="${entity.plate eq '上交所'}">selected="selected"</c:if>>上交所</option>
						<option value="中小板" <c:if test="${entity.plate eq '中小板'}">selected="selected"</c:if>>中小板</option>
						<option value="创业板" <c:if test="${entity.plate eq '创业板'}">selected="selected"</c:if>>创业板</option>
					</select>
			</p> --%>
			<p>
				<label>入选时间：</label>
				<input type="text" name="selTime" class="date" datefmt="yyyy-MM-dd" value="<fmt:formatDate value="${entity.selTime}" pattern="yyyy-MM-dd"/>"  />
			</p>
			<p>
				<label>关联文件</label>
					<input name="fileUrl"  id="fileId" class="" type="text" size="35" readonly="readonly"
						value="${entity.fileUrl}" />
			</p>
			<p>
				<label>&nbsp;&nbsp;&nbsp;&nbsp;</label>
				&nbsp;&nbsp;&nbsp;&nbsp;
				<input type="button" class="u_btnStyle"  id="uploadFile" value="上传"/>
			</p>
			<p>
				<label>入选原因：</label>
				<textarea name="season" id="season" rows="10" cols="88">${entity.season}</textarea>
			</p>
	</div>
	<div class="formBar">
		<input id="submitType" value="" type="hidden">
		<button type="submit" style="display: none">保存</button>
		<ul>
			<li><div class="buttonActive"><div class="buttonContent">
				<button onclick="save(-1)">保存</button>&nbsp;&nbsp;&nbsp;&nbsp;
			</div></div></li>
			<li><div class="buttonActive"><div class="buttonContent">
				<button onclick="save(1)">保存并刷新</button>&nbsp;&nbsp;&nbsp;&nbsp;
			</div></div></li>
			<li><div class="buttonActive"><div class="buttonContent">
				<button onclick="save(0)">保存并关闭</button>&nbsp;&nbsp;&nbsp;&nbsp;
			</div></div></li>
			<li>
				<div class="button"><div class="buttonContent"><button type="button" class="close">取消</button></div></div>
			</li>
		</ul>
	</div>
	</form>
</div>
 <script type="text/javascript" src="<%=basePath%>resources/statics/js/artDialog/artDialog.js"></script>
 <script type="text/javascript" src="<%=basePath%>resources/statics/js/artDialog/iframeTools.js"></script>
  
