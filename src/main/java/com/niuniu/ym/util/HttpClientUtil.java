package com.niuniu.ym.util;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.ConnectException;
import java.net.HttpURLConnection;
import java.net.SocketTimeoutException;
import java.net.URL;
import java.util.HashMap;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;


/**
 * HttpClient接口工具类
 * 
 * @author tangshuren
 * @date 2013-11-1
 * 
 */
public class HttpClientUtil {

	private static Logger log = LoggerFactory.getLogger(HttpClientUtil.class);

	/**
	 * int转换成char
	 * 
	 * @param i
	 * @return
	 */
	public static char transToLetter(int i) {
		char c = (char) (i + 65);
		return c;
	}

	public static String httpRequest(String requestUrl, String requestMethod,
			String outputStr,String charset,Map<String,String> headerMap) {
		if(charset == null){
			charset = "UTF-8";
		}
		StringBuffer response = new StringBuffer();
		InputStream inputStream = null;
		InputStreamReader inputStreamReader = null;
		BufferedReader bufferedReader = null;
		HttpURLConnection httpUrlConn = null;
		try {
//			log.debug(requestUrl);
			URL url = new URL(requestUrl);
			httpUrlConn = (HttpURLConnection) url.openConnection();
			httpUrlConn.setRequestProperty("User-Agent", "Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.71 Safari/537.36");
			if(headerMap != null && headerMap.size() > 0){
				for(String key : headerMap.keySet()){
					httpUrlConn.setRequestProperty(key,headerMap.get(key));
				}
	        }
			httpUrlConn.setDoOutput(true);
			httpUrlConn.setDoInput(true);
			httpUrlConn.setUseCaches(false);
			httpUrlConn.setConnectTimeout(20000);
			httpUrlConn.setReadTimeout(20000);
			// 设置请求方式（GET/POST）
			httpUrlConn.setRequestMethod(requestMethod.toUpperCase());
			
			if ("GET".equalsIgnoreCase(requestMethod.toUpperCase()))
				httpUrlConn.connect();
			
			// 当有数据需要提交时
			if (null != outputStr) {
				OutputStream outputStream = httpUrlConn.getOutputStream();
				// 注意编码格式，防止中文乱码
				outputStream.write(outputStr.getBytes("UTF-8"));
				outputStream.close();
			}
			// 将返回的输入流转换成字符串
			inputStream = httpUrlConn.getInputStream();
			inputStreamReader = new InputStreamReader(inputStream, charset);
			bufferedReader = new BufferedReader(inputStreamReader);
			
			String str = null;
			while ((str = bufferedReader.readLine()) != null) {
				response.append(str);
			}
		} catch (ConnectException ce) {
			log.error(" server connection timed out.   url == " + requestUrl);
		} catch (SocketTimeoutException se) {
			log.error(" socket timed out.   url == " + requestUrl);
		} catch (Exception e) {
			log.error("http request error:{}", e);
		} finally {
			try {
				if (bufferedReader != null) {
					bufferedReader.close();
				}
				if (inputStreamReader != null) {
					inputStreamReader.close();
				}
				// 释放资源
				if (inputStream != null) {
					inputStream.close();
					inputStream = null;
				}
			} catch (IOException e) {
				e.printStackTrace();
			}
			httpUrlConn.disconnect();
		}
		return response.toString();
	}

	public static String httpRequestGBK(String requestUrl,
			String requestMethod, String outputStr) {
		return httpRequest(requestUrl, requestMethod, outputStr, "GBK",null);
	}
	public static String httpRequest(String requestUrl, String requestMethod,
			String outputStr) {
		return httpRequest(requestUrl, requestMethod, outputStr, "UTF-8",null);
	}
	/** 
     * 发送post请求 ,默认编码
     */ 
    public static String post(String url,Map<String,String> params) { 
    	return post(url, params,"UTF-8");
    }

	/** 
     * 发送 post请求并根据传递参数不同返回不同结果 
     */  
    public static String post(String url,Map<String,String> params,String charSet) { 
    	String outputStr = null;
    	if(params != null && params.size() > 0){
    		StringBuffer paramBuffer = new StringBuffer();
    		for(String key : params.keySet()){
    			paramBuffer.append(key).append("=").append(params.get(key)).append("&");
    		}
    		outputStr = paramBuffer.substring(0, paramBuffer.length()-1);
    	}
    	return httpRequest(url, "POST", outputStr,charSet,null);
    	
    }  
    
    /** 
     * 发送 get请求 ,默认编码
     */ 
    public static String get(String url) { 
    	return get(url, "UTF-8");
    }
    /** 
     * 发送 get请求 
     */  
    public static String get(String url,String charSet) { 
    	return get(url, charSet, null);
    }
    public static String get(String url,String charSet,Map<String,String> headerMap) { 
    	return httpRequest(url, "GET", null, charSet, headerMap);
    }
    
	public static void main(String[] args) {
//		Timer timer = new Timer();
//		timer.schedule(new FectchTimer(), 1000, 20000);// 在1秒后执行此任务,每次间隔20秒,如果传递一个Data参数,就可以在某个固定的时间执行这个任务.
//		while (true) {// 这个是用来停止此任务的,否则就一直循环执行此任务了
//			try {
//				int ch = System.in.read();
//				if (ch - 'c' == 0) {
//					timer.cancel();// 使用这个方法退出任务
//				}
//			} catch (IOException e) {
//				e.printStackTrace();
//			}
//		}
		String url = "http://www.cninfo.com.cn/cninfo-new/index";
		Map<String,String> postMap = new HashMap<String,String>();
		postMap.put("stock", "000002,gssz0000002");
		postMap.put("pageSize", "20");
		postMap.put("pageNum", "2");
		postMap.put("column", "sse");
		postMap.put("columnTitle", "历史公告查询");
		postMap.put("tabName", "fulltext");
		String htmlContent = HttpClientUtil.get(url);
		log.debug(htmlContent);
//		if(StringUtils.isNotEmpty(htmlContent)){
////			String liRegex = "<li class=\"result\" id=\".*?\">(.*?)</li>";
//			String regex = "<h3 class=\"c-title\"><a href=\"(.*?)\".*?>(.*?)</a></h3><div class=\"c-summary c-row (c-gap-top-small)?\">(<div class=\"c-span6\">.*?</div>)?(<div class=\"c-span18 c-span-last\">)?<p class=\"c-author\">(.*?)&nbsp;&nbsp;(.*?)</p>(.*?)<span class=\"c-info\"><a .*?>(百度快照|(.*?)条相同新闻)</a>";
////			Pattern liPattern = Pattern.compile(liRegex);
////			Matcher liMatcher = liPattern.matcher(htmlContent);
////			while(liMatcher.find()){
////				String liContent = liMatcher.group(1);
////				Pattern pattern = Pattern.compile(regex);
////				Matcher matcher = pattern.matcher(liContent);
////				while(matcher)
////			}
//			Pattern pattern = Pattern.compile(regex);
//			Matcher matcher = pattern.matcher(htmlContent);
//			int i=1;
//			while(matcher.find()){
//				System.out.print(i+"  ");
//				System.out.print(matcher.group(1)+" *** ");
//				System.out.print(matcher.group(2).replaceAll("<.*?>(.*?)</.*?>", "$1")+" ***  ");
//				System.out.print(matcher.group(6)+"  *** ");
//				System.out.print(matcher.group(7)+"  ***  ");
//				System.out.print(matcher.group(8)+"  *** ");
//				System.out.print(matcher.group(10)+"  *** ");
//				log.debug();
//				i++;
//			}
//		}
	}
}
