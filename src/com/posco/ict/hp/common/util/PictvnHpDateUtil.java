/**
 * 
 */
package com.posco.ict.hp.common.util;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

/**
 * @author Tang Thu Huong
 *
 */
public class PictvnHpDateUtil {
	/**
	 * This method returns current time.
	 * Pattern
	 * - yyyyMMddHHmmssSSS
	 * - yyyy-MM-dd HH:mm:ss.SSS
	 * @param pattern
	 * @return
	 */
	public static String getCurrentTime(String pattern)	{		
		Calendar calendar = Calendar.getInstance();
		SimpleDateFormat sdf = new SimpleDateFormat(pattern);
		
		return sdf.format(calendar.getTime());
	}
	
	/**
	 * This method returns current date with default pattern yyyyMMdd.
	 * @return
	 */
	public static String getCurrentDate()	{		
		return getCurrentTime("yyyyMMdd");
	}
	
	/**
	 * This method returns current time with second precision.
	 * @return
	 */
	public static String getCurrentTimeInMills()	{		
		return getCurrentTime("yyyyMMddHHmmssSSS");
	}
	
	/**
	 * This method returns current time.
	 * @return
	 */
	public static String getCurrentTime()	{		
		return getCurrentTime("yyyyMMddHHmmss");
	}
	
	/**
	 * This method returns format of a specific date.
	 * @return
	 */
	public static String getDate(Date date, String pattern)	{		
		SimpleDateFormat sdf = new SimpleDateFormat(pattern);
		
		return sdf.format(date.getTime());
	}
	
	/**
	 * This method returns default format of a specific date.
	 * @return
	 */
	public static String getDate(Date date)	{		
		return getDate(date, "yyyyMMdd");
	}
	
	/**
	 * This method compares two dates.
	 * @param startDate
	 * @param endDate
	 * @return number of days
	 */
	public static long getDateDiff(String startDate, String endDate) {
		if( startDate == null || startDate.length() != 8 || !startDate.matches("\\d\\d\\d\\d\\d\\d\\d\\d")
			|| endDate == null || endDate.length() != 8 || !endDate.matches("\\d\\d\\d\\d\\d\\d\\d\\d")) {
			throw new RuntimeException("Date Format Is Not Correct!!!!");
		}
		
		try {
			SimpleDateFormat formatter = new SimpleDateFormat("yyyyMMdd");
			Date sDate = formatter.parse(startDate);
			Date eDate = formatter.parse(endDate);
			
			long startTime 		= sDate.getTime();
			long endTime 		= eDate.getTime();
			long diffTime = endTime - startTime;
			
			long diffDate = diffTime / (24 * 60 * 60 * 1000);
			
			return diffDate;
		}catch(ParseException ex) {
			throw new RuntimeException(ex);
		}
	}
	
	/**
	 * This method add or subtract a date 
	 * @param date
	 * @param days
	 * @return a calculated date
	 */
	public static String addDate(Date date, int days, String pattern) {
		
		Calendar c = Calendar.getInstance();
		c.setTime(date);
		c.add(Calendar.DATE, days);
		
		return getDate(c.getTime(), pattern);
	}
	
	public static void pause(int seconds){
	    Date start = new Date();
	    Date end = new Date();
	    while(end.getTime() - start.getTime() < seconds * 1000){
	        end = new Date();
	    }
	}
	
	public static void main(String[] args) {
				
		//System.out.println(addDate(Calendar.getInstance().getTime(), 2));
	}
}
