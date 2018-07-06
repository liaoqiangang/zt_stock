package com.niuniu.ym.util;

import java.sql.Timestamp;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.TimeZone;

import javax.xml.datatype.DatatypeConfigurationException;
import javax.xml.datatype.DatatypeFactory;
import javax.xml.datatype.XMLGregorianCalendar;

import org.springframework.util.Assert;

public class DateUtil {

	public static final String PATTERN_STANDARD = "yyyy-MM-dd HH:mm:ss";

	public static final String PATTERN_DATE = "yyyy-MM-dd";

	public static String timestamp2String(Timestamp timestamp, String pattern) {
		if (timestamp == null) {
			throw new java.lang.IllegalArgumentException("timestamp null illegal");
		}
		if (pattern == null || pattern.equals("")) {
			pattern = PATTERN_STANDARD;
		}
		SimpleDateFormat sdf = new SimpleDateFormat(pattern);
		return sdf.format(new Date(timestamp.getTime()));
	}

	public static String date2String(java.util.Date date, String pattern) {
		if (date == null) {
			throw new java.lang.IllegalArgumentException("timestamp null illegal");
		}
		if (pattern == null || pattern.equals("")) {
			pattern = PATTERN_STANDARD;
		}
		SimpleDateFormat sdf = new SimpleDateFormat(pattern);
		return sdf.format(date);
	}

	public static Timestamp currentTimestamp() {
		return new Timestamp(new Date().getTime());
	}

	public static String currentTimestamp2String(String pattern) {
		return timestamp2String(currentTimestamp(), pattern);
	}

	public static Timestamp string2Timestamp(String strDateTime, String pattern) {
		if (strDateTime == null || strDateTime.equals("")) {
			throw new java.lang.IllegalArgumentException("Date Time Null Illegal");
		}
		if (pattern == null || pattern.equals("")) {
			pattern = PATTERN_STANDARD;
		}

		SimpleDateFormat sdf = new SimpleDateFormat(pattern);
		Date date = null;
		try {
			date = sdf.parse(strDateTime);
		} catch (ParseException e) {
			throw new RuntimeException(e);
		}
		return new Timestamp(date.getTime());
	}

	public static Date string2Date(String strDate, String pattern) {
		if (strDate == null || strDate.equals("")) {
			throw new RuntimeException("str date null");
		}
		if (pattern == null || pattern.equals("")) {
			pattern = DateUtil.PATTERN_DATE;
		}
		SimpleDateFormat sdf = new SimpleDateFormat(pattern);
		Date date = null;

		try {
			date = sdf.parse(strDate);
		} catch (ParseException e) {
			throw new RuntimeException(e);
		}
		return date;
	}

	public static String stringToYear(String strDest) {
		if (strDest == null || strDest.equals("")) {
			throw new java.lang.IllegalArgumentException("str dest null");
		}

		Date date = string2Date(strDest, DateUtil.PATTERN_DATE);
		Calendar c = Calendar.getInstance();
		c.setTime(date);
		return String.valueOf(c.get(Calendar.YEAR));
	}

	public static String stringToMonth(String strDest) {
		if (strDest == null || strDest.equals("")) {
			throw new java.lang.IllegalArgumentException("str dest null");
		}

		Date date = string2Date(strDest, DateUtil.PATTERN_DATE);
		Calendar c = Calendar.getInstance();
		c.setTime(date);
		// return String.valueOf(c.get(Calendar.MONTH));
		int month = c.get(Calendar.MONTH);
		month = month + 1;
		if (month < 10) {
			return "0" + month;
		}
		return String.valueOf(month);
	}

	public static String stringToDay(String strDest) {
		if (strDest == null || strDest.equals("")) {
			throw new java.lang.IllegalArgumentException("str dest null");
		}

		Date date = string2Date(strDest, DateUtil.PATTERN_DATE);
		Calendar c = Calendar.getInstance();
		c.setTime(date);
		// return String.valueOf(c.get(Calendar.DAY_OF_MONTH));
		int day = c.get(Calendar.DAY_OF_MONTH);
		if (day < 10) {
			return "0" + day;
		}
		return "" + day;
	}

