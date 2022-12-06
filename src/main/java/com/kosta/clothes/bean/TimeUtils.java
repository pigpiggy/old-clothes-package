package com.kosta.clothes.bean;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

public class TimeUtils {
	
	private static final String timeFormat = "HH:mm yy-MM-dd";
	
	public static String getCurrentTimeStamp() {
		
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern(timeFormat);
		return LocalDateTime.now().format(formatter);
	}

}
