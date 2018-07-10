package com.niuniu.ym.entity;

import java.text.SimpleDateFormat;
import java.util.Date;

import org.apache.commons.lang3.builder.ToStringBuilder;

import com.niuniu.ym.common.base.BaseEntity;

/**
 * 文件名 Stock.java 自动生成代码
 * 
 * @author root
 * @date 2016-06-07 19:18:13
 */
public class Stock extends BaseEntity implements Comparable<Object> {

	/**
	 * 默认构造函数
	 * 
	 * @author root
	 * @date 2016-06-07 19:18:13
	 */
	public Stock() {

	}

	/**
	 * 属性StockCode(股票代码)
	 */
	private String stockCode;
	/**
	 * 属性StockName(股票简称)
	 */
	private String stockName;

	/**
	 * 板块
	 */
	private String plate;
	/**
	 * 属性Type(优股籍；短线宝；圈子；)
	 */
	private String type;
	/**
	 * 属性SelTime(入选时间)
	 */
	private Date selTime;

	private String showSelTime;
	/**
	 * 属性Buy(入选；买入；关注；)
	 */
	private String buy;
	/**
	 * 属性Season(入选理由)
	 */
	private String season;
	/**
	 * 属性OrderNum(综合排序)
	 */
	private Integer orderNum;

	private String fileUrl;
	
	/**
	 * 最高价
	 */
	private double hPrice;
	
	/**
	 * 最低价
	 */
	private double lPrice;


	private double zClose;

	private double  zdf;
	
	private int monitor;


	public double getzClose() {
		return zClose;
	}

	public void setzClose(double zClose) {
		this.zClose = zClose;
	}


	public double getZdf() {
		return zdf;
	}

	public void setZdf(double zdf) {
		this.zdf = zdf;
	}

	/**
	 * 获取属性StockCode(股票代码)
	 * 
	 * @return String
	 * @author root
	 * @date 2016-06-07 19:18:13
	 */
	public String getStockCode() {
		return stockCode;
	}

	/**
	 * 设置属性StockCode(股票代码)
	 * 
	 * @return void
	 * @author root
	 * @date 2016-06-07 19:18:13
	 */
	public void setStockCode(String stockCode) {
		this.stockCode = stockCode;
	}

	/**
	 * 获取属性StockName(股票简称)
	 * 
	 * @return String
	 * @author root
	 * @date 2016-06-07 19:18:13
	 */
	public String getStockName() {
		return stockName;
	}

	/**
	 * 设置属性StockName(股票简称)
	 * 
	 * @return void
	 * @author root
	 * @date 2016-06-07 19:18:13
	 */
	public void setStockName(String stockName) {
		this.stockName = stockName;
	}

	public String getPlate() {
		return plate;
	}

	public void setPlate(String plate) {
		this.plate = plate;
	}


	/**
	 * 获取属性Type(0-优股籍；1-短线宝；2-圈子；)
	 * 
	 * @return Integer
	 * @author root
	 * @date 2016-06-07 19:18:13
	 */
	public String getType() {
		return type;
	}

	/**
	 * 设置属性Type(0-优股籍；1-短线宝；2-圈子；)
	 * 
	 * @return void
	 * @author root
	 * @date 2016-06-07 19:18:13
	 */
	public void setType(String type) {
		this.type = type;
	}

	/**
	 * 获取属性SelTime(入选时间)
	 * 
	 * @return Date
	 * @author root
	 * @date 2016-06-07 19:18:13
	 */
	public Date getSelTime() {
		return selTime;
	}

	/**
	 * 设置属性SelTime(入选时间)
	 * 
	 * @return void
	 * @author root
	 * @date 2016-06-07 19:18:13
	 */
	public void setSelTime(Date selTime) {
		this.selTime = selTime;
	}
	
	public int getMonitor() {
		return monitor;
	}

	public void setMonitor(int monitor) {
		this.monitor = monitor;
	}

	public String getShowSelTime() {
		if(this.selTime!=null){
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			this.showSelTime = sdf.format(selTime); 
		}
		return showSelTime;
	}

	public void setShowSelTime(String showSelTime) {
		this.showSelTime = showSelTime;
	}

	/**
	 * 获取属性Buy(0-入选；1-买入；2-关注；)
	 * 
	 * @return Integer
	 * @author root
	 * @date 2016-06-07 19:18:13
	 */
	public String getBuy() {
		return buy;
	}

	/**
	 * 设置属性Buy(0-入选；1-买入；2-关注；)
	 * 
	 * @return void
	 * @author root
	 * @date 2016-06-07 19:18:13
	 */
	public void setBuy(String buy) {
		this.buy = buy;
	}

	/**
	 * 获取属性Season(入选理由)
	 * 
	 * @return String
	 * @author root
	 * @date 2016-06-07 19:18:13
	 */
	public String getSeason() {
		return season;
	}

	/**
	 * 设置属性Season(入选理由)
	 * 
	 * @return void
	 * @author root
	 * @date 2016-06-07 19:18:13
	 */
	public void setSeason(String season) {
		this.season = season;
	}

	/**
	 * 获取属性OrderNum(综合排序)
	 * 
	 * @return Integer
	 * @author root
	 * @date 2016-06-07 19:18:13
	 */
	public Integer getOrderNum() {
		return orderNum;
	}

	/**
	 * 设置属性OrderNum(综合排序)
	 * 
	 * @return void
	 * @author root
	 * @date 2016-06-07 19:18:13
	 */
	public void setOrderNum(Integer orderNum) {
		this.orderNum = orderNum;
	}

	public String getFileUrl() {
		return fileUrl;
	}

	public void setFileUrl(String fileUrl) {
		this.fileUrl = fileUrl;
	}
	
	

	public double gethPrice() {
		return hPrice;
	}

	public void sethPrice(double hPrice) {
		this.hPrice = hPrice;
	}

	public double getlPrice() {
		return lPrice;
	}

	public void setlPrice(double lPrice) {
		this.lPrice = lPrice;
	}

	@Override
	public String toString() {
		return ToStringBuilder.reflectionToString(this);
	}
	
	@Override
	public int compareTo(Object o) {
		Stock anObj = (Stock) o;
		return (anObj.getZdf()-this.getZdf())>0?-1:1;
	}
}
