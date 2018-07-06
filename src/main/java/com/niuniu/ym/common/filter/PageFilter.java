package com.niuniu.ym.common.filter;

import org.apache.commons.lang.builder.ToStringBuilder;

/**
 * 
 * @author lqg
 *
 */
public class PageFilter extends ListPager{
	
	private static final long serialVersionUID = 3805841657795170135L;
	
	private int id;
	
	private int pageNum;
	
	private int numPerPage;
	
	private String orderField;
	
	private String orderDirection;
	
	private boolean pager=true;
	
	private boolean distinct;


	public int getPageNum() {
		pageNum = getPageNo();
		return pageNum;
	}

	public void setPageNum(int pageNum) {
		this.pageNum = pageNum-1;
		setPageNo(this.pageNum);
	}

	public int getNumPerPage() {
		numPerPage = getPageSize();
		return numPerPage;
	}

	public void setNumPerPage(int numPerPage) {
		this.numPerPage = numPerPage;
		setPageSize(numPerPage);
	}

	

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getOrderField() {
		return orderField;
	}

	public void setOrderField(String orderField) {
		this.orderField = orderField;
	}

	public String getOrderDirection() {
		return orderDirection;
	}

	public void setOrderDirection(String orderDirection) {
		this.orderDirection = orderDirection;
	}

	public boolean isPager() {
		return pager;
	}

	public void setPager(boolean pager) {
		this.pager = pager;
	}
	
	

	public boolean isDistinct() {
		return distinct;
	}

	public void setDistinct(boolean distinct) {
		this.distinct = distinct;
	}

	@Override
	public String toString(){
		return ToStringBuilder.reflectionToString(this);
	}
}
