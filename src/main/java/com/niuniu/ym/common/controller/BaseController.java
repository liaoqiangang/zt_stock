package com.niuniu.ym.common.controller;

import java.io.PrintWriter;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.bind.ServletRequestDataBinder;
import org.springframework.web.bind.annotation.InitBinder;

import com.alibaba.fastjson.JSON;
import com.niuniu.ym.common.dto.AjaxResponseDto;
import com.niuniu.ym.common.util.ApplicationPropertiesUtil;
import com.niuniu.ym.common.util.BooleanEditor;
import com.niuniu.ym.common.util.DateEditor;
import com.niuniu.ym.common.util.DoubleEditor;
import com.niuniu.ym.common.util.IntegerEditor;
import com.niuniu.ym.common.util.LongEditor;

public abstract class BaseController {
	
	protected static final String UPLOAD_FILE = "/upload/enbuffet";

	protected static final Logger logger = LoggerFactory.getLogger(BaseController.class);
	
	protected static final String OPERATE_SUCESS ="操作成功！";
	
	protected static final String OPERATE_ERROR ="操作失败！";
	
	@InitBinder
	protected void initBinder(HttpServletRequest request,
			ServletRequestDataBinder binder) throws Exception {
		
		binder.registerCustomEditor(int.class, new IntegerEditor());
		binder.registerCustomEditor(long.class, new LongEditor());
		binder.registerCustomEditor(double.class, new DoubleEditor());
		binder.registerCustomEditor(Date.class, new DateEditor());
		binder.registerCustomEditor(Boolean.class, new BooleanEditor());
		//binder.registerCustomEditor(String.class, new StringEscapeEditor(true, true, true));
	}
	
	protected void ajaxDoneSuccess(HttpServletResponse response, String message) {
		ajaxResponseMessage(response, 200,message);
	}
	
	protected void ajaxDoneSuccessForward(HttpServletResponse response, String message,String  forwardUrl) {
		AjaxResponseDto responseDto = new AjaxResponseDto();
		responseDto.setStatusCode(200);
		responseDto.setMessage(message);
		responseDto.setCallbackType("forward");
		responseDto.setForwardUrl(forwardUrl);
		printWriterAjax(response, responseDto);
	}
	
	protected void ajaxDoneSuccessRel(HttpServletResponse response, String message,String  rel) {
		AjaxResponseDto responseDto = new AjaxResponseDto();
		responseDto.setStatusCode(200);
		responseDto.setMessage(message);
		responseDto.setRel(rel);
		printWriterAjax(response, responseDto);
	}
	protected void ajaxDoneSuccessRel(HttpServletResponse response, String message,String  rel,boolean closeCurrent) {
		AjaxResponseDto responseDto = new AjaxResponseDto();
		responseDto.setStatusCode(200);
		responseDto.setMessage(message);
		responseDto.setRel(rel);
		if(closeCurrent){
			responseDto.setCallbackType("closeCurrent");
		}
		printWriterAjax(response, responseDto);
	}
	protected void ajaxDoneSuccessFreshTab(HttpServletResponse response, String message,String  navTabId,boolean closeCurrent) {
		AjaxResponseDto responseDto = new AjaxResponseDto();
		responseDto.setStatusCode(200);
		responseDto.setMessage(message);
		responseDto.setNavTabId(navTabId);
		if(closeCurrent){
			responseDto.setCallbackType("closeCurrent");
		}
		printWriterAjax(response, responseDto);
	}
	protected void ajaxDoneSuccessCloseCurrent(HttpServletResponse response, String message) {
		AjaxResponseDto responseDto = new AjaxResponseDto();
		responseDto.setStatusCode(200);
		responseDto.setMessage(message);
		responseDto.setCallbackType("closeCurrent");
		printWriterAjax(response, responseDto);
	}
	protected void ajaxDoneSuccessDialogRel(HttpServletResponse response, String message,String  rel) {
		AjaxResponseDto responseDto = new AjaxResponseDto();
		responseDto.setStatusCode(200);
		responseDto.setMessage(message);
		responseDto.setRel(rel);
		responseDto.setCallbackType("closeCurrent");
		printWriterAjax(response, responseDto);
	}
	protected void ajaxDoneSuccessDialogForward(HttpServletResponse response, String message,String forwardUrl) {
		AjaxResponseDto responseDto = new AjaxResponseDto();
		responseDto.setStatusCode(200);
		responseDto.setMessage(message);
		responseDto.setForwardUrl(forwardUrl);
		responseDto.setCallbackType("closeCurrent");
		printWriterAjax(response, responseDto);
	}
	
