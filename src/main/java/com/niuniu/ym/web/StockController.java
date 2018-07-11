package com.niuniu.ym.web;

import com.niuniu.ym.common.controller.BaseController;
import com.niuniu.ym.entity.Stock;
import com.niuniu.ym.enums.StockType;
import com.niuniu.ym.filter.StockFilter;
import com.niuniu.ym.service.StockService;
import com.niuniu.ym.util.CsvUtil;
import com.niuniu.ym.util.DateUtil;
import com.niuniu.ym.util.HttpClientUtil;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.math.BigDecimal;
import java.math.RoundingMode;
import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.*;

@Controller
@RequestMapping("/stock")
public class StockController extends BaseController {

    @Autowired
    private StockService stockService;


    /**
     * 跳转到首页
     *
     * @return
     */
    @RequestMapping("")
    public String index() {

        return "/index";
    }

    /**
     * 预测页面
     *
     * @return
     */
    @RequestMapping("yuce")
    public String yuce() {
        return "/stock/yuce";
    }

    /**
     * 列表页 type 0-优股籍；1-短线宝；2-圈子；
     *
     * @param modelMap
     * @param filter
     * @return
     */
    @RequestMapping("/list")
    public String list(ModelMap modelMap, StockFilter filter, HttpServletRequest request) {
        filter.setMonitor(1);
        String selType = request.getParameter("selType");
        if (StringUtils.isNotEmpty(selType)) {
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
            //默认时间
            Date day = DateUtil.getNextDay(new Date());//前两天
            filter.setStartTime(DateUtil.getBeginDayDate(day));
            filter.setEndTime(DateUtil.getEndTimeOfDate(day));
        } else {
            Date day = filter.getStartTime();
            if (day != null) {
                filter.setStartTime(DateUtil.getBeginDayDate(day));
                filter.setEndTime(DateUtil.getEndTimeOfDate(day));
            }
        }
//        filter.setNumPerPage(50);
        filter.setOrderField("order_num");
        filter.setOrderDirection("desc");
        int totalRows = stockService.countByFilter(filter);
//        filter.setNumPerPage(totalRows);
        List<Stock> stockList = stockService.searchByFilter(filter);
        filter.setTotalRows(totalRows);

        double gold_0_23 = 0.23;
        for (Stock stock : stockList) {
            String season = "";
            StockType stockType = new StockType(stock.getStockCode());
            String stockCodeUrl = "http://hq.sinajs.cn/list="
                    + stockType.getStockType() + stockType.getStockCode();
            String resultContent = HttpClientUtil.get(stockCodeUrl, "GBK");
            try{
                if (!StringUtils.isEmpty(resultContent)) {
                    resultContent = resultContent.substring(
                            resultContent.indexOf("=\"") + 2, resultContent.indexOf("\";"));
                    String[] stockArrs = resultContent.split(",");
                    String beginPricestr = stockArrs[1]; // 开盘价
                    String yesterdayPricestr = stockArrs[2]; // 昨 收盘价
                    String nowPricestr = stockArrs[3]; // 现价
                    String b_1_str = stockArrs[11]; // 买1
                    if(StringUtils.isEmpty(b_1_str)){
                        b_1_str = stock.gethPrice()+"";
                    }
                    String lowPricestr = stockArrs[5]; // 最低价
                    if(StringUtils.isEmpty(lowPricestr)){
                        lowPricestr = stock.gethPrice()+"";
                    }
                    //处理涨跌幅
                    double zhangdiefu;
                    if (Double.valueOf(b_1_str) == null || b_1_str.equals("0.000")) {//
                        zhangdiefu = 0;
                    } else {
                        zhangdiefu = (Double.valueOf(b_1_str) - Double.valueOf(yesterdayPricestr)) / Double.valueOf(yesterdayPricestr);
                    }
                    zhangdiefu = Double.parseDouble(new DecimalFormat("#.###").format(zhangdiefu * 100));
                    double nowPrice = Double.parseDouble(new DecimalFormat("#.###").format(Double.valueOf(nowPricestr)));
                    double lowPrice = Double.parseDouble(new DecimalFormat("#.###").format(Double.valueOf(lowPricestr)));

                    //涨停  开盘价
                    Double zt_open = Double.valueOf(stock.getlPrice());
                    int retval = Double.valueOf(zt_open).compareTo(nowPrice);

                    int dipo_openprice = Double.valueOf(nowPrice).compareTo(zt_open);
                    int dipo_openprice1_01 = Double.valueOf(nowPrice).compareTo(zt_open * 1.01);
                    //TODO  实时播报	跌破 涨停开盘价(到达开盘价附近1.01)
                    String msg = "";
                    if (dipo_openprice < 0 || dipo_openprice1_01 < 0) {
                        stock.setOrderNum(1);//飘红
                        season = "跌破   涨停开盘价：" + stock.getlPrice() + "  现价：" + nowPrice;
                    } else {
                        season = "涨停开盘价：" + stock.getlPrice();
                    }
                    stock.setBuy(nowPricestr);
                    stock.setSeason(season);
                    stock.setZdf(zhangdiefu);
                    int day = DateUtil.getweekdays(stock.getSelTime(), new Date());
                    //TODO  高开 不回补缺口
                    //涨停的 第二天股票  高开高走，最差，也不回补缺口
                    if (filter.getStrongstock() == 1 && day == 2) {
                        // 当天  开盘价大于前天收盘价
                        int i = Double.valueOf(beginPricestr).compareTo(Double.valueOf(stock.gethPrice()));
                        //开盘价大于前天收盘价
                        int j = Double.valueOf(lowPrice).compareTo(Double.valueOf(stock.gethPrice()));
                        if (i > 0 && j > 0) {
                            SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmm");
                            String dateStr = sdf.format(new Date());
                            int HHmm = Integer.valueOf(dateStr.substring(8, dateStr.length()));
                            if (1455 > HHmm && HHmm > 1440) {//14:40~14:55  播报
                                season = "高开，不回补缺口，关注：" + stock.getStockName() + "(" + stock.getStockCode() + ")" + " 现价：" + nowPrice + " 涨跌幅：" + zhangdiefu + "%" + " 昨日收盘：" + stock.gethPrice() + " 最低价：" + lowPrice + " 开盘价：" + beginPricestr;
//						stock.setSeason(season);
                                System.out.println(season);
                            }
                        }
                    }

                    //TODO 尾盘买入法  当天跌破开盘价，现价收在开盘价上方
                    //涨停后第几天 工作日  回调具体时间
                    Double open1_01 = Double.valueOf(stock.getlPrice());
                    SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmm");
                    String dateStr = sdf.format(new Date());
                    int HHmm = Integer.valueOf(dateStr.substring(8, dateStr.length()));
                    if (1445 < HHmm && HHmm < 1500) {//14:45~15:00  播报
                        int dipo = Double.valueOf(open1_01).compareTo(lowPrice);//跌破开盘价
                        int shouhui = Double.valueOf(nowPrice).compareTo(stock.getlPrice());//现价 大于开盘价  ++++++现阶段收盘价++++++
                        if (dipo > 0 && shouhui > 0) {
                            season = "跌破，拉回，尾盘买入法（最低价：" + lowPricestr + "），回调天数（" + day + "）： 股票：" + stock.getStockName() + "（" + stock.getStockCode() + "）现价：" + nowPrice + "   涨停开盘价：" + stock.getlPrice() + "，关注买入！\n";
                            stock.setSeason(season);
                        }
                    }
                }
            }catch (Exception e){
                logger.info("###Error###：",resultContent);
            }
        }
        Collections.sort(stockList);
        modelMap.put("stockList", stockList);
        modelMap.put("filter", filter);
        return "/stock/list";
    }

