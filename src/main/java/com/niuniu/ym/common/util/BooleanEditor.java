package com.niuniu.ym.common.util;

import java.beans.PropertyEditorSupport;

import org.springframework.util.StringUtils;

public class BooleanEditor extends PropertyEditorSupport {
	@Override
	public void setAsText(String text) throws IllegalArgumentException {
		if (text == null || text.equals(""))
			text = null;
		if (!StringUtils.hasText(text)) {
			setValue(null);
		} else {
			setValue(Boolean.valueOf(text));// 这句话是最重要的，他的目的是通过传入参数的类型来匹配相应的databind
		}
	}

	@Override
	public String getAsText() {

		return getValue().toString();
	}
}
