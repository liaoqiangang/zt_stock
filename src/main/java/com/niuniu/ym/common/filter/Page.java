package com.niuniu.ym.common.filter;

/**
 * 页
 * 用于Pager taglib。用于表示一页。
 * @author zhaoqi
 * 2012-10-23
 * Copyright by koolearn.com, 2012
 */
public class Page {
	
	/**
	 * 页号
	 */
	private int pageNo;
	
	/**
	 * URL
	 */
	private String url;
	
	/**
	 * 是否是选中状态
	 */
	private boolean selected;
	
	
	
	public int getPageNo() {
		return pageNo;
	}

	public void setPageNo(int pageNo) {
		this.pageNo = pageNo;
	}

	public boolean isSelected() {
		return selected;
	}

	public void setSelected(boolean selected) {
		this.selected = selected;
	}

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}
	
	

}