    public static double formatDouble2(double d) {
        // 新方法，如果不需要四舍五入，可以使用RoundingMode.DOWN
        BigDecimal bg = new BigDecimal(d).setScale(2, RoundingMode.DOWN);
        return bg.doubleValue();
    }

    @RequestMapping("/add")
    public String add(ModelMap modelMap, HttpServletRequest request) {
        String addType = request.getParameter("addType");
        Stock stock = new Stock();
        stock.setSelTime(new Date());
        if (StringUtils.isNotEmpty(addType)) {
            if (addType.equals("0")) {
                stock.setType("优股籍");
            } else if (addType.equals("1")) {
                stock.setType("短线宝");
            } else if (addType.equals("2")) {
                stock.setType("圈子");
            }
        }
        modelMap.put("entity", stock);
        return "/stock/add";
    }

    @RequestMapping("/edit/{id}")
    public String edit(@PathVariable("id") int id, ModelMap modelMap, HttpServletRequest request) {
        Stock stock = stockService.selectById(id);
        modelMap.put("entity", stock);
        String relType = request.getParameter("relType");
        if (StringUtils.isNotEmpty(relType)) {
            return "/stock/article_1";
        } else {
            return "/stock/add";
        }
    }

    @RequestMapping("/save")
    public String save(ModelMap modelMap, Stock stock,
                       HttpServletResponse response) {
        Map<String, Object> map = new HashMap<String, Object>();
        String stockCode = stock.getStockCode();
        if (StringUtils.isNotEmpty(stockCode)) {
            StockType stockType = new StockType(stockCode);
            stock.setPlate(stockType.getPlateName());
        }
        if (StringUtils.isNotEmpty(stock.getFileUrl())) {
            stock.setFileUrl(stock.getFileUrl().replace("http://localhost/", ""));
        }
        if (stock.getId() == 0) {
            stock = stockService.insert(stock);
        } else {
            stockService.updateBySelective(stock);
        }
        map.put("stockId", stock.getId() + "");
        map.put("statusCode", 200);
        map.put("message", "操作成功！");
        printWriterAjax(response, map);
        return null;
    }

