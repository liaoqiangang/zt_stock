package com.niuniu.ym.filter;

import java.util.Date;

import com.niuniu.ym.common.filter.PageFilter;

/**
 * 文件名 StockFilter.java 自动生成代码
 *
 * @author root
 * @date 2016-06-07 19:18:13
 */
public class StockFilter extends PageFilter {

    /**
     * 属性StockCode(股票代码)
     */
    private String stockCode;
    /**
     * 属性StockName(股票简称)
     */
    private String stockName;

    private int strongstock = 0;
    /**
     * 属性Type(0-优股籍；1-短线宝；2-圈子；)
     */
    private String type;
    /**
     * 属性SelTime(入选时间)
     */
    private Date selTime;

    /**
     * 开始时间
     */
    private Date startTime;

    /**
     * 结束时间
     */
    private Date endTime;


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

    /**
     * 板块
     */
    private String plate;

    private String fileUrl;

    /**
     * 最高价
     */
    private double hPrice;

    /**
     * 最低价
     */
    private double lPrice;


    private int monitor;

    private String ltgb;

    public String getLtgb() {
        return ltgb;
    }

    public void setLtgb(String ltgb) {
        this.ltgb = ltgb;
    }

    public int getStrongstock() {
        return strongstock;
    }

    public void setStrongstock(int strongstock) {
        this.strongstock = strongstock;
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
     * 设置属性Type(优股籍；短线宝；圈子；)
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

    public String getPlate() {
        return plate;
    }

    public void setPlate(String plate) {
        this.plate = plate;
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

    public int getMonitor() {
        return monitor;
    }

    public void setMonitor(int monitor) {
        this.monitor = monitor;
    }

    @Override
    public String toString() {

        StringBuilder sb = new StringBuilder();
        sb.append("Id():").append(getId()).append(" ");
        sb.append("StockCode(股票代码):").append(getStockCode()).append(" ");
        sb.append("StockName(股票简称):").append(getStockName()).append(" ");
        sb.append("StockName(板块):").append(getPlate()).append(" ");
        sb.append("Type(0-优股籍；1-短线宝；2-圈子；):").append(getType()).append(" ");
        sb.append("SelTime(入选时间):").append(getSelTime()).append(" ");
        sb.append("Buy(0-入选；1-买入；2-关注；):").append(getBuy()).append(" ");
        sb.append("Season(入选理由):").append(getSeason()).append(" ");
        sb.append("OrderNum(综合排序):").append(getOrderNum()).append(" ");
        return sb.toString();
    }
}