package util;

import java.text.SimpleDateFormat;

/**
 * 获取系统时间
 */
public class Dates {
	public static String date(){
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
		return simpleDateFormat.format(new java.util.Date());
	}
}
