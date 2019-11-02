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


//
    /**
     * 每20秒写一遍
     * 0/20 25/1 9-14 ? * 2-6 *  周一-周五  9点30到下午3点，每分钟执行一次
     *
     */

    /**
     * 定时任务 买入
     */
//    @Scheduled(cron = "0/10 25/1 9-14 ? * 2-6")
    @Scheduled(cron = "0/10 * * * * ?")//每10执行一次
    public void zt_open_buy() {
        if (inTime()) {
            return;
        }
        // 黄金分割比率
        StockFilter filter = new StockFilter();
        filter.setMonitor(1);//是否监测
        filter.setNumPerPage(50);
        int pageNum = 1;
        int total = 0;
        long start = System.currentTimeMillis();
        List<Stock> list = stockService.searchByFilter(filter);
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
        String date = sdf.format(new Date());
        System.out.println("======================================starting  买入加仓(" + date + ")===================================================");
        while (CollectionUtils.isNotEmpty(list)) {
            for (Stock stock : list) {
                zt_yujing_buy(stock);
            }
            pageNum = pageNum + 1;
            filter.setPageNum(pageNum);
            total += list.size();
            list = stockService.searchByFilter(filter);
        }
        long end = System.currentTimeMillis();
        System.out.println("####\t查询数据：" + total + "\t\t耗时：" + (end - start) / 1000 + "s\t####");
    }

    private void zt_yujing_buy(Stock stock) {
        StockType stockType = new StockType(stock.getStockCode());
        String stockCodeUrl = "http://hq.sinajs.cn/list="
                + stockType.getStockType() + stockType.getStockCode();
        String resultContent = HttpClientUtil.get(stockCodeUrl, "GBK");
        resultContent = resultContent.substring(
                resultContent.indexOf("=\"") + 2, resultContent.indexOf("\";"));
//        System.out.println("数据：\t"+resultContent);
        try {
            String[] stockArrs = resultContent.split(",");
            if (!StringUtils.isEmpty(resultContent)) {
                /*现价*/
                String nowPricestr = stockArrs[3];
                double nowPrice = Double.parseDouble(new DecimalFormat("#.###").format(Double.valueOf(nowPricestr)));
                /*最低价*/
                String lowPricestr = stockArrs[5];// 最低价
                double lowPrice = Double.parseDouble(new DecimalFormat("#.###").format(Double.valueOf(lowPricestr)));
                /*回调天数*/
                int day = DateUtil.getweekdays(stock.getSelTime(), new Date());
                /*涨停开盘价*/
                Double zt_open = stock.getlPrice();
                /*跌破 涨停 开盘价 1.01-->关注点*/
                int dipo_openprice1_01 = Double.valueOf(nowPrice).compareTo(zt_open * 1.01);
                /*跌破 涨停 开盘价 -->买入点*/
                int dipo_openprice = Double.valueOf(nowPrice).compareTo(zt_open);
                /*跌破 涨停 前一天 收盘价-->加仓点*/
                int dipo_zClose = Double.valueOf(nowPrice).compareTo(stock.getzClose());
                /*回调3天以内*/
                String msg = "";
                if (day <= 3) {
                    if (dipo_openprice < 0 || dipo_openprice1_01 < 0 || dipo_zClose < 0) {
                        /*入选类型 关注-->买入-->加仓 */
                        String model = "";
                        if (dipo_zClose < 0) {
                            model = "加仓";  //加仓点位
                        } else if (dipo_openprice < 0) {
                            model = "买入";  //买点
                        } else {
                            model = "关注";  //关注点
                        }
                        BuyStock buyStock = new BuyStock();
                        buyStock.setStockName(stock.getStockName());//股票名称
                        buyStock.setStockCode(stock.getStockCode());//股票代码
                        buyStock.setDay(day - 1);//回调天数
                        buyStock.setModel(model);//入选类别
                        buyStock.setNowPrice(nowPrice);//预警价格
                        String createTime = (stockArrs[30] + stockArrs[31]).replace("-", "").replace(":", "");
                        buyStock.setCreateTime(createTime);//预警时间
                        BuyStockFilter filter = new BuyStockFilter();
                        filter.setModel(model);
                        filter.setStockCode(stock.getStockCode());
                        int count = buyStockService.countByFilter(filter);
                        /*去重处理 数据库中已有数据  不做入库操作*/
                        if (count == 0) {
                            if (model.equals("关注")) {
                                msg = "\n---->《《《盘中关注》》》	跌到 涨停开盘价：" + stock.getlPrice() + "附近，关注！		回调（" + (day - 1) + "）天		股票：" + stock.getStockName() + "（" + stock.getStockCode() + "）	现价：" + nowPricestr + "<----\n";
                            } else if (model.equals("买入")) {
                                msg = "\n---->《《《盘中买入》》》	跌破 涨停开盘价：" + stock.getlPrice() + "，买入！		回调（" + (day - 1) + "）天		股票：" + stock.getStockName() + "（" + stock.getStockCode() + "）	现价：" + nowPricestr + "<----\n";
                            } else if (model.equals("加仓")) {
                                msg = "\n---->《《《盘中加仓》》》	跌破 涨停前一天收盘价：" + stock.getzClose() + "，加仓！		回调（" + (day - 1) + "）天		股票：" + stock.getStockName() + "（" + stock.getStockCode() + "）	现价：" + nowPricestr + "<----\n";
                            }
                            System.out.println(msg);
                            buyStockService.insertBySelective(buyStock);
                            Toolkit.getDefaultToolkit().beep();
                            String title = stock.getStockName() + "(" + stock.getStockCode() + ")：" + model + ",现价：" + nowPrice;
                            /* 买入邮件  短信预警处理*/
//                            if(model.equals("买入")||model.equals("加仓"))
                            sendEmail(title, msg);
                        }
                    }
                }

                /*尾盘提醒*/
                SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmm");
                String dateStr = sdf.format(new Date());
                int HHmm = Integer.valueOf(dateStr.substring(8, dateStr.length()));
                if (1445 < HHmm && HHmm < 1450) {//14:45~15:00  播报
                    /*int dipo = Double.valueOf(zt_open).compareTo(lowPrice);//跌破开盘价
                    int shouhui = Double.valueOf(nowPrice).compareTo(stock.getlPrice());//现价 大于开盘价  ++++++现阶段收盘价++++++
                    if (dipo >= 0 && shouhui >= 0) {
                        msg = "\n---->《尾盘关注》	跌破、拉回，关注买入！		回调（" + (day - 1) + "）天	股票：" + stock.getStockName() + "（" + stock.getStockCode() + "）	现价：" + nowPrice + "	涨停开盘价：" + stock.getlPrice() + "<----\n";
                        System.out.println(msg);
    //                    AppendFile.method1("/Users/liaoqiangang/Desktop/stock.txt", msg);
                    }*/
                    /*处于涨停开盘价下方股票，尾盘提醒，长下影线说明止跌，第二日杀入获利*/
                    if (dipo_openprice < 0) {
                        msg = "\n---->《尾盘关注》	跌破涨停开盘价，关注长下影线股票，第二日关注买入！		回调（" + (day - 1) + "）天	股票：" + stock.getStockName() + "（" + stock.getStockCode() + "）	现价：" + nowPrice + "	涨停开盘价：" + stock.getlPrice() + "<----\n";
                        System.out.println(msg);
                    }
                }
            }
        } catch (Exception e) {
            log.info("###Error###：" + resultContent);
        }
    }

    //异步发送邮件
    private void sendEmail(final String title, final String msg) {
        new Thread(new Runnable() {
            public void run() {
                try {
                    SendEmailUtil.sendEmail(title, msg);
                } catch (Exception ex) {
                    log.error("###Error###--->title：" + title + "\tmsg：" + msg);
                }
            }
        }).start();
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


    /**
     * 定时任务 卖出
     */
//    @Scheduled(cron = "8/10 28/1 9-18 ? * 2-6")
    @Scheduled(cron = "0 0/10 * * * ?")//每10执行一次
    public void zt_open_sale() {
        if (inTime()) {
            return;
        }
        // 黄金分割比率
        BuyStockFilter filter = new BuyStockFilter();
        filter.setNumPerPage(1000);
        int pageNum = 1;
        int total = 0;
        long start = System.currentTimeMillis();
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
        String date = sdf.format(new Date());
        filter.setModel("");
        List<BuyStock> list = buyStockService.searchByFilter(filter);
        System.out.println("======================================starting  买卖(" + date + ")===================================================");
        while (CollectionUtils.isNotEmpty(list)) {
            for (BuyStock buyStock : list) {
                zt_yujing_sale(buyStock);
            }
            pageNum = pageNum + 1;
            filter.setPageNum(pageNum);
            total += list.size();
            list = buyStockService.searchByFilter(filter);
        }
        long end = System.currentTimeMillis();
        System.out.println("####\t查询数据：" + total + "\t\t耗时：" + (end - start) / 1000 + "s\t####");
    }


    private boolean inTime() {
        SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmm");
        String dateStr = sdf.format(new Date());
        int HHmm = Integer.valueOf(dateStr.substring(8, dateStr.length()));
        if (925 < HHmm && HHmm < 1500) {//14:45~15:00  播报
            return false;
        } else {
            return true;
        }
    }

    private void zt_yujing_sale(BuyStock buyStock) {
        StockType stockType = new StockType(buyStock.getStockCode());
        String stockCodeUrl = "http://hq.sinajs.cn/list="
                + stockType.getStockType() + stockType.getStockCode();
        String resultContent = HttpClientUtil.get(stockCodeUrl, "GBK");
        resultContent = resultContent.substring(
                resultContent.indexOf("=\"") + 2, resultContent.indexOf("\";"));
//        System.out.println("数据：\t"+resultContent);
        try {
            String[] stockArrs = resultContent.split(",");
            if (!StringUtils.isEmpty(resultContent)) {
                /*现价*/
                String nowPricestr = stockArrs[3];
                double nowPrice = Double.parseDouble(new DecimalFormat("#.###").format(Double.valueOf(nowPricestr)));

                /*回调天数*/
                /*涨停开盘价*/
                Double buyStockNowPrice = buyStock.getNowPrice();
                /*上涨5个点-->加仓*/
                int shangzhang_1_05 = Double.valueOf(nowPrice).compareTo(buyStockNowPrice * 1.05);
                /*跌破 涨停 开盘价 -->买入点*/
                int dipo_1_05 = Double.valueOf(buyStockNowPrice).compareTo(nowPrice * 1.08);
                /*回调3天以内*/
                String msg = "";
                if (shangzhang_1_05 > 0) {
                    msg = "\n---->《《《盘中减仓》》》	上涨  5% 买入价：" + buyStock.getNowPrice() + "		股票：" + buyStock.getStockName() + "（" + buyStock.getStockCode() + "）	现价：" + nowPricestr + "<----\n";
                    System.out.println(msg);
                    Toolkit.getDefaultToolkit().beep();
                    String title = buyStock.getStockName() + "(" + buyStock.getStockCode() + ")：" + ",现价：" + nowPrice;
                    AppendFile.method1("/Users/liaoqiangang/Desktop/stock.txt", msg);
                }
                if (dipo_1_05 > 0) {
                    msg = "\n---->《《《盘中加仓》》》	下跌涨  8% 买入价：" + buyStock.getNowPrice() + "		股票：" + buyStock.getStockName() + "（" + buyStock.getStockCode() + "）	现价：" + nowPricestr + "<----\n";
                    System.out.println(msg);
                    Toolkit.getDefaultToolkit().beep();
                    String title = buyStock.getStockName() + "(" + buyStock.getStockCode() + ")：" + ",现价：" + nowPrice;
//                    sendEmail(title, msg);
                    AppendFile.method1("/Users/liaoqiangang/Desktop/stock.txt", msg);
                }
            }
        } catch (Exception e) {
            log.info("###Error###：" + resultContent);
        }


    }
}