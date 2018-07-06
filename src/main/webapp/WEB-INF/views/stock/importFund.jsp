<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<script type="text/javascript">
function fileUploadDone(json){
	if (json.statusCode == DWZ.statusCode.ok){
		dialogAjaxDone(json);
		$.pdialog.closeCurrent();
	}else{
		dialogAjaxDone(json);
	}
}
</script>
<div class="pageContent">
	<form method="post" id="formPost" action="<%=basePath%>stock/importFundExcel" enctype="multipart/form-data" class="pageForm required-validate" onsubmit="return iframeCallback(this,fileUploadDone)">
	<div class="pageFormContent nowrap" layoutH="56">
			<dl>
				<dt>导入文件（xls格式）</dt>
				<dd>
					<input name="file" type="file" class="required" />
				</dd>
			</dl>
	</div>
	<div class="formBar">
		<ul>
			<li><div class="buttonActive"><div class="buttonContent"><button type="submit">导入</button></div></div></li>
			<li>
				<div class="button"><div class="buttonContent"><button type="button" class="close">取消</button></div></div>
			</li>
		</ul>
	</div>
	</form>
</div>

