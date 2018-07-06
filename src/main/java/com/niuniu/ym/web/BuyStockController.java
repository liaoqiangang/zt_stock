package com.niuniu.ym.web;

import java.text.DecimalFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Collections;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import com.niuniu.ym.common.controller.BaseController;
import com.niuniu.ym.entity.BuyStock;
import com.niuniu.ym.enums.StockType;
import com.niuniu.ym.filter.BuyStockFilter;
import com.niuniu.ym.service.BuyStockService;
import com.niuniu.ym.util.DateUtil;
import com.niuniu.ym.util.HttpClientUtil;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/maintain/buyStock")
public class BuyStockController extends BaseController {

	@Autowired
	private BuyStockService buyStockService;
	
	@RequestMapping("")
	public String index(){
		return "/index";
	}
	
	@RequestMapping("/list")
	public String list(ModelMap modelMap,BuyStockFilter filter){
		filter.setNumPerPage(50);
		filter.setOrderField("create_time");
		filter.setOrderDirection("desc");
		int totalRows = buyStockService.countByFilter(filter);
		filter.setTotalRows(totalRows);
		List<BuyStock> buyStockList = buyStockService.searchByFilter(filter);
		for (BuyStock stock:buyStockList) {
			StockType stockType = new StockType(stock.getStockCode());
			String stockCodeUrl = "http://hq.sinajs.cn/list="
					+ stockType.getStockType() + stockType.getStockCode();
			String resultContent = HttpClientUtil.get(stockCodeUrl, "GBK");
			resultContent = resultContent.substring(
					resultContent.indexOf("=\"") + 2, resultContent.indexOf("\";"));
			String[] stockArrs = resultContent.split(",");
			String beginPricestr = stockArrs[1]; // 开盘价
			String yesterdayPricestr = stockArrs[2]; // 昨 收盘价
			String nowPricestr = stockArrs[3]; // 现价
			String b_1_str = stockArrs[11]; // 买1
			if(Double.valueOf(b_1_str)==null||b_1_str.equals("0.000")){//
				b_1_str = stockArrs[21];
			}
			String lowPricestr = stockArrs[5]; // 最低价

			double yinling;
			if(Double.valueOf(b_1_str)==null||b_1_str.equals("0.000")){//
				yinling = 0;
			}else{
				yinling = (Double.valueOf(b_1_str)-Double.valueOf(stock.getNowPrice()))/Double.valueOf(stock.getNowPrice());
			}
			yinling = Double.parseDouble(new DecimalFormat("#.###").format(yinling*100));


			double zhangdiefu;
			if(Double.valueOf(b_1_str)==null||b_1_str.equals("0.000")){//
				zhangdiefu = 0;
			}else{
				zhangdiefu = (Double.valueOf(b_1_str)-Double.valueOf(yesterdayPricestr))/Double.valueOf(yesterdayPricestr);
			}
			zhangdiefu = Double.parseDouble(new DecimalFormat("#.###").format(zhangdiefu*100));
			stock.setZhangdiefu(zhangdiefu);
			String remark = "预警价："+stock.getNowPrice() +"		现价："+nowPricestr +"（"+zhangdiefu+"%）	买入盈利情况："+yinling +"%" ;

			stock.setRemark(remark);
			stock.setYlPortal(yinling);

			SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddhhmmss");
			try {
				Date date = sdf.parse(stock.getCreateTime());
				SimpleDateFormat shijian = new SimpleDateFormat("hh:mm:ss");
				SimpleDateFormat riqi = new SimpleDateFormat("yyyy-MM-dd");
				String createTime = shijian.format(date);
				stock.setCreateTime(createTime);
				stock.setRiqi(riqi.format(date));
			} catch (ParseException e) {
				e.printStackTrace();
			}
		}
//		Collections.sort(buyStockList);
		modelMap.put("buyStockList", buyStockList);
		modelMap.put("filter", filter);
		return "/buyStock/list";
	}
	
	@RequestMapping("/add")
	public String add(){
		return "/buyStock/add";
	}
	
	@RequestMapping("/edit/{id}")
	public String edit(@PathVariable("id") int id,ModelMap modelMap){
		BuyStock buyStock = buyStockService.selectById(id);
		modelMap.put("buyStock", buyStock);
		return "/buyStock/add";
	}
	
	@RequestMapping("/save")
	public String save(ModelMap modelMap,BuyStock buyStock,HttpServletResponse response){
		if(buyStock.getId() == 0){
			buyStockService.insert(buyStock);
		}else{
			buyStockService.updateBySelective(buyStock);
		}
		ajaxDoneSuccess(response, "操作成功");
		return null;
	}
	
	@RequestMapping("/delete/{id}")
	public String delete(@PathVariable("id") int id,ModelMap modelMap,BuyStock buyStock,HttpServletResponse response){
		buyStockService.deleteById(id);
		ajaxDoneSuccess(response, "操作成功");
		return null;
	}
}
