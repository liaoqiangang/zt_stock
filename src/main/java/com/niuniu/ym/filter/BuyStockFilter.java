package com.niuniu.ym.filter;
import com.niuniu.ym.common.filter.PageFilter;
import org.apache.commons.lang3.builder.ToStringBuilder;

/**
 * 文件名 BuyStockFilter.java
 * 自动生成代码
 * @author root
 * @date 2018-06-25 20:12:23
 */
public class BuyStockFilter extends PageFilter {


	/**
	  * 属性StockName(股票名称)
	*/
	private String stockName;
	/**
	  * 属性StockCode(股票代码)
	*/
	private String stockCode;
	/**
	  * 属性CreateTime(创建时间)
	*/
	private String createTime;
	/**
	  * 属性NowPrice(现价)
	*/
	private double nowPrice;
	/**
	  * 属性Day(跳转多少天)
	*/
	private Integer day;

	private String model;

	private String yingli;


    public String getYingli() {
        return yingli;
    }

    public void setYingli(String yingli) {
        this.yingli = yingli;
    }


    public String getModel() {
        return model;
    }

    public void setModel(String model) {
        this.model = model;
    }

    /**
   *  获取属性StockName(股票名称)
   * @return String
   * @author root
   * @date 2018-06-25 20:12:23
  */
  public String getStockName(){
    return stockName;
   }
   /**
   * 设置属性StockName(股票名称)
   * @param stockName
   * @return void
   * @author root
   * @date  2018-06-25 20:12:23
   */
  public void setStockName(String stockName ){
    this.stockName = stockName ;
  }
  /**
   *  获取属性StockCode(股票代码)
   * @return String
   * @author root
   * @date 2018-06-25 20:12:23
  */
  public String getStockCode(){
    return stockCode;
   }
   /**
   * 设置属性StockCode(股票代码)
   * @param stockCode
   * @return void
   * @author root
   * @date  2018-06-25 20:12:23
   */
  public void setStockCode(String stockCode ){
    this.stockCode = stockCode ;
  }
  /**
   *  获取属性CreateTime(创建时间)
   * @return String
   * @author root
   * @date 2018-06-25 20:12:23
  */
  public String getCreateTime(){
    return createTime;
   }
   /**
   * 设置属性CreateTime(创建时间)
   * @param createTime
   * @return void
   * @author root
   * @date  2018-06-25 20:12:23
   */
  public void setCreateTime(String createTime ){
    this.createTime = createTime ;
  }
  /**
   *  获取属性NowPrice(现价)
   * @return double
   * @author root
   * @date 2018-06-25 20:12:23
  */
  public double getNowPrice(){
    return nowPrice;
   }
   /**
   * 设置属性NowPrice(现价)
   * @param nowPrice
   * @return void
   * @author root
   * @date  2018-06-25 20:12:23
   */
  public void setNowPrice(double nowPrice ){
    this.nowPrice = nowPrice ;
  }
  /**
   *  获取属性Day(跳转多少天)
   * @return Integer
   * @author root
   * @date 2018-06-25 20:12:23
  */
  public Integer getDay(){
    return day;
   }
   /**
   * 设置属性Day(跳转多少天)
   * @param day
   * @return void
   * @author root
   * @date  2018-06-25 20:12:23
   */
  public void setDay(Integer day ){
    this.day = day ;
  }

  @Override
  public String toString() {
    return ToStringBuilder.reflectionToString(this);
  }
 }