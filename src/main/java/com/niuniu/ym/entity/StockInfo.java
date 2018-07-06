package com.niuniu.ym.entity;

import java.util.Date;

import org.apache.commons.lang3.builder.ToStringBuilder;

import com.niuniu.ym.common.base.BaseEntity;
/**
 * 文件名 StockInfo.java
 * 自动生成代码
 * @author root
 * @date 2017-02-27 18:06:42
 */
public class StockInfo extends BaseEntity{

  /**
   * 默认构造函数
   * @author root
   * @date 2017-02-27 18:06:42
   */
  public StockInfo() {

  }
  
	/**
	  * 属性StockCode()
	*/
	private String stockCode;
	/**
	  * 属性StockName()
	*/
	private String stockName;
	/**
	  * 属性StockType()
	*/
	private String stockType;
	/**
	  * 属性Plate(上市板块)
	*/
	private String plate;
	/**
	  * 属性ListedTime(上市日期)
	*/
	private Date listedTime;
	/**
	  * 属性IssueTime(发行日期)
	*/
	private Date issueTime;
	/**
	  * 属性IssuePERate(发行市盈率（倍）)
	*/
	private String issuePERate;
	/**
	  * 属性IssueType(发行方式)
	*/
	private String issueType;
	/**
	  * 属性StockPrice(每股面值)
	*/
	private String stockPrice;
	/**
	  * 属性IssuePrice(每股发行价)
	*/
	private String issuePrice;
	/**
	  * 属性IssueNumber(发行量（股）)
	*/
	private String issueNumber;
	/**
	  * 属性TotalIssuePrice(发行总市值)
	*/
	private String totalIssuePrice;
	/**
	  * 属性PlacementPrice(募集资金净额(元)	)
	*/
	private String placementPrice;
	/**
	  * 属性OpenPrice(首日开盘价)
	*/
	private String openPrice;
	/**
	  * 属性ClosePrice(首日收盘价)
	*/
	private String closePrice;
	/**
	  * 属性TurnoverRate(首日换手率)
	*/
	private String turnoverRate;
	/**
	  * 属性TopPrice(首日最高价)
	*/
	private String topPrice;
	/**
	  * 属性PlaceWinningRate(ration)
	*/
	private String placeWinningRate;
	/**
	  * 属性PriceWinningRate(定价中签率	)
	*/
	private String priceWinningRate;

