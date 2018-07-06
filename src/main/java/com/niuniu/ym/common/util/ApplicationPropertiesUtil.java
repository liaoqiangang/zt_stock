package com.niuniu.ym.common.util;

import java.io.IOException;
import java.util.Properties;

import org.apache.commons.lang3.StringUtils;
import org.springframework.core.io.support.PropertiesLoaderUtils;

public class ApplicationPropertiesUtil {
	
	public static Properties getProperties(String propertiesFile){
		Properties properties = null;
		try {
			properties = PropertiesLoaderUtils.loadAllProperties(propertiesFile);
		} catch (IOException e) {
			throw new RuntimeException("没有找到"+propertiesFile+"文件");
		}
		return properties;
	}

	public static Properties getDefaultProperties(){
		return getProperties("application.properties");
	}
	
	public static String getValue(String key){
		Properties properties = getDefaultProperties();
		return properties.getProperty(key);
	}
	
	public static boolean getBooleanValue(String key){
		boolean isEnable = false;
		Properties properties = getDefaultProperties();
		String str = properties.getProperty(key);
		if(StringUtils.isNotEmpty(str)&&str.equals("true")){
			isEnable = true;
		}
		return isEnable;
	}
	
	public static String getValue(String propertiesFile,String key){
		Properties properties = getProperties(propertiesFile);
		return properties.getProperty(key);
	}
}
