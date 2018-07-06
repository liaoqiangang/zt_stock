package com.niuniu.ym.util;

import net.sourceforge.pinyin4j.PinyinHelper;
import net.sourceforge.pinyin4j.format.HanyuPinyinCaseType;
import net.sourceforge.pinyin4j.format.HanyuPinyinOutputFormat;
import net.sourceforge.pinyin4j.format.HanyuPinyinToneType;
import net.sourceforge.pinyin4j.format.HanyuPinyinVCharType;
import net.sourceforge.pinyin4j.format.exception.BadHanyuPinyinOutputFormatCombination;

public class PinyinAPI {

    /**
    * 提取每个汉字的首字母(大写)
    * 
    * @param str
    * @return
    */
    public static String getPinYinHeadChar(String str) {
        if (isNull(str)) {
            return "";
        }
        String convert = "";
        for (int j = 0; j < str.length(); j++) {
            char word = str.charAt(j);
            // 提取汉字的首字母
            String[] pinyinArray = PinyinHelper.toHanyuPinyinStringArray(word);
            if (pinyinArray != null) {
                convert += pinyinArray[0].charAt(0);
            }
            else {
                convert += word;
            }
        }

        convert = string2AllTrim(convert);
        return convert.toUpperCase();
    }

    /*
    * 判断字符串是否为空
    */

    public static boolean isNull(Object strData) {
        if (strData == null || String.valueOf(strData).trim().equals("")) {
            return true;
        }
        return false;
    }

    /**
    * 去掉字符串包含的所有空格
    * 
    * @param value
    * @return
    */
    public static String string2AllTrim(String value) {
        if (isNull(value)) {
            return "";
        }
        return value.trim().replace(" ", "");
    }

    public static String getPinYin(String strs) {
    	 
        HanyuPinyinOutputFormat format = new HanyuPinyinOutputFormat();
        format.setCaseType(HanyuPinyinCaseType.LOWERCASE);
        format.setToneType(HanyuPinyinToneType.WITHOUT_TONE);
        format.setVCharType(HanyuPinyinVCharType.WITH_U_UNICODE);
        char[] ch = strs.trim().toCharArray();
        StringBuffer buffer = new StringBuffer("");
 
        try {
            for (int i = 0; i < ch.length; i++) {
                if (Character.toString(ch[i]).matches("[\u4e00-\u9fa5]+")) {
                    String[] temp = PinyinHelper.toHanyuPinyinStringArray(
                            ch[i], format);
                    buffer.append(temp[0]);
                    buffer.append(" ");
                } else {
                    buffer.append(Character.toString(ch[i]));
                }
            }
        } catch (BadHanyuPinyinOutputFormatCombination e) {
            e.printStackTrace();
        }
        return buffer.toString();
    }
    
    public static void main(String[] args) {
        String ss = PinyinAPI.getPinYin("中国建筑");
        System.out.print(ss);//ZG
    }
}
