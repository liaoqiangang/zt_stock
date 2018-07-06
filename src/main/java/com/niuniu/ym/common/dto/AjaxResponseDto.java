package com.niuniu.ym.common.dto;

public class AjaxResponseDto{


	private String message; // ajax返回对象信息

	private int statusCode;// ajax请求状态
	
	private String callbackType;
	
	private String forwardUrl;
	
	private String rel;
	
	private String navTabId;

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	public int getStatusCode() {
		return statusCode;
	}

	public void setStatusCode(int statusCode) {
		this.statusCode = statusCode;
	}

	public String getCallbackType() {
		return callbackType;
	}

	public void setCallbackType(String callbackType) {
		this.callbackType = callbackType;
	}

	public String getForwardUrl() {
		return forwardUrl;
	}

	public void setForwardUrl(String forwardUrl) {
		this.forwardUrl = forwardUrl;
	}

	public String getRel() {
		return rel;
	}

	public void setRel(String rel) {
		this.rel = rel;
	}

	public void setNavTabId(String navTabId) {
		this.navTabId = navTabId;
	}

	public String getNavTabId() {
		return navTabId;
	}

}