    @RequestMapping("/delete/{id}")
    public String delete(@PathVariable("id") int id, ModelMap modelMap,
                         Stock stock, HttpServletResponse response) {
        stockService.deleteById(id);
        ajaxDoneSuccess(response, "操作成功");
        return null;
    }

    @RequestMapping("/swfuploadPage")
    public String swfupload(ModelMap modelMap, HttpServletRequest request) {
        String id = request.getParameter("id");
        if (id != null) {
            modelMap.put("id", id);
        }
        return "/stock/swfupload";
    }

    @RequestMapping("/swfupload")
    public String fileUpload(HttpServletRequest request,
                             HttpServletResponse response,
                             @RequestParam("filedata") MultipartFile multipartFile)
            throws Exception {
        StringBuffer result = new StringBuffer();
        String id = request.getParameter("id");
        Stock stock = stockService.selectById(Integer.valueOf(id));
        int fileSize = (int) multipartFile.getSize();
        String fileName = "";
        InputStream in = multipartFile.getInputStream();
        String originalFilename = multipartFile.getOriginalFilename();
        String suffix = originalFilename.substring(originalFilename
                .lastIndexOf("."));
        String fileType = suffix.substring(1).toLowerCase();
        fileName = new Date().getTime() + suffix;
        SaveFileFromInputStream(in, "D:/apache-tomcat-6.0.20/webapps/img/", fileName);
        result.append(id + "," + "http://localhost/img/" + fileName + "," + fileType + "," + originalFilename);
        printWriterStringAjax(request, response, result.toString());
        return null;
    }

    public void SaveFileFromInputStream(InputStream stream, String path,
                                        String filename) throws IOException {
        // D:\apache-tomcat-6.0.20\webapps
        FileOutputStream fs = new FileOutputStream(path + "/" + filename);
        byte[] buffer = new byte[1024 * 1024];
        int bytesum = 0;
        int byteread = 0;
        while ((byteread = stream.read(buffer)) != -1) {
            bytesum += byteread;
            fs.write(buffer, 0, byteread);
            fs.flush();
        }
        fs.close();
        stream.close();
    }

