package com.niuniu.ym.util;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Collection;
import java.util.Date;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.apache.commons.lang3.StringUtils;
import org.apache.commons.validator.routines.EmailValidator;
import org.apache.commons.validator.routines.UrlValidator;


/**
 * 校验工具类
 * @author zeyuan_hu
 * @version v1.0
 * @since v1.0
 * date:2014-05-12
 *
 */
public class ValidateUtil {
	public static boolean isEmpty(Object value)
	  {
	    if (value == null) return true;
	    if ((value instanceof String)) return ((String)value).length() == 0;
	    if ((value instanceof Collection)) return ((Collection<?>)value).size() == 0;
	    if ((value instanceof Map)) return ((Map<?,?>)value).size() == 0;
	    if ((value instanceof CharSequence)) return ((CharSequence)value).length() == 0;

	    if ((value instanceof Boolean)) return false;
	    if ((value instanceof Number)) return false;
	    if ((value instanceof Character)) return false;
	    if ((value instanceof Date)) return false;
	    return false;
	  }

	  public static boolean isNotEmpty(Object value)
	  {
	    return !isEmpty(value);
	  }

	  public static boolean isEmpty(String s)
	  {
	    return StringUtils.isEmpty(s);
	  }

	  public static <E> boolean isEmpty(Collection<E> c)
	  {
	    return (c == null) || (c.isEmpty());
	  }

	  public static <K, E> boolean isEmpty(Map<K, E> m)
	  {
	    return (m == null) || (m.isEmpty());
	  }

	  public static <E> boolean isEmpty(CharSequence c)
	  {
	    return (c == null) || (c.length() == 0);
	  }

	  public static boolean isNotEmpty(String s)
	  {
	    return !isEmpty(s);
	  }

	  public static <E> boolean isNotEmpty(Collection<E> c)
	  {
	    return !isEmpty(c);
	  }

	  public static <E> boolean isNotEmpty(CharSequence c)
	  {
	    return !isEmpty(c);
	  }

	  public static boolean isString(Object obj)
	  {
	    return (obj != null) && ((obj instanceof String));
	  }

	  public static boolean charInString(char c, String s)
	  {
	    return s.indexOf(c) != -1;
	  }

	  public static boolean isLetter(char c)
	  {
	    return Character.isLetter(c);
	  }

	  public static boolean isDigit(char c)
	  {
	    return Character.isDigit(c);
	  }

	  public static boolean isLetterOrDigit(char c)
	  {
	    return Character.isLetterOrDigit(c);
	  }

	  public static boolean isInteger(String s)
	  {
	    if (isEmpty(s)) return false;

	    for (int i = 0; i < s.length(); i++)
	    {
	      char c = s.charAt(i);

	      if (!isDigit(c)) return false;

	    }

	    return true;
	  }

	  public static boolean isSignedInteger(String s)
	  {
	    if (isEmpty(s)) return false; try
	    {
	      Integer.parseInt(s);
	      return true; } catch (Exception e) {
	    }
	    return false;
	  }

	  public static boolean isEmail(String s)
	  {
	    return (!isEmpty(s)) && (EmailValidator.getInstance().isValid(s));
	  }

	  public static boolean isUrl(String s)
	  {
	    return (!isEmail(s)) && (UrlValidator.getInstance().isValid(s));
	  }
	  
	  
	  //=====================判断时间是否正确格式
	  public static boolean checkDate(String date,String format) {
          DateFormat df = new SimpleDateFormat(format);
          Date d = null;
          try{
              d = df.parse(date);
          }catch(Exception e){
              //如果不能转换,肯定是错误格式
              return false;
          }
          String s1 = df.format(d);
          // 转换后的日期再转换回String,如果不等,逻辑错误.如format为"yyyy-MM-dd",date为
          // "2006-02-31",转换为日期后再转换回字符串为"2006-03-03",说明格式虽然对,但日期
          // 逻辑上不对.
          return date.equals(s1);
	  }
	  //=====================判断时间是否正确格式


	  //=====================判断邮件email是否正确格式
      public boolean checkEmail(String email){
          
          Pattern pattern = Pattern.compile("^/w+([-.]/w+)*@/w+([-]/w+)*/.(/w+([-]/w+)*/.)*[a-z]{2,3}$");
          Matcher matcher = pattern.matcher(email);
          if (matcher.matches()) {
              return true;
          }
          return false;
      }
	  //=====================判断邮件email是否正确格式


	  //=====================判断手机号phone是否正确格式
      public static boolean checkPhone(String phone){
          Pattern pattern = Pattern.compile("^0?(13[0-9]|15[012356789]|17[0-9]|18[0-9]|14[57])[0-9]{8}$");
          Matcher matcher = pattern.matcher(phone);
          if (matcher.matches()) {
              return true;
          }
          return false;
      }
	  //=====================判断手机号phone是否正确格式
}
