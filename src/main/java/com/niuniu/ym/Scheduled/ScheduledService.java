package com.niuniu.ym.Scheduled;

import static org.fusesource.jansi.Ansi.ansi;
import static org.fusesource.jansi.Ansi.Color.GREEN;
import static org.fusesource.jansi.Ansi.Color.RED;

import java.applet.Applet;
import java.applet.AudioClip;
import java.awt.*;
import java.io.BufferedInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.math.BigDecimal;
import java.math.RoundingMode;
import java.net.URL;
import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.*;
import java.util.List;

import com.niuniu.ym.entity.BuyStock;
import com.niuniu.ym.filter.BuyStockFilter;
import com.niuniu.ym.service.BuyStockService;
import com.niuniu.ym.util.DateUtil;
import com.niuniu.ym.util.SendEmailUtil;
import javafx.beans.binding.When;
import javazoom.jl.player.Player;
import org.apache.commons.collections.CollectionUtils;
import org.apache.commons.lang3.StringUtils;
import org.fusesource.jansi.AnsiConsole;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Service;

import com.niuniu.ym.entity.Stock;
import com.niuniu.ym.enums.StockType;
import com.niuniu.ym.filter.StockFilter;
import com.niuniu.ym.service.StockService;
import com.niuniu.ym.util.AppendFile;
import com.niuniu.ym.util.HttpClientUtil;
import sun.jvm.hotspot.memory.EdenSpace;

/**
 * 定时任务
 *
 * @author liaoqiangang-pc
 */
@Service
public class ScheduledService {

    private static final Logger log = LoggerFactory.getLogger(ScheduledService.class);

    @Autowired
    private StockService stockService;

    @Autowired
    private BuyStockService buyStockService;


    /**
     * 每20秒写一遍
     * 0/20 25/1 9-14 ? * 2-6 *  周一-周五  9点30到下午3点，每分钟执行一次
     */


//    @Scheduled(cron = "*/10 * * * * ?")//每10秒执行一次
    @Scheduled(cron="0/10 26/1 9-14 ? * 2-6")
    public void zt_open_buy() {
        // 黄金分割比率
        StockFilter filter = new StockFilter();
        filter.setMonitor(1);//是否监测
        filter.setNumPerPage(50);
        int pageNum = 1;
        List<Stock> list = stockService.searchByFilter(filter);
        System.out.println("======================================starting===================================================");
        while (CollectionUtils.isNotEmpty(list)) {
            for (Stock stock : list) {
                zt_yujing_buy(stock);
            }
            pageNum = pageNum + 1;
            filter.setPageNum(pageNum);
            list = stockService.searchByFilter(filter);
        }
        System.out.println("==========================================end====================================================");
    }