	protected void ajaxDoneError(HttpServletResponse response, String message) {
		ajaxResponseMessage(response, 500,message);
	}
	
	protected void ajaxDoneWarn(HttpServletResponse response, String message) {
		ajaxResponseMessage(response, 300,message);
	}
	
	private void ajaxResponseMessage(HttpServletResponse response, int statusCode,String message) {
		AjaxResponseDto responseDto = new AjaxResponseDto();
		responseDto.setStatusCode(statusCode);
		responseDto.setMessage(message);
		printWriterAjax(response, responseDto);
	}
	
	/**
	 * 将结果写到页面内容上，作为Ajax请求的结果
	 * TODO
	 * @param response
	 * @param message
	 */
	protected void printWriterAjax(HttpServletResponse response, Object obj){
		response.setContentType("text/json; charset=utf-8");
		response.setCharacterEncoding("utf-8");
		
		try {
			PrintWriter pwriter = response.getWriter();
			pwriter.print(JSON.toJSONString(obj));
			pwriter.close();
		}catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	/**
	 * 将结果写到页面内容上，作为Ajax请求的结果 "text/json; charset=utf-8"
	 * TODO
	 * @param response
	 * @param message
	 */
	protected void printWriterAjax(HttpServletResponse response, Object obj,String contentType){
		response.setContentType(contentType);
		response.setCharacterEncoding("utf-8");
		
		try {
			PrintWriter pwriter = response.getWriter();
			pwriter.print(JSON.toJSONString(obj));
			pwriter.close();
		}catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	/**
	 * 将结果写到页面内容上，作为Ajax请求的结果
	 * TODO
	 * @param response
	 * @param message
	 */
	protected void printWriterStringAjax(HttpServletRequest request,
			HttpServletResponse response, String string){
		String callback = request.getParameter("callback");
		if(StringUtils.isNotBlank(callback)){
			string = callback + "(" + string + ")";
		}
		
		response.setContentType("text/json; charset=utf-8");
		response.setCharacterEncoding("utf-8");
		
		try {
			PrintWriter pwriter = response.getWriter();
			pwriter.print(string);
			pwriter.close();
		}catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	
	/**
	 * 获取baseUrl
	 * @param request
	 * @return 结果 
	 */
	protected String getBaseUrl(HttpServletRequest request){
		String path = request.getContextPath();
		int port = request.getServerPort();
		String serverPort = "";
		if(port != 80){
			serverPort = ":"+port;
		}
		String basePath = request.getScheme()+"://"+request.getServerName()+serverPort+path+"/";
		return basePath;
	}
	
	/**
	 * 网站域名地址
	 * @return
	 */
	protected String getWebDomain(){
		String domain = ApplicationPropertiesUtil.getValue("hosts.domain");
		return domain;
	}
	
	/**
	 * 图片等静态文件域名地址
	 * @return
	 */
	protected String getImgDomain(){
		String domain = ApplicationPropertiesUtil.getValue("img.domain");
		return domain;
	}
	
	/**
	 * 
	 * @param request
	 * @return
	 */
	protected String getIpAddr(HttpServletRequest request) {  
	    String ip = request.getHeader("x-forwarded-for");  
	    if(ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {  
	        ip = request.getHeader("Proxy-Client-IP");  
	    }  
	    if(ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {  
	        ip = request.getHeader("WL-Proxy-Client-IP");  
	    }  
	    if(ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {  
	        ip = request.getRemoteAddr();  
	    }  
	    return ip;  
	}  
}
