package com.niuniu.ym.common.filter;


import java.util.ArrayList;
import java.util.List;

/**
 * 分页数据对象
 * <p>用于Pager taglib，表示目前分页的相关数据。包括“首页”、“末页”、“上一页”、“下一页”、“当前页”、“总共页”等数据。</p>
 * <p>分页taglib使用PagerBean，通过freemarker模板，得到最终在页面上显示的HTML代码段</p>
 * @author lqg
 */
public class PagerBean {
	
	private String firstPage = null;
	
	private String lastPage = null;
	
	private String prevPage = null;
	
	private String nextPage = null;
	
	private String[] pages = new String[0];
	
	private List pageList = new ArrayList();
	
	private String totalPage = "0";
	
	private String currentPage = "0";
	
	private String gotoScript = null;
	
	private String inputName = null;
	
	
	public String getCurrentPage() {
		return currentPage;
	}

	public void setCurrentPage(String currentPage) {
		this.currentPage = currentPage;
	}

	public String getFirstPage() {
		return firstPage;
	}

	public void setFirstPage(String firstPage) {
		this.firstPage = firstPage;
	}

	public String getLastPage() {
		return lastPage;
	}

	public void setLastPage(String lastPage) {
		this.lastPage = lastPage;
	}

	public String getNextPage() {
		return nextPage;
	}

	public void setNextPage(String nextPage) {
		this.nextPage = nextPage;
	}

	public String[] getPages() {
		return pages;
	}

	public void setPages(String[] pages) {
		this.pages = pages;
	}

	public String getPrevPage() {
		return prevPage;
	}

	public void setPrevPage(String prevPage) {
		this.prevPage = prevPage;
	}

	public String getTotalPage() {
		return totalPage;
	}

	public void setTotalPage(String totalPage) {
		this.totalPage = totalPage;
	}

	public List getPageList() {
		return pageList;
	}

	public void setPageList(List pageList) {
		this.pageList = pageList;
	}

	public String getGotoScript() {
		return gotoScript;
	}

	public void setGotoScript(String gotoScript) {
		this.gotoScript = gotoScript;
	}

	public String getInputName() {
		return inputName;
	}

	public void setInputName(String inputName) {
		this.inputName = inputName;
	}

	
}
