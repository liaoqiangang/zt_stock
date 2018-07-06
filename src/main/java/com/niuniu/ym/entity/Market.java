package com.niuniu.ym.entity;

import java.util.Date;

import org.apache.commons.lang3.builder.ToStringBuilder;

import com.niuniu.ym.common.base.BaseEntity;

/**
 * 文件名 Stock.java 自动生成代码
 * 
 * @author root
 * @date 2016-06-07 19:18:13
 */
public class Market extends BaseEntity {

	/**
	 * 默认构造函数
	 * 
	 * @author root
	 * @date 2016-06-07 19:18:13
	 */
	public Market() {

	}

	private Date curDate;
	
	/**
	 * 盘前，盘中，盘后
	 */
	private String type;

	private String source;
	
	private String reviewUrl;
	
	


	public String getType() {
		return type;
	}


	public String getSource() {
		return source;
	}

	


	public Date getCurDate() {
		return curDate;
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

	public String getReviewUrl() {
		return reviewUrl;
	}


	public void setReviewUrl(String reviewUrl) {
		this.reviewUrl = reviewUrl;
	}


	@Override
	public String toString() {
		return ToStringBuilder.reflectionToString(this);
	}
}