	public static Date getFirstDayOfMonth(Calendar c) {
		int year = c.get(Calendar.YEAR);
		int month = c.get(Calendar.MONTH);
		int day = 1;
		c.set(year, month, day, 0, 0, 0);
		return c.getTime();
	}

	public static Date getLastDayOfMonth(Calendar c) {
		int year = c.get(Calendar.YEAR);
		int month = c.get(Calendar.MONTH) + 1;
		int day = 1;
		if (month > 11) {
			month = 0;
			year = year + 1;
		}
		c.set(year, month, day - 1, 0, 0, 0);
		return c.getTime();
	}

	public static String date2GregorianCalendarString(Date date) {
		if (date == null) {
			throw new java.lang.IllegalArgumentException("Date is null");
		}
		long tmp = date.getTime();
		GregorianCalendar ca = new GregorianCalendar();
		ca.setTimeInMillis(tmp);
		try {
			XMLGregorianCalendar t_XMLGregorianCalendar = DatatypeFactory.newInstance().newXMLGregorianCalendar(ca);
			return t_XMLGregorianCalendar.normalize().toString();
		} catch (DatatypeConfigurationException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			throw new java.lang.IllegalArgumentException("Date is null");
		}

	}

	public static boolean compareDate(Date firstDate, Date secondDate) {
		if (firstDate == null || secondDate == null) {
			throw new java.lang.RuntimeException();
		}

		String strFirstDate = date2String(firstDate, "yyyy-MM-dd");
		String strSecondDate = date2String(secondDate, "yyyy-MM-dd");
		if (strFirstDate.equals(strSecondDate)) {
			return true;
		}
		return false;
	}
	
	public static long compare(Date firstDate, Date secondDate) {
		long result = 0;
		if (firstDate == null || secondDate == null) {
			throw new java.lang.RuntimeException();
		}
		result = firstDate.getTime() - secondDate.getTime();
		return result;
	}
	
	
	public static String getPrevTime(Date date){
		Calendar calendar = Calendar.getInstance();
        long start = date.getTime();
        long end = calendar.getTimeInMillis();
        long time = (end - start) / 1000;
        if(time < 5){
        	return "刚刚";
        }
        if(time < 60){
        	return time+"秒前";
        }
        time = (end - start) / 1000 / 60;
        if(time < 60){
        	return time+"分钟前";
        }
        time = (end - start) / 1000 / 60 / 60;
        if(time < 24){
        	return time+"小时前";
        }
        time = (end - start) / 1000 / 60 / 60 / 24;
        if(time < 31){
        	return time+"天前";
        }
        time = (end - start) / 1000 / 60 / 60 / 24 / 30;
        if(time < 12){
        	return time+"个月前";
        }
        return "1年前";
	}
	
	public static String getPrevOrNextTime(Date date){
		String suffix = "前";
		
		Calendar calendar = Calendar.getInstance();
        long end = date.getTime();
        long start = calendar.getTimeInMillis();
        long time = (end - start) / 1000;
        if(time > 0){
			suffix="后";
		}
        time = Math.abs(time);
        if(time < 60){
        	return time+"秒"+suffix;
        }
        time = Math.abs((end - start) / 1000 / 60);
        if(time < 60){
        	return time+"分钟"+suffix;
        }
        time = Math.abs((end - start) / 1000 / 60 / 60);
        if(time < 24){
        	return time+"小时"+suffix;
        }
        time = Math.abs((end - start) / 1000 / 60 / 60 / 24);
        if(time < 31){
        	return time+"天"+suffix;
        }
        time = Math.abs((end - start) / 1000 / 60 / 60 / 24 / 30);
        if(time < 12){
        	return time+"个月"+suffix;
        }
        return "1年"+suffix;
	}
	
