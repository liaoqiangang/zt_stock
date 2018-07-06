package com.niuniu.ym.web;

import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.niuniu.ym.common.controller.BaseController;
import com.niuniu.ym.entity.Stock;
import com.niuniu.ym.enums.StockType;
import com.niuniu.ym.filter.StockFilter;
import com.niuniu.ym.service.StockService;
import com.niuniu.ym.util.DateUtil;

@Controller
@RequestMapping("/sso")
public class LoginController extends BaseController {

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
	public String list(ModelMap modelMap, StockFilter filter,HttpServletRequest request) {
		// 0-优股籍；1-短线宝；2-圈子；
		String type = filter.getType();
		modelMap.put("addType", type);
		if (StringUtils.isNotEmpty(type)) {
			if (type.equals("0")) {
				filter.setType("优股籍");
			} else if (type.equals("1")) {
				filter.setType("短线宝");
			} else if (type.equals("2")) {
				filter.setType("圈子");
			}
		}
		String selType = request.getParameter("selType");
		if(StringUtils.isNotEmpty(selType)){
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			//默认时间
			Date day = new Date();//今天
			filter.setStartTime(DateUtil.getBeginDayDate(day));
			filter.setEndTime(DateUtil.getEndTimeOfDate(day));
		}else{
			Date day = filter.getStartTime();
			if(day!=null){
				filter.setStartTime(DateUtil.getBeginDayDate(day));
				filter.setEndTime(DateUtil.getEndTimeOfDate(day));
			}
		}
		List<Stock> stockList = stockService.searchByFilter(filter);
		int totalRows = stockService.countByFilter(filter);
		filter.setTotalRows(totalRows);
//		for (Stock stock : stockList) {
//			String fileUrl = stock.getFileUrl();
//			if(StringUtils.isNotEmpty(fileUrl)){
//				if(!fileUrl.contains("http://")){
//					fileUrl = "http://localhost:81/"+fileUrl;
//			}
////			stock.setFileUrl(fileUrl);
//			stockService.updateBySelective(stock);
//		}
		modelMap.put("stockList", stockList);
		modelMap.put("filter", filter);
		return "/stock/list";
	}

	@RequestMapping("/add")
	public String add(ModelMap modelMap,HttpServletRequest request) {
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
	public String edit(@PathVariable("id") int id, ModelMap modelMap,HttpServletRequest request) {
		Stock stock = stockService.selectById(id);
		modelMap.put("entity", stock);
		String relType =  request.getParameter("relType"); 
		if(StringUtils.isNotEmpty(relType)){
			return "/stock/article_1";
		}else{
			return "/stock/add";
		}
	}

	@RequestMapping("/save")
	public String save(ModelMap modelMap, Stock stock,
			HttpServletResponse response) {
		Map<String, Object> map = new HashMap<String, Object>();
		String stockCode = stock.getStockCode();
		if(StringUtils.isNotEmpty(stockCode)){
			StockType stockType = new StockType(stockCode);
			stock.setPlate(stockType.getPlateName());
		}
		if(StringUtils.isNotEmpty(stock.getFileUrl())){
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
		SaveFileFromInputStream(in ,"D:/apache-tomcat-6.0.20/webapps/img/",fileName);  
		result.append(id+","+"http://localhost/img/"+fileName+","+fileType+","+originalFilename);
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
	 * @param id
	 * @param modelMap
	 * @param response
	 * @return
	 */
	@RequestMapping("/nextStock/{id}")
	public String nextStock(@PathVariable("id")Integer id,ModelMap modelMap,
			HttpServletRequest request,HttpServletResponse response){
		Map<String,Object> map = new HashMap<String,Object>();
		try {
			String nextType = request.getParameter("nextType");
			Stock stock = stockService.selectNextStock(id,nextType);
			if(stock!=null){
				map.put("entity", stock);
				map.put("stockId", stock.getId());
				map.put("msg", "ok");
			}else{
				map.put("msg", "null");
			}		
		} catch (Exception e) {
			map.put("msg", "error");
			e.printStackTrace();
		}
		printWriterAjax(response, map);
		return null;
	}
	
}
