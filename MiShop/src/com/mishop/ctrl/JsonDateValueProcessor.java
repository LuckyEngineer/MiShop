package com.mishop.ctrl;

import java.text.SimpleDateFormat;
import java.util.Date;

import net.sf.json.JsonConfig;
import net.sf.json.processors.JsonValueProcessor;

public class JsonDateValueProcessor implements JsonValueProcessor {

	
	// 设置时间的转换格式
	private String datePattern = "yyyy-MM-dd HH:mm:ss";

	public JsonDateValueProcessor() {
		super();
	}
	
	public JsonDateValueProcessor(String datePattern) {
		super();
		this.datePattern = datePattern;
	}
	
	public void setDatePattern(String datePattern) {
		this.datePattern = datePattern;
	}
	
	public String getDatePattern() {
		return datePattern;
	}

	@Override
	public Object processArrayValue(Object value, JsonConfig jsonConfig) {
		try { 
			// 当传入的参数为Date类型时，将其格式改为我们想要的格式
			if (value instanceof Date) { 
				SimpleDateFormat sdf = new SimpleDateFormat(datePattern);
				Date date = (Date) value;
				return sdf.format(date);
			}
			return value == null ? "" : value.toString();
		} catch (Exception e) {
			return "";
		}
	}

	@Override
	public Object processObjectValue(String key, Object value, JsonConfig jsonConfig) {
		try { 
			// 当传入的参数为Date类型时，将其格式改为我们想要的格式
			if (value instanceof Date) { 
				SimpleDateFormat sdf = new SimpleDateFormat(datePattern);
				Date date = (Date) value;
				return sdf.format(date);
			}
			return value == null ? "" : value.toString();
		} catch (Exception e) {
			return "";
		}
	}
}
