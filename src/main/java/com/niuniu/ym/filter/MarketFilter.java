package com.niuniu.ym.filter;

import java.util.Date;

import org.apache.commons.lang3.builder.ToStringBuilder;

import com.niuniu.ym.common.filter.PageFilter;

/**
 * 文件名 StockFilter.java 自动生成代码
 * 
 * @author root
 * @date 2016-06-07 19:18:13
 */
public class MarketFilter extends PageFilter {

	private Date curDate;

	/**
	 * 盘前，盘中，盘后
	 */
	private String type;

	private String source;

	private String reviewUrl;

	/**
	 * 开始时间
	 */
	private Date startTime;

	/**
	 * 结束时间
	 */
	private Date endTime;

	public Date getCurDate() {
		return curDate;
	}

	public String getType() {
		return type;
	}

	public String getSource() {
		return source;
	}

	public String getReviewUrl() {
		return reviewUrl;
	}

	public void setCurDate(Date curDate) {
		this.curDate = curDate;
	}

	public void setType(String type) {
		this.type = type;
	}

	public void setSource(String source) {
		this.source = source;
	}

	public void setReviewUrl(String reviewUrl) {
		this.reviewUrl = reviewUrl;
	}

	public Date getStartTime() {
		return startTime;
	}

	public Date getEndTime() {
		return endTime;
	}

	public void setStartTime(Date startTime) {
		this.startTime = startTime;
	}

	public void setEndTime(Date endTime) {
		this.endTime = endTime;
	}

	@Override
	public String toString() {
		return ToStringBuilder.reflectionToString(this);
	}
}