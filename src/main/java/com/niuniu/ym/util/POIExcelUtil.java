package com.niuniu.ym.util;

import java.util.Properties;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFCellStyle;
import org.apache.poi.hssf.usermodel.HSSFFont;
import org.apache.poi.hssf.usermodel.HSSFPrintSetup;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.hssf.util.HSSFColor;
import org.apache.poi.ss.usermodel.CellStyle;

/**
 * 导出Excel工具类
 * @author liaoqiangang
 *
 */
public class POIExcelUtil {

	/**
	 * 
	 * 
	 * @return HSSFWorkbook
	 */
	public static HSSFWorkbook createWorkbook() {
		return new HSSFWorkbook();
	}

	/**
	 * 
	 * 
	 * @param wb
	 * @param sheetname
	 * @return HSSFSheet
	 */
	public static HSSFSheet createSheet(HSSFWorkbook wb,String sheetname) {
		return wb.createSheet(sheetname);
	}

	/**
	 * 
	 * 
	 * @param wb
	 * @return HSSFSheet
	 */
	public static HSSFSheet createSheet(HSSFWorkbook wb) {
		return wb.createSheet();
	}
	
	/**
	 * 
	 * 
	 * @param index
	 * @param s
	 * @return HSSFRow
	 */
	public static HSSFRow createRow(int index, HSSFSheet s) {
		return s != null ? s.createRow(index) : null;
	}

	/**
	 * 
	 * 
	 * @param index
	 * @param r
	 * @return HSSFCell
	 */
	public static HSSFCell createCell(int index, HSSFRow r) {
		return r != null ? r.createCell(index) : null;
	}

	/**
	 * 
	 * 
	 * @param wb
	 * @return HSSFCellStyle
	 */
	public static HSSFCellStyle createCellStyle(HSSFWorkbook wb){
		HSSFCellStyle cs = wb.createCellStyle();
		cs.setAlignment(HSSFCellStyle.ALIGN_CENTER);// 水平居中
		cs.setBorderBottom(HSSFCellStyle.BORDER_THIN);// 下边框
		cs.setBorderLeft(HSSFCellStyle.BORDER_THIN);// 左边框
		cs.setBorderRight(HSSFCellStyle.BORDER_THIN);// 右边框
		cs.setBorderTop(HSSFCellStyle.BORDER_THIN);// 上边框
		return cs;
	}
	
	/**
	 * 
	 * 
	 * @param wb
	 * @param font
	 * @return HSSFCellStyle
	 */
	public static HSSFCellStyle createCellStyle(HSSFWorkbook wb,HSSFFont font){
		HSSFCellStyle cs = wb.createCellStyle();
		cs.setFont(font);
		cs.setAlignment(HSSFCellStyle.ALIGN_CENTER);// 水平居中
		cs.setBorderBottom(HSSFCellStyle.BORDER_THIN);// 下边框
		cs.setBorderLeft(HSSFCellStyle.BORDER_THIN);// 左边框
		cs.setBorderRight(HSSFCellStyle.BORDER_THIN);// 右边框
		cs.setBorderTop(HSSFCellStyle.BORDER_THIN);// 上边框
		return cs;
	}
	
	/**
	 * 
	 * 
	 * @param wb
	 * @return HSSFFont
	 */
	public static HSSFFont createFont(HSSFWorkbook wb){
		HSSFFont f = wb.createFont();
		f.setFontName("宋体");// 设置字体
		f.setFontHeightInPoints((short) 10);// 字体大小
		f.setBoldweight(HSSFFont.BOLDWEIGHT_BOLD);// 加粗
		return f;
	}
	
	/**
	 * 
	 * 
	 * @param wb
	 * @param s
	 * @param rows
	 * @param columns
	 */
	// 打印设置    
	public static void setPrintSetup(HSSFWorkbook wb,HSSFSheet s, int rows,int columns){
		
		HSSFPrintSetup hps = s.getPrintSetup();    
		hps.setPaperSize((short) 9); // 设置A4纸    
		hps.setLandscape(true); // 将页面设置为横向打印模式    
		s.setHorizontallyCenter(true); // 设置打印页面为水平居中    
		s.setVerticallyCenter(true); // 设置打印页面为垂直居中    
		wb.setPrintArea(0, "$A$1:$"+(char)(65+columns)+"$" + rows + 2);// 打印区域设置.  
	}
	
	//建立表头信息
	public static void setSheetTitle(HSSFSheet s,HSSFCellStyle cs,HSSFRow r,HSSFCell c,String stitle){
		 //第一行，表格标题   
		r.setHeightInPoints((float)40);//设置行高 
        c.setCellType(HSSFCell.CELL_TYPE_STRING);   
        //c.setEncoding(HSSFCell.ENCODING_UTF_16);   
        c.setCellStyle(cs);   
        c.setCellValue(stitle);      
	}
	
	/**
	 * 得到系统的字符编码
	 * 
	 * @return
	 */
	public static String getSystemFileCharset(){
	    Properties pro = System.getProperties();
	    return pro.getProperty("file.encoding");
	}
	
	public static void main(String[] args) {
		System.out.println(getSystemFileCharset());
	}
	
	/**
	 * 设置首行样式/字体
	 * @param hwb 工作薄
	 * @param hs 单元
	 * @param hr 单元行
	 * @param hc 单元格
	 */
	public static HSSFCellStyle setFirstStyle(HSSFWorkbook hwb,HSSFSheet hs,HSSFRow hr,HSSFCell hc){
		HSSFCellStyle cs = POIExcelUtil.createCellStyle(hwb);
		HSSFFont font = POIExcelUtil.createFont(hwb);
		font.setFontHeightInPoints((short) 18);
		font.setBoldweight(HSSFFont.BOLDWEIGHT_BOLD);
		cs.setFont(font);// 设置字体
		cs.setWrapText(true);
		cs.setBorderBottom(HSSFCellStyle.BORDER_THIN);// 下边框
		cs.setBorderLeft(HSSFCellStyle.BORDER_NONE);// 左边框
		cs.setBorderRight(HSSFCellStyle.BORDER_NONE);// 右边框
		cs.setBorderTop(HSSFCellStyle.BORDER_NONE);// 上边框
		cs.setAlignment(CellStyle.ALIGN_CENTER);// 设置水平对齐方式
		cs.setVerticalAlignment(CellStyle.VERTICAL_CENTER);// 设置垂直对齐方式
		return cs;
	}
	
	/**
	 * 设置第二行列字段的样式
	 * @param hwb 工作薄
	 * @param hr 单元行
	 * @param hc 单元格
	 * @param columnName 字段名
	 * @param j 循环创建的行数
	 */
	public static void setColumnStyle(HSSFWorkbook hwb,HSSFRow hr,HSSFCell hc,String[] columnName,int j){
		HSSFCellStyle cs = POIExcelUtil.createCellStyle(hwb);
		hr.setHeightInPoints((float) 24);
		HSSFFont font = POIExcelUtil.createFont(hwb);
		cs.setFont(font);// 设置字体
		cs.setAlignment(CellStyle.ALIGN_CENTER);
		cs.setVerticalAlignment(CellStyle.VERTICAL_CENTER);
		cs.setFillForegroundColor(HSSFColor.GREY_25_PERCENT.index);// 设置单元格背景
		cs.setFillPattern(HSSFCellStyle.SOLID_FOREGROUND);
		hc.setCellType(HSSFCell.CELL_TYPE_STRING);
		hc.setCellStyle(cs);
		hc.setCellValue(columnName[j]);
	}
}