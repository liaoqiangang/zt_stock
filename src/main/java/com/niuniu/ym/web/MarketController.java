package com.niuniu.ym.web;

import com.niuniu.ym.common.controller.BaseController;
import com.niuniu.ym.entity.Market;
import com.niuniu.ym.filter.StockFilter;
import com.niuniu.ym.service.MarketService;
import com.niuniu.ym.util.DateUtil;
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
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/market")
public class MarketController extends BaseController {

	@Autowired
	private MarketService marketService;

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
			Date nextDay = new Date();//今天
			filter.setStartTime(DateUtil.getBeginDayDate(nextDay));
			filter.setEndTime(DateUtil.getEndTimeOfDate(nextDay));
		}
		List<Market> marketList = marketService.searchByFilter(filter);
		int totalRows = marketService.countByFilter(filter);
		filter.setTotalRows(totalRows);
		modelMap.put("marketList", marketList);
		modelMap.put("filter", filter);
		return "/market/list";
	}

	@RequestMapping("/add")
	public String add(ModelMap modelMap,HttpServletRequest request) {
		String addType = request.getParameter("addType");
		Market market = new Market();
		modelMap.put("entity", market);
		return "/market/add";
	}

	@RequestMapping("/edit/{id}")
	public String edit(@PathVariable("id") int id, ModelMap modelMap,HttpServletRequest request) {
		Market market = marketService.selectById(id);
		modelMap.put("entity", market);
		String relType =  request.getParameter("relType"); 
		if(StringUtils.isNotEmpty(relType)){
			return "/market/view";
		}else{
			return "/market/add";
		}
	}

	@RequestMapping("/save")
	public String save(ModelMap modelMap, Market market,
			HttpServletResponse response) {
		Map<String, Object> map = new HashMap<String, Object>();
		if (market.getId() == 0) {
			market = marketService.insert(market);
		} else {
			marketService.updateBySelective(market);
		}
		map.put("marketId", market.getId() + "");
		map.put("statusCode", 200);
		map.put("message", "操作成功！");
		printWriterAjax(response, map);
		return null;
	}

	@RequestMapping("/delete/{id}")
	public String delete(@PathVariable("id") int id, ModelMap modelMap,
			Market market, HttpServletResponse response) {
		marketService.deleteById(id);
		ajaxDoneSuccess(response, "操作成功");
		return null;
	}

	@RequestMapping("/swfuploadPage")
	public String swfupload(ModelMap modelMap, HttpServletRequest request) {
		String id = request.getParameter("id");
		if (id != null) {
			modelMap.put("id", id);
		}
		return "/market/swfupload";
	}

	@RequestMapping("/swfupload")
	public String fileUpload(HttpServletRequest request,
			HttpServletResponse response,
			@RequestParam("filedata") MultipartFile multipartFile)
			throws Exception {
		StringBuffer result = new StringBuffer();
		String id = request.getParameter("id");
		Market market = marketService.selectById(Integer.valueOf(id));
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
	@RequestMapping("/nextMarket/{id}")
	public String nextStock(@PathVariable("id")Integer id,ModelMap modelMap,
			HttpServletRequest request,HttpServletResponse response){
		Map<String,Object> map = new HashMap<String,Object>();
		try {
			String nextType = request.getParameter("nextType");
			Market market = marketService.selectNextMarket(id,nextType);
			if(market!=null){
				map.put("entity", market);
				map.put("marketId", market.getId());
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