	public static Date getEndTimeOfDate(Date currentDate) {
		Assert.notNull(currentDate);
		String strDateTime = date2String(currentDate,"yyyy-MM-dd") + " 23:59:59";
		return string2Date(strDateTime,"yyyy-MM-dd hh:mm:ss");
	}
	
	public static String getCurrentUTCTime(){
		Calendar calendar=Calendar.getInstance();   
		String date = date2GregorianCalendarString(calendar.getTime());
		return date;
	}
	
	public static long getReduceDays(Date date1,Date date2){
		long days = (date1.getTime() - date2.getTime())/(3600*24*1000)+1;
		return days;
	}
	
	/**
	 * 获取某天的零点
	 * @param date
	 * @return
	 */
	public static Date getBeginDayDate(Date date){
		Calendar cal = Calendar.getInstance();
		cal.setTime(date);
		cal.set(Calendar.HOUR_OF_DAY, 0);
		cal.set(Calendar.MINUTE, 0);
		cal.set(Calendar.SECOND, 0);
		cal.set(Calendar.MILLISECOND, 0);
		cal.add(Calendar.DAY_OF_MONTH, 0);
		return cal.getTime();
	}
	
	/**
	 * 当前时间的前两天
	 * @param date
	 * @return
	 */
	public static Date getNextDay(Date date) {
		Calendar calendar = Calendar.getInstance();
		calendar.setTime(date);
		calendar.add(Calendar.DAY_OF_MONTH, -2);
		date = calendar.getTime();
		return date;
	}
	
	public static void main(String[] args){
//		String str1 = "2011-01-01";
//		String str2 = "1988-09-09";
//		Date date1 = DateUtil.string2Date(str1, "yyyy-MM-dd");
//		Date date2 = DateUtil.string2Date(str2, "yyyy-MM-dd");
//		Calendar c1 = Calendar.getInstance();
//		Calendar c2 = Calendar.getInstance();
//		c1.setTime(date1);
//		c2.setTime(date2);
//		c2.add(Calendar.YEAR, 4);
//		if (c2.before(c1)) {
//			System.out.println("illegal");
//		}else {
//			System.out.println("ok");
//		}
		getCurrentUTCTime();
	}


	public static int  getweekdays(Date begDate,Date endDate){
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		// 总天数
		int days = (int) ((endDate.getTime() - begDate.getTime()) / (24 * 60 * 60 * 1000)) + 1;
		// 总周数，
		int weeks = days / 7;
		int rs = 0;
		// 整数周
		if (days % 7 == 0) {
			rs = days - 2 * weeks;
		}
		else {
			Calendar begCalendar = Calendar.getInstance();
			Calendar endCalendar = Calendar.getInstance();
			begCalendar.setTime(begDate);
			endCalendar.setTime(endDate);
			// 周日为1，周六为7
			int beg = begCalendar.get(Calendar.DAY_OF_WEEK);
			int end = endCalendar.get(Calendar.DAY_OF_WEEK);
			if (beg > end) {
				rs = days - 2 * (weeks + 1);
			} else if (beg < end) {
				if (end == 7) {
					rs = days - 2 * weeks - 1;
				} else {
					rs = days - 2 * weeks;
				}
			} else {
				if (beg == 1 || beg == 7) {
					rs = days - 2 * weeks - 1;
				} else {
					rs = days - 2 * weeks;
				}
			}
		}
		return rs;
	}


	/**
	 * 距离1970年01月01日 多少天，计算当前时间
	 * @param dateStr
	 * @param pattern
	 * @return
	 */
	public static String dayNum2Date(String dateStr, String pattern) {
		// 1970年01月01日
        Calendar c = Calendar.getInstance();
        c.set(1970, Calendar.JANUARY, 1);
        Date date = new Date(Long.parseLong(dateStr)*24*60*60*1000+c.getTimeInMillis());
		return date2String(date, pattern);
	}
}