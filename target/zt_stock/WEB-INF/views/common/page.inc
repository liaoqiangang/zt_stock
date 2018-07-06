<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<div class="panelBar">
		<div class="pages">
			<span>显示</span>
			<select name="numPerPage" onchange="navTabPageBreak({numPerPage:this.value})">
				<c:forEach begin="10" end="50" step="10" varStatus="s">
				<option value="${s.index}" <c:if test="${filter.numPerPage == s.index}">selected="selected"</c:if>>${s.index}</option>
				</c:forEach>
			</select>
			<span>条，共${filter.totalRows}条</span>
		</div>
		<div class="pagination" targetType="navTab" totalCount="${filter.totalRows}" numPerPage="${filter.numPerPage}" pageNumShown="10" currentPage="${filter.pageNum+1}"></div>

	</div>