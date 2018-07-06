package com.niuniu.ym.common.util;

import java.beans.PropertyEditorSupport;

import org.springframework.util.StringUtils;

public class DateEditor extends PropertyEditorSupport {
	@Override
	public void setAsText(String text) throws IllegalArgumentException {

		if (!StringUtils.hasText(text)) {
			setValue(null);
		} else {
			if(text.contains(":")){
				setValue(DateUtil.string2Date(text, "yyyy-MM-dd HH:mm:ss"));
			}else{
				setValue(DateUtil.string2Date(text, "yyyy-MM-dd"));
			}
			
		}
	}

	@Override
	public String getAsText() {

		return getValue().toString();
	}
}
