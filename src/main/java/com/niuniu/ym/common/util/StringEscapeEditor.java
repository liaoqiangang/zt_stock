package com.niuniu.ym.common.util;

import java.beans.PropertyEditorSupport;

import org.apache.commons.lang.StringEscapeUtils;

/**
 * 请求参数转化、防止XSS攻击
 * @author Administrator
 *
 */
public class StringEscapeEditor extends PropertyEditorSupport {
	private boolean escapeHTML;
	private boolean escapeJavaScript;
	private boolean escapeSQL;

	public StringEscapeEditor() {
		super();
	}

	public StringEscapeEditor(boolean escapeHTML, boolean escapeJavaScript,
			boolean escapeSQL) {
		super();
		this.escapeHTML = escapeHTML;
		this.escapeJavaScript = escapeJavaScript;
		this.escapeSQL = escapeSQL;
	}

	@Override
	public void setAsText(String text) {
		if (text == null) {
			setValue(null);
		} else {
			String value = text;
			if (escapeHTML) {
				value = StringEscapeUtils.escapeHtml(value);
			}
			if (escapeJavaScript) {
				value = StringEscapeUtils.escapeJavaScript(value);
			}
			if (escapeSQL) {
				value = StringEscapeUtils.escapeSql(value);
			}
			System.out.println("value = "+value);
			setValue(value);
		}
	}

	@Override
	public String getAsText() {
		Object value = getValue();
		return value != null ? value.toString() : "";
	}

}
