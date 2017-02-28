package org.ever4j.utils;

import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.core.convert.converter.Converter;

public class DateConvertor implements Converter<String, Date> {   
	@Override   
	public Date convert(String source) {   
	    try {   
	    	SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");   
	    	dateFormat.setLenient(false);   
	        return dateFormat.parse(source);   
	    } catch (Exception e) {   
	        e.printStackTrace();   
	    }          
	    try {   
	    	SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy年MM月dd日");   
	    	dateFormat.setLenient(false);   
	    	return dateFormat.parse(source);   
	    } catch (Exception e) {   
	    	e.printStackTrace();   
	    }          
	    try {   
	    	SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");   
	    	dateFormat.setLenient(false);   
	    	return dateFormat.parse(source);   
	    } catch (Exception e) {   
	    	e.printStackTrace();   
	    }          
	    return null;   
	}   
}