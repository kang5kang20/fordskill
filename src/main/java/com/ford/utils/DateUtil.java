package com.ford.utils;

import java.text.SimpleDateFormat;
import java.util.Date;

public class DateUtil {

	public static String getCurrentTiem(){
		String time = "";
		Date date = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
		time = sdf.format(date);
		return time;
	}
	
	public static String formatTime(String time) throws Exception {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
		SimpleDateFormat sdf2 = new SimpleDateFormat("yyyy年MM月dd日 HH:mm:ss");
		Date date = sdf.parse(time);
		String result = sdf2.format(date);
		return result;
	}
	
}