    /**
     * 编辑
     *
     * @param id
     * @param modelMap
     * @param response
     * @return
     */
    @RequestMapping("/nextStock/{id}")
    public String nextStock(@PathVariable("id") Integer id, ModelMap modelMap,
                            HttpServletRequest request, HttpServletResponse response) {
        Map<String, Object> map = new HashMap<String, Object>();
        try {
            String nextType = request.getParameter("nextType");
            Stock stock = stockService.selectNextStock(id, nextType);
            if (stock != null) {
                map.put("entity", stock);
                map.put("stockId", stock.getId());
                map.put("msg", "ok");
            } else {
                map.put("msg", "null");
            }
        } catch (Exception e) {
            map.put("msg", "error");
            e.printStackTrace();
        }
        printWriterAjax(response, map);
        return null;
    }


    /**
     * Excel导入
     *
     * @param request
     * @param modelMap
     * @return
     */
    @RequestMapping("/toImportFund")
    public String importExcelPage(HttpServletRequest request, ModelMap modelMap) {
        String excelType = request.getParameter("excelType");
        modelMap.put("excelType", excelType);
        return "/stock/importFund";
    }


    /**
     * Excel导入排名  基金信息
     *
     * @param multipartFile
     * @param request
     * @param response
     * @return
     */
    @RequestMapping("/importFundExcel")
    public String importFundExcel(@RequestParam("file") MultipartFile multipartFile, HttpServletRequest request, HttpServletResponse response) {
        try {
            Map<String, String> map = new HashMap<String, String>();
            /*	获取excel文件内容*/
//            String[][] data = ReadExcelUtils.getData(multipartFile.getInputStream(), 0, 1);
            String[][] data = CsvUtil.getCsvData(multipartFile.getInputStream(), 1);
			/*	获取文件日期*/
            String date = "2018" + multipartFile.getOriginalFilename().split("-")[1].replace(".csv", "");
            if (data != null) {
				/*迁移昨天数据*/
//                stockService.transferAllData();
                for (String[] rows : data) {
                    try {
                        String stockName = rows[1];//股票名称
                        String stockCode = rows[2];//股票代码
                        String lPrice = rows[15];//开盘价
                        String z_close = rows[16];//涨停前一天的收盘价
                        String hPrice = rows[3];//现价
						/*去除一字板  */
                        if (rows[3].equals(rows[15])) {//收盘价==开盘价
                            continue;
                        }
                        /*去除开盘一字板*/
                        if(rows[13].equals(rows[15])){//开盘价==最高价
                            continue;
                        }

						/*五日涨跌幅  大于30%的 去除*/
                        String five_day_zhangdiefu = rows[7].replace("%", "");
                        if (Double.valueOf(five_day_zhangdiefu) > 30) {//五日涨跌幅
                            continue;
                        }
                        stockCode = stockCode.replace(".0", "");
                        int sCode = Integer.valueOf(stockCode);
                        if (sCode < 10000) {
                            if (sCode < 1000) {
                                stockCode = "000" + sCode;
                            } else if (sCode < 100) {
                                stockCode = "0000" + sCode;
                            } else {
                                stockCode = "00" + sCode;
                            }
                        } else {
                            stockCode = sCode + "";
                        }


                        System.out.println("名称：" + stockName + "\t代码：" + stockCode + "\t收盘价：" + hPrice + "\t开盘：" + lPrice);
                        Stock stock = new Stock();
                        stock.setzClose(Double.valueOf(z_close));//涨停前一天收盘价
                        stock.setStockName(stockName);//股票名称
                        stock.setStockCode(stockCode);
                        stock.sethPrice(Double.valueOf(hPrice));//涨停价
                        stock.setlPrice(Double.valueOf(lPrice));//开盘价
                        SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
                        stock.setSelTime(sdf.parse(date));//入选日期
                        stock.setMonitor(1);//监控
                        stock.setOrderNum(0);//持股
                        StockType st = new StockType(stockCode);
                        stock.setPlate(st.getPlateName());//板块
                        stockService.insertBySelective(stock);
                    } catch (Exception e) {
                        e.printStackTrace();
                    }
                }
            }
            printWriterAjax(response, "导入成功！");
        } catch (Exception e) {
            e.printStackTrace();
            ajaxDoneError(response, "导入失败！");
        }
        return null;
    }

}