  /**
   *  获取属性StockCode()
   * @return String
   * @author root
   * @date 2017-02-27 18:06:42
  */
  public String getStockCode(){
    return stockCode;
   }
   /**
   * 设置属性StockCode()
   * @param stockCode
   * @return void
   * @author root
   * @date  2017-02-27 18:06:42
   */
  public void setStockCode(String stockCode ){
    this.stockCode = stockCode ;
  }
  /**
   *  获取属性StockName()
   * @return String
   * @author root
   * @date 2017-02-27 18:06:42
  */
  public String getStockName(){
    return stockName;
   }
   /**
   * 设置属性StockName()
   * @param stockName
   * @return void
   * @author root
   * @date  2017-02-27 18:06:42
   */
  public void setStockName(String stockName ){
    this.stockName = stockName ;
  }
  /**
   *  获取属性StockType()
   * @return String
   * @author root
   * @date 2017-02-27 18:06:42
  */
  public String getStockType(){
    return stockType;
   }
   /**
   * 设置属性StockType()
   * @param stockType
   * @return void
   * @author root
   * @date  2017-02-27 18:06:42
   */
  public void setStockType(String stockType ){
    this.stockType = stockType ;
  }
  /**
   *  获取属性Plate(上市板块)
   * @return String
   * @author root
   * @date 2017-02-27 18:06:42
  */
  public String getPlate(){
    return plate;
   }
   /**
   * 设置属性Plate(上市板块)
   * @param plate
   * @return void
   * @author root
   * @date  2017-02-27 18:06:42
   */
  public void setPlate(String plate ){
    this.plate = plate ;
  }
  /**
   *  获取属性ListedTime(上市日期)
   * @return Date
   * @author root
   * @date 2017-02-27 18:06:42
  */
  public Date getListedTime(){
    return listedTime;
   }
   /**
   * 设置属性ListedTime(上市日期)
   * @param listedTime
   * @return void
   * @author root
   * @date  2017-02-27 18:06:42
   */
  public void setListedTime(Date listedTime ){
    this.listedTime = listedTime ;
  }
  /**
   *  获取属性IssueTime(发行日期)
   * @return Date
   * @author root
   * @date 2017-02-27 18:06:42
  */
  public Date getIssueTime(){
    return issueTime;
   }
   /**
   * 设置属性IssueTime(发行日期)
   * @param issueTime
   * @return void
   * @author root
   * @date  2017-02-27 18:06:42
   */
  public void setIssueTime(Date issueTime ){
    this.issueTime = issueTime ;
  }
  /**
   *  获取属性IssuePERate(发行市盈率（倍）)
   * @return String
   * @author root
   * @date 2017-02-27 18:06:42
  */
  public String getIssuePERate(){
    return issuePERate;
   }
   /**
   * 设置属性IssuePERate(发行市盈率（倍）)
   * @param issuePERate
   * @return void
   * @author root
   * @date  2017-02-27 18:06:42
   */
  public void setIssuePERate(String issuePERate ){
    this.issuePERate = issuePERate ;
  }
  /**
   *  获取属性IssueType(发行方式)
   * @return String
   * @author root
   * @date 2017-02-27 18:06:42
  */
  public String getIssueType(){
    return issueType;
   }
   /**
   * 设置属性IssueType(发行方式)
   * @param issueType
   * @return void
   * @author root
   * @date  2017-02-27 18:06:42
   */
  public void setIssueType(String issueType ){
    this.issueType = issueType ;
  }
  /**
   *  获取属性StockPrice(每股面值)
   * @return String
   * @author root
   * @date 2017-02-27 18:06:42
  */
  public String getStockPrice(){
    return stockPrice;
   }
   /**
   * 设置属性StockPrice(每股面值)
   * @param stockPrice
   * @return void
   * @author root
   * @date  2017-02-27 18:06:42
   */
  public void setStockPrice(String stockPrice ){
    this.stockPrice = stockPrice ;
  }
  /**
   *  获取属性IssuePrice(每股发行价)
   * @return String
   * @author root
   * @date 2017-02-27 18:06:42
  */
  public String getIssuePrice(){
    return issuePrice;
   }
   /**
   * 设置属性IssuePrice(每股发行价)
   * @param issuePrice
   * @return void
   * @author root
   * @date  2017-02-27 18:06:42
   */
  public void setIssuePrice(String issuePrice ){
    this.issuePrice = issuePrice ;
  }
  /**
   *  获取属性IssueNumber(发行量（股）)
   * @return String
   * @author root
   * @date 2017-02-27 18:06:42
  */
  public String getIssueNumber(){
    return issueNumber;
   }
   /**
   * 设置属性IssueNumber(发行量（股）)
   * @param issueNumber
   * @return void
   * @author root
   * @date  2017-02-27 18:06:42
   */
  public void setIssueNumber(String issueNumber ){
    this.issueNumber = issueNumber ;
  }
  /**
   *  获取属性TotalIssuePrice(发行总市值)
   * @return String
   * @author root
   * @date 2017-02-27 18:06:42
  */
  public String getTotalIssuePrice(){
    return totalIssuePrice;
   }
   /**
   * 设置属性TotalIssuePrice(发行总市值)
   * @param totalIssuePrice
   * @return void
   * @author root
   * @date  2017-02-27 18:06:42
   */
  public void setTotalIssuePrice(String totalIssuePrice ){
    this.totalIssuePrice = totalIssuePrice ;
  }
  /**
   *  获取属性PlacementPrice(募集资金净额(元)	)
   * @return String
   * @author root
   * @date 2017-02-27 18:06:42
  */
  public String getPlacementPrice(){
    return placementPrice;
   }
   /**
   * 设置属性PlacementPrice(募集资金净额(元)	)
   * @param placementPrice
   * @return void
   * @author root
   * @date  2017-02-27 18:06:42
   */
  public void setPlacementPrice(String placementPrice ){
    this.placementPrice = placementPrice ;
  }
  /**
   *  获取属性OpenPrice(首日开盘价)
   * @return String
   * @author root
   * @date 2017-02-27 18:06:42
  */
  public String getOpenPrice(){
    return openPrice;
   }
   /**
   * 设置属性OpenPrice(首日开盘价)
   * @param openPrice
   * @return void
   * @author root
   * @date  2017-02-27 18:06:42
   */
  public void setOpenPrice(String openPrice ){
    this.openPrice = openPrice ;
  }
  /**
   *  获取属性ClosePrice(首日收盘价)
   * @return String
   * @author root
   * @date 2017-02-27 18:06:42
  */
  public String getClosePrice(){
    return closePrice;
   }
   /**
   * 设置属性ClosePrice(首日收盘价)
   * @param closePrice
   * @return void
   * @author root
   * @date  2017-02-27 18:06:42
   */
  public void setClosePrice(String closePrice ){
    this.closePrice = closePrice ;
  }
  /**
   *  获取属性TurnoverRate(首日换手率)
   * @return String
   * @author root
   * @date 2017-02-27 18:06:42
  */
  public String getTurnoverRate(){
    return turnoverRate;
   }
   /**
   * 设置属性TurnoverRate(首日换手率)
   * @param turnoverRate
   * @return void
   * @author root
   * @date  2017-02-27 18:06:42
   */
  public void setTurnoverRate(String turnoverRate ){
    this.turnoverRate = turnoverRate ;
  }
  /**
   *  获取属性TopPrice(首日最高价)
   * @return String
   * @author root
   * @date 2017-02-27 18:06:42
  */
  public String getTopPrice(){
    return topPrice;
   }
   /**
   * 设置属性TopPrice(首日最高价)
   * @param topPrice
   * @return void
   * @author root
   * @date  2017-02-27 18:06:42
   */
  public void setTopPrice(String topPrice ){
    this.topPrice = topPrice ;
  }
  /**
   *  获取属性PlaceWinningRate(ration)
   * @return String
   * @author root
   * @date 2017-02-27 18:06:42
  */
  public String getPlaceWinningRate(){
    return placeWinningRate;
   }
   /**
   * 设置属性PlaceWinningRate(ration)
   * @param placeWinningRate
   * @return void
   * @author root
   * @date  2017-02-27 18:06:42
   */
  public void setPlaceWinningRate(String placeWinningRate ){
    this.placeWinningRate = placeWinningRate ;
  }
  /**
   *  获取属性PriceWinningRate(定价中签率	)
   * @return String
   * @author root
   * @date 2017-02-27 18:06:42
  */
  public String getPriceWinningRate(){
    return priceWinningRate;
   }
   /**
   * 设置属性PriceWinningRate(定价中签率	)
   * @param priceWinningRate
   * @return void
   * @author root
   * @date  2017-02-27 18:06:42
   */
  public void setPriceWinningRate(String priceWinningRate ){
    this.priceWinningRate = priceWinningRate ;
  }

  	@Override
	public String toString() {
		return ToStringBuilder.reflectionToString(this);
	}
 }
