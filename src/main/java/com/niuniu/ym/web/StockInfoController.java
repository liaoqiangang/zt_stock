package com.niuniu.ym.web;

import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.niuniu.ym.common.controller.BaseController;
import com.niuniu.ym.entity.StockInfo;
import com.niuniu.ym.filter.StockInfoFilter;
import com.niuniu.ym.service.StockInfoService;

@Controller
@RequestMapping("/maintain/stockInfo")
public class StockInfoController extends BaseController{

	@Autowired
	private StockInfoService stockInfoService;
	
	@RequestMapping("")
	public String index(){
		return "/index";
	}
	
	@RequestMapping("/list")
	public String list(ModelMap modelMap,StockInfoFilter filter){
		List<StockInfo> stockInfoList = stockInfoService.searchByFilter(filter);
		int totalRows = stockInfoService.countByFilter(filter);
		filter.setTotalRows(totalRows);
		modelMap.put("stockInfoList", stockInfoList);
		modelMap.put("filter", filter);
		return "/stockInfo/list";
	}
	
	@RequestMapping("/add")
	public String add(){
		return "/stockInfo/add";
	}
	
	@RequestMapping("/edit/{id}")
	public String edit(@PathVariable("id") int id,ModelMap modelMap){
		StockInfo stockInfo = stockInfoService.selectById(id);
		modelMap.put("stockInfo", stockInfo);
		return "/stockInfo/add";
	}
	
	@RequestMapping("/save")
	public String save(ModelMap modelMap,StockInfo stockInfo,HttpServletResponse response){
		if(stockInfo.getId() == 0){
			stockInfoService.insert(stockInfo);
		}else{
			stockInfoService.updateBySelective(stockInfo);
		}
		ajaxDoneSuccess(response, "操作成功");
		return null;
	}
	
	@RequestMapping("/delete/{id}")
	public String delete(@PathVariable("id") int id,ModelMap modelMap,StockInfo stockInfo,HttpServletResponse response){
		stockInfoService.deleteById(id);
		ajaxDoneSuccess(response, "操作成功");
		return null;
	}
}