    private void zt_yujing_buy(Stock stock) {
        StockType stockType = new StockType(stock.getStockCode());
        String stockCodeUrl = "http://hq.sinajs.cn/list="
                + stockType.getStockType() + stockType.getStockCode();
        String resultContent = HttpClientUtil.get(stockCodeUrl, "GBK");
        resultContent = resultContent.substring(
                resultContent.indexOf("=\"") + 2, resultContent.indexOf("\";"));
        try {
            String[] stockArrs = resultContent.split(",");
            if (!StringUtils.isEmpty(resultContent)) {
                // 现价
                String nowPricestr = stockArrs[3];
                double nowPrice = Double.parseDouble(new DecimalFormat("#.###").format(Double.valueOf(nowPricestr)));

                // 最低价
                String lowPricestr = stockArrs[5];
                double lowPrice = Double.parseDouble(new DecimalFormat("#.###").format(Double.valueOf(lowPricestr)));

                //回调天数
                int day = DateUtil.getweekdays(stock.getSelTime(), new Date());

                //跌破  涨停开饭盘 *1.01 ()
                Double zt_open = stock.getlPrice();
                int dipo_openprice1_01 = Double.valueOf(nowPrice).compareTo(zt_open * 1.01);
                int dipo_openprice = Double.valueOf(nowPrice).compareTo(zt_open);
                int dipo_zClose = Double.valueOf(nowPrice).compareTo(stock.getzClose());

                //TODO  实时播报	跌破 涨停开盘价(到达开盘价附近1.01)
                //现价小于涨停当天的开盘价 1.01
                String msg = "";
                if(day<=3){
                    if (dipo_openprice < 0 || dipo_openprice1_01 < 0 || dipo_zClose < 0) {
                        msg = "\n---->《《《盘中抄底》》》	跌到 涨停开盘价：" + stock.getlPrice() + "附近，关注买入！		回调（" + (day - 1) + "）天		股票：" + stock.getStockName() + "（" + stock.getStockCode() + "）	现价：" + nowPricestr + "<----\n";
                        System.out.println(msg);
                        String model = "";
                        if(dipo_zClose<0){
                            model = "加仓";  //加仓点位
                        }else if(dipo_openprice<0){
                            model = "买入";  //买点
                        }else{
                            model = "关注";  //关注点
                        }
                        //TODO 跌破开盘价 入库
                        //组装入库数据
                        BuyStock buyStock = new BuyStock();
                        buyStock.setStockName(stock.getStockName());
                        buyStock.setStockCode(stock.getStockCode());
                        buyStock.setDay(day - 1);
                        buyStock.setModel(model);
                        buyStock.setNowPrice(nowPrice);
                        String createTime = (stockArrs[30] + stockArrs[31]).replace("-", "").replace(":", "");
                        buyStock.setCreateTime(createTime);
                        BuyStockFilter filter = new BuyStockFilter();
                        filter.setModel(model);
                        filter.setStockCode(stock.getStockCode());
                        int count = buyStockService.countByFilter(filter);
                        if (count == 0) {
                            buyStockService.insertBySelective(buyStock);
                            Toolkit.getDefaultToolkit().beep();
                            //TODO 发送邮件 实现短信提醒
                            String title = stock.getStockName()+"("+stock.getStockCode()+")：" +model+",现价："+nowPrice;
                            SendEmailUtil.sendEmail(title,msg);
                        }
                    }
                }

                //TODO 尾盘买入法  当天跌破开盘价，现价收在开盘价上方
                SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmm");
                String dateStr = sdf.format(new Date());
                int HHmm = Integer.valueOf(dateStr.substring(8, dateStr.length()));
        //		if(1445<HHmm&&HHmm<1500){//14:45~15:00  播报
                int dipo = Double.valueOf(zt_open).compareTo(lowPrice);//跌破开盘价
                int shouhui = Double.valueOf(nowPrice).compareTo(stock.getlPrice());//现价 大于开盘价  ++++++现阶段收盘价++++++
                if (dipo >= 0 && shouhui >= 0) {
                    msg = "\n---->《尾盘关注》	跌破、拉回，关注买入！		回调（" + (day - 1) + "）天	股票：" + stock.getStockName() + "（" + stock.getStockCode() + "）	现价：" + nowPrice + "	涨停开盘价：" + stock.getlPrice() + "<----\n";
                    System.out.println(msg);
//                    AppendFile.method1("/Users/liaoqiangang/Desktop/stock.txt", msg);
                }
            }
        } catch (Exception e) {
            log.info("###Error###：" + resultContent);
        }
    }


    public static double formatDouble2(double d) {
        // 新方法，如果不需要四舍五入，可以使用RoundingMode.DOWN
        BigDecimal bg = new BigDecimal(d).setScale(2, RoundingMode.DOWN);
        return bg.doubleValue();
    }


    public void fetchStockPrice(String stockCode) {
        StockType stockType = new StockType(stockCode);
        String stockCodeUrl = "http://hq.sinajs.cn/list="
                + stockType.getStockType() + stockType.getStockCode();
        String resultContent = HttpClientUtil.get(stockCodeUrl, "GBK");
        String[] stockArrs = resultContent.split(",");
        String stockname = stockArrs[0].split("\"")[1]; // 股票名称
        String beginPrice = stockArrs[1]; // 开盘价
        String yesterdayPrice = stockArrs[2]; // 昨 收盘价
        String nowPrice = stockArrs[3]; // 当前价

        double zhangdiefu = (Double.valueOf(nowPrice) - Double.valueOf(yesterdayPrice)) / Double.valueOf(yesterdayPrice);

        System.out.println("===================================");
        zhangdiefu = Double.parseDouble(new DecimalFormat("#.##").format(zhangdiefu * 100));
        System.out.println(stockname + "(" + stockCode + ")    " + nowPrice + "    " + zhangdiefu);
        System.out.println("===================================");
    }
}