package com.niuniu.ym.util;


import java.awt.image.BufferedImage;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.UnsupportedEncodingException;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.math.BigDecimal;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.imageio.ImageIO;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFCellStyle;
import org.apache.poi.hssf.usermodel.HSSFClientAnchor;
import org.apache.poi.hssf.usermodel.HSSFComment;
import org.apache.poi.hssf.usermodel.HSSFFont;
import org.apache.poi.hssf.usermodel.HSSFHyperlink;
import org.apache.poi.hssf.usermodel.HSSFPatriarch;
import org.apache.poi.hssf.usermodel.HSSFRichTextString;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.hssf.util.HSSFColor;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.ss.util.CellRangeAddress;
import org.springframework.util.StringUtils;
import org.springframework.web.util.HtmlUtils;

/**
 * 导出Excel工具类
 * @author liaoqiangang
 *
 */
public class POIExportExcel {
	private HSSFWorkbook hwb;
	private List sheetUnits;
	private OutputStream out;
	
	public POIExportExcel(OutputStream out) {
		hwb = new HSSFWorkbook();// 创建一个excel工作薄
		sheetUnits = new ArrayList();
		this.out = out;
	}

	/**
	 * 重载函数-方便用户调用
	 * 
	 * @param title	标题
	 * @param headers	表头
	 * @param fieldNames	字段名
	 * @param dataset	导出数据
	 */
	public void exportExcel(String title, String[] headers, String[] fieldNames, List dataset) {

		exportExcel(title, headers, fieldNames, dataset, null, null);
	}

	/**
	 * 
	 * @param title	标题
	 * @param headers	表头
	 * @param fieldNames	字段名
	 * @param dataset	导出数据
	 * @param colWidth	行宽
	 */
	public void exportExcel(String title, String[] headers, String[] fieldNames, List dataset, int[] colWidth) {
		exportExcel(title, headers, fieldNames, dataset, colWidth, null);
	}

	/**
	 * 重载函数-方便用户调用
	 * 
	 * @param title
	 * @param headers
	 * @param fieldNames
	 * @param dataset
	 * @param out
	 */
	public void exportExcel(String title, String[] headers, String[] fieldNames, List dataset, String pattern) {
		exportExcel(title, headers, fieldNames, dataset, null, pattern);
	}

	public void exportExcelWithImages(String title, String[][] headers, List dataset, int[] colWidth, String[] times,
			Object[] imgs) {

		// 创建一个Excel工作表

		HSSFSheet hs = hwb.createSheet(title);
		SheetUnit unit = new SheetUnit();
		unit.setSheet(hs);
		unit.setColSize(headers[0].length);
		int rowSize=0;
		if(dataset!=null){
			rowSize=dataset.size();
		}
		unit.setRowSize(rowSize);
		sheetUnits.add(unit);
		// 增加序号列
		// headers=addString("序号", 0, headers);

		// 合并单元格,第一行写标题
		hs.addMergedRegion(new CellRangeAddress(0, (short) 0, 0, (short) (headers[0].length - 1)));
		HSSFCellStyle cs = this.getDefaultStyle("title");
		HSSFRow hr = POIExcelUtil.createRow(0, hs);// 根据查询的数据在sheet中创建行
		HSSFCell hc = POIExcelUtil.createCell(0, hr);// 创建列
		hr.setHeightInPoints((float) 24);
		hc.setCellType(HSSFCell.CELL_TYPE_STRING);
		POIExcelUtil.setSheetTitle(hs, cs, hr, hc, title); // 设置标题

		// 第二行循环写日期
		for (int i = 0; i < times.length; i++) {
			Object row = times[i];
			hr = POIExcelUtil.createRow(1 + i, hs);//
			hc = POIExcelUtil.createCell(0, hr);
			hc.setCellValue((String) row);
		}
		// for (String row : times) {
		// int c=0;
		// hr=POIExcelUtil.createRow(1+c++, hs);//
		// hr.setHeightInPoints((float) 24);
		// hc = POIExcelUtil.createCell(0, hr);
		// hc.setCellType(HSSFCell.CELL_TYPE_STRING);
		// hc.setCellStyle(cs);
		// hc.setCellValue(row);
		//			 
		// }
		//
		int r = 0 + imgs.length;
		for (String[] tcols : headers) {
			int c = 0;
			hr = POIExcelUtil.createRow(1 + r++, hs);//
			for (String col : tcols) {
				cs = this.getDefaultStyle("headline");
				hr.setHeightInPoints((float) 24);

				hc = POIExcelUtil.createCell(c++, hr);
				hc.setCellStyle(cs);
				hc.setCellValue(col);
			}
		}

		// 循环行列写数据内容
		int listSize = dataset != null ? dataset.size() : 0;
		for (int i = 0; i < listSize; i++) {// 循环创建行数
			hr = POIExcelUtil.createRow(i + 3 + imgs.length, hs);// 根据查询的数据在sheet中创建行
			Object[] oArr = (Object[]) dataset.get(i);
			for (int j = 0; j < oArr.length; j++) {// 循环列数
				hc = POIExcelUtil.createCell(j, hr);// 创建列

				cs = this.getDefaultStyle("body");
				hc.setCellStyle(cs);
				Object value = oArr[j];
				if (value == null)
					value = new Integer(0);
				String textValue = null;

				if (value instanceof Integer) {
					int intValue = ((Integer) value).intValue();
					textValue = String.valueOf(intValue);
				} else if (value instanceof Float) {
					float fValue = ((Float) value).floatValue();
					textValue = String.valueOf(fValue);
				} else if (value instanceof Double) {
					double dValue = ((Double) value).doubleValue();
					textValue = String.valueOf(dValue);
				} else if (value instanceof Long) {
					long longValue = ((Long) value).longValue();
					textValue = String.valueOf(longValue);
				} else if (value instanceof Boolean) {
					boolean bValue = ((Boolean) value).booleanValue();
					textValue = String.valueOf(bValue);
				} else if (value instanceof BigDecimal) {
					BigDecimal bValue = ((BigDecimal) value);
					textValue = String.valueOf(bValue);
				} else if (value instanceof Date) {
					Date date = (Date) value;
					SimpleDateFormat sdf;

					sdf = new SimpleDateFormat("yyyy-MM-dd");

					textValue = sdf.format(date);
				} else if (value instanceof byte[]) {
					// 有图片时，设置行高为60px;
					hr.setHeightInPoints(60);
					// 设置图片所在列宽度为80px,注意这里单位的一个换算
					if (colWidth == null) {
						hs.setColumnWidth(i, (short) (35.7 * 80));
					}
					// sheet.autoSizeColumn(i);
					byte[] bsValue = (byte[]) value;
					HSSFClientAnchor anchor = new HSSFClientAnchor(0, 0, 1023, 255, (short) 6, i - 1, (short) 6, i - 1);
					anchor.setAnchorType(2);
					// patriarch.createPicture(anchor, hwb.addPicture(bsValue,
					// HSSFWorkbook.PICTURE_TYPE_JPEG));
				} else {
					// 其它数据类型都当作字符串简单处理
					if (value == null) {
						textValue = "";
					} else {
						textValue = value.toString();
					}
				}
				hc.setCellValue(textValue);

			}
		}

		// 设置各列的列宽
		setColumnWidth(hs, headers[0].length + 1, colWidth);

		// POIExcelUtil.setPrintSetup(hwb, hs, listSize + 2, headers.length);
		hs.addMergedRegion(new CellRangeAddress(1 + imgs.length, (short) 2 + imgs.length, 0, (short) 0));
		hs.addMergedRegion(new CellRangeAddress(1 + imgs.length, (short) 1 + imgs.length, 1, (short) 3));
		hs.addMergedRegion(new CellRangeAddress(1 + imgs.length, (short) 1 + imgs.length, 4, (short) 13));
		hs.addMergedRegion(new CellRangeAddress(1 + imgs.length, (short) 1 + imgs.length, 14, (short) 17));

		try {
			createImg(imgs, hs, 14);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public void createImg(Object[] files, HSSFSheet sheet, int imgStartRow) throws Exception {
		Workbook workbook = hwb;

		HSSFPatriarch patriarch = (HSSFPatriarch) sheet.createDrawingPatriarch();
		int startRow = imgStartRow;
		int endRow = imgStartRow + 19;
		int startCol = 0;
		int endCol = 0;

		// FileInputStream fis0 = new FileInputStream((File)files[0]);
		// ByteArrayOutputStream bot0 = new ByteArrayOutputStream();
		// BufferedImage bi0 = ImageIO.read(fis0);
		// ImageIO.write(bi0, "png", bot0);
		// HSSFClientAnchor anchor0 = new HSSFClientAnchor(0, 0, 512, 255,
		// (short) startCol, startRow, (short) endCol,endRow);
		// anchor0.setAnchorType(2);
		// patriarch.createPicture(anchor0,
		// workbook.addPicture(bot0.toByteArray(),
		// HSSFWorkbook.PICTURE_TYPE_PNG));

		for (int i = 0; i < files.length; i++) {
			if (files[i] == null) {
				continue;
			}
			File f = (File) files[i];
			FileInputStream fis = new FileInputStream(f);
			ByteArrayOutputStream bot = new ByteArrayOutputStream();
			BufferedImage bi = ImageIO.read(fis);
			ImageIO.write(bi, "png", bot);
			if (i == 0) {
				startCol = endCol;
			} else {
				startCol = endCol + 1;
			}
			endCol = startCol + 5;
			System.out.println("startCol:::::" + startCol + " endCol::::" + endCol);
			HSSFClientAnchor anchor = new HSSFClientAnchor(0, 0, 512, 255, (short) startCol, startRow, (short) endCol,
					endRow);
			anchor.setAnchorType(2);
			patriarch.createPicture(anchor, workbook.addPicture(bot.toByteArray(), HSSFWorkbook.PICTURE_TYPE_PNG));
			f.delete();
		}

	}

	public void exportExcel(String title, String[] headers, String[] fieldNames, List dataset, int[] colWidth,
			String pattern, String subTitle) {

		// 创建一个Excel工作表

		HSSFSheet hs = hwb.createSheet(title);
		SheetUnit unit = new SheetUnit();
		unit.setSheet(hs);
		unit.setColSize(headers.length);
		int rowSize=0;
		if(dataset!=null){
			rowSize=dataset.size();
		}
		unit.setRowSize(rowSize);
		sheetUnits.add(unit);

		// 增加序号列
		headers = addString("序号", 0, headers);

		// 合并单元格,第一行写标题
		hs.addMergedRegion(new CellRangeAddress(0, (short) 0, 0, (short) (headers.length - 1)));
		HSSFCellStyle cs = this.getDefaultStyle("title");
		HSSFRow hr = POIExcelUtil.createRow(0, hs);// 根据查询的数据在sheet中创建行
		HSSFCell hc = POIExcelUtil.createCell(0, hr);// 创建列
		POIExcelUtil.setSheetTitle(hs, cs, hr, hc, title); // 设置标题

		// 第二行循环写日期
		hr = POIExcelUtil.createRow(1, hs);//
		hr.setHeightInPoints((float) 24);
		hc = POIExcelUtil.createCell(0, hr);
		hc.setCellValue(subTitle);
		hs.addMergedRegion(new CellRangeAddress(1, 1, 0, 3));
		// 第二行循环写列标
		hr = POIExcelUtil.createRow(2, hs);//
		for (int i = 0; i < headers.length; i++) {
			cs = this.getDefaultStyle("headline");
			hr.setHeightInPoints((float) 24);

			hc = POIExcelUtil.createCell(i, hr);
			hc.setCellType(HSSFCell.CELL_TYPE_STRING);
			hc.setCellStyle(cs);
			hc.setCellValue(headers[i]);
		}

		// 循环行列写数据内容
		int listSize = dataset != null ? dataset.size() : 0;
		for (int i = 0; i < listSize; i++) {// 循环创建行数
			hr = POIExcelUtil.createRow(i + 3, hs);// 根据查询的数据在sheet中创建行
			for (int j = 0; j < headers.length; j++) {// 循环列数
				hc = POIExcelUtil.createCell(j, hr);// 创建列
				if (j == 0) {
					hc.setCellValue(i + 1);
				} else {
					// hr.setHeightInPoints(((1.5f)*hs.getDefaultRowHeightInPoints()));
					// //设置行高的方法,刚刚的
//					cs = this.getDefaultStyle("body");
					hc.setCellStyle(cs);

					Object o = dataset.get(i);
					String fieldName = fieldNames[j - 1];
					Object value = getColumnValue(o, fieldName);
					String textValue = null;

					if (value instanceof Integer) {
						int intValue = ((Integer) value).intValue();
						textValue = String.valueOf(intValue);
					} else if (value instanceof Float) {
						float fValue = ((Float) value).floatValue();
						textValue = String.valueOf(fValue);
					} else if (value instanceof Double) {
						double dValue = ((Double) value).doubleValue();
						textValue = String.valueOf(dValue);
					} else if (value instanceof Long) {
						long longValue = ((Long) value).longValue();
						textValue = String.valueOf(longValue);
					} else if (value instanceof Boolean) {
						boolean bValue = ((Boolean) value).booleanValue();
						textValue = String.valueOf(bValue);
					} else if (value instanceof Date) {
						Date date = (Date) value;
						SimpleDateFormat sdf;
						if (pattern != null && !"".equals(pattern)) {
							sdf = new SimpleDateFormat(pattern);
						} else {
							sdf = new SimpleDateFormat("yyyy-MM-dd");
						}
						textValue = sdf.format(date);
					} else {
						// 其它数据类型都当作字符串简单处理
						if (value == null) {
							textValue = "";
						} else {
							textValue = value.toString();
						}
					}
					hc.setCellValue(textValue);
				}
			}
		}

		// 设置各列的列宽
		setColumnWidth(hs, headers.length, colWidth);

		// POIExcelUtil.setPrintSetup(hwb, hs, listSize + 2, headers.length);

	}

	/**
	 * 写Excel主要方法
	 * 
	 * @param title
	 * @param headers
	 * @param fieldNames
	 * @param dataset
	 * @param out
	 * @param colWidth
	 * @param pattern
	 */
	public void exportExcel(String title, String[] headers, String[] fieldNames, List dataset, int[] colWidth,
			String pattern) {

		// 创建一个Excel工作表

		HSSFSheet hs = hwb.createSheet(title);
		SheetUnit unit = new SheetUnit();
		unit.setSheet(hs);
		unit.setColSize(headers.length);
		int rowSize=0;
		if(dataset!=null){
			rowSize=dataset.size();
		}
		unit.setRowSize(rowSize);
		sheetUnits.add(unit);

		// 增加序号列
		headers = addString("序号", 0, headers);

		// 定义注释
		HSSFPatriarch patriarch = hs.createDrawingPatriarch();
		HSSFComment comment = patriarch.createComment(new HSSFClientAnchor(0, 0, 0, 0, (short) 4, 2, (short) 6, 5));
		comment.setString(new HSSFRichTextString("提示:数据为全部数据！"));

		// 合并单元格,第一行写标题
		hs.addMergedRegion(new CellRangeAddress(0, (short) 0, 0, (short) (headers.length - 1)));
		HSSFCellStyle cs = this.getDefaultStyle("title");
		HSSFRow hr = POIExcelUtil.createRow(0, hs);// 根据查询的数据在sheet中创建行
		HSSFCell hc = POIExcelUtil.createCell(0, hr);// 创建列
		POIExcelUtil.setSheetTitle(hs, cs, hr, hc, title); // 设置标题

		// 第二行循环写列标
		hr = POIExcelUtil.createRow(1, hs);//
		for (int i = 0; i < headers.length; i++) {
			cs = this.getDefaultStyle("headline");
			hr.setHeightInPoints((float) 24);

			hc = POIExcelUtil.createCell(i, hr);
			hc.setCellType(HSSFCell.CELL_TYPE_STRING);
			hc.setCellStyle(cs);
			hc.setCellValue(headers[i]);
		}

		// 循环行列写数据内容
		int listSize = dataset != null ? dataset.size() : 0;
		cs = this.getDefaultStyle("body");
		for (int i = 0; i < listSize; i++) {// 循环创建行数
			hr = POIExcelUtil.createRow(i + 2, hs);// 根据查询的数据在sheet中创建行
			for (int j = 0; j < headers.length; j++) {// 循环列数
				hc = POIExcelUtil.createCell(j, hr);// 创建列
				if (j == 0) {
					hc.setCellValue(i + 1);
				} else {
					// hr.setHeightInPoints(((1.5f)*hs.getDefaultRowHeightInPoints()));
					// //设置行高的方法,刚刚的
					hc.setCellStyle(cs);

					Object o = dataset.get(i);
					String fieldName = fieldNames[j - 1];
					Object value ;
					if(o instanceof Map){
						value = ((Map)o).get(fieldName);
					}else{
						value = getColumnValue(o, fieldName);
					}
					String textValue = null;

					if (value instanceof Integer) {
						int intValue = ((Integer) value).intValue();
						textValue = String.valueOf(intValue);
					} else if (value instanceof Float) {
						float fValue = ((Float) value).floatValue();
						textValue = String.valueOf(fValue);
					} else if (value instanceof Double) {
						double dValue = ((Double) value).doubleValue();
						textValue = String.valueOf(dValue);
					} else if (value instanceof Long) {
						long longValue = ((Long) value).longValue();
						textValue = String.valueOf(longValue);
					} else if (value instanceof Boolean) {
						boolean bValue = ((Boolean) value).booleanValue();
						textValue = String.valueOf(bValue);
					} else if (value instanceof Date) {
						Date date = (Date) value;
						SimpleDateFormat sdf;
						if (pattern != null && !"".equals(pattern)) {
							sdf = new SimpleDateFormat(pattern);
						} else {
							sdf = new SimpleDateFormat("yyyy-MM-dd");
						}
						textValue = sdf.format(date);
					} else if (value instanceof byte[]) {
						// 有图片时，设置行高为60px;
						hr.setHeightInPoints(60);
						// 设置图片所在列宽度为80px,注意这里单位的一个换算
						if (colWidth == null) {
							hs.setColumnWidth(i, (short) (35.7 * 80));
						}
						// sheet.autoSizeColumn(i);
						byte[] bsValue = (byte[]) value;
						HSSFClientAnchor anchor = new HSSFClientAnchor(0, 0, 1023, 255, (short) 6, i - 1, (short) 6,
								i - 1);
						anchor.setAnchorType(2);
						patriarch.createPicture(anchor, hwb.addPicture(bsValue, HSSFWorkbook.PICTURE_TYPE_JPEG));
					} else {
						// 其它数据类型都当作字符串简单处理
						if (value == null) {
							textValue = "";
						} else {
							textValue = HtmlUtils.htmlUnescape(value.toString());
						}
					}
					//附件超链接
					if(textValue.startsWith("http://")){
						String fileName = textValue.substring(textValue.lastIndexOf("/")+1, textValue.length());
						hc.setCellValue(fileName);
						HSSFHyperlink hyperlink = new HSSFHyperlink(HSSFHyperlink.LINK_FILE); 
						try {
							hyperlink.setAddress(new String(textValue.getBytes("gbk"),"ISO8859-1"));
						} catch (UnsupportedEncodingException e) {
							e.printStackTrace();
						} 
						hc.setHyperlink(hyperlink); 
					}else{
						hc.setCellValue(textValue);
					}
				}
			}
		}

		// 设置各列的列宽
//		setColumnWidth(hs, headers.length, colWidth);

//		 POIExcelUtil.setPrintSetup(hwb, hs, listSize + 2, headers.length);

	}

	/**
	 * 将Excel写入流中
	 */
	public void write() {
		try {
			hwb.write(out);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	/**
	 * 设置指定工作表标题的样式
	 * 
	 * @param hsNum
	 *            工作表的序号 >=1
	 * @param color
	 * @throws AppException
	 */
	public void setTitleStyle(int hsNum, short color) throws Exception {
		if (hsNum >= 1 && hsNum <= sheetUnits.size()) {
			SheetUnit unit = (SheetUnit) this.sheetUnits.get(hsNum - 1);
			HSSFSheet hs = unit.getSheet();
			HSSFRow hr = hs.getRow(0);
			HSSFCell hc = hr.getCell(0);

			HSSFCellStyle cs = hc.getCellStyle();
			HSSFFont font = cs.getFont(hwb);
			font.setColor(color);
		} else {
			throw new Exception("工作表序号传递参数错误");
		}
	}

	/**
	 * * 设置指定工作表指定列标的样式
	 * 
	 * @param hsNum
	 *            工作表的序号 >=1
	 * @param index
	 *            列标序号 >=1
	 * @param color
	 * @throws Exception
	 */

	public void setHeadlineStyle(int hsNum, int index, short color) throws Exception {
		if (hsNum >= 1 && hsNum <= sheetUnits.size()) {
			SheetUnit unit = (SheetUnit) this.sheetUnits.get(hsNum - 1);
			HSSFSheet hs = unit.getSheet();
			HSSFRow hr = hs.getRow(1);

			HSSFCell hc;
			if (index >= 1 && index <= unit.getColSize()) {
				hc = hr.getCell(index - 1);
			} else {
				throw new Exception("列标序号传递参数错误");
			}
			HSSFCellStyle cs = hc.getCellStyle();
			HSSFFont font = cs.getFont(hwb);
			font.setColor(color);
		} else {
			throw new Exception("工作表序号传递参数错误");
		}
	}

	/**
	 * 设置指定工作表指定内容单元格的样式
	 * 
	 * @param hsNum
	 *            工作表的序号 >=1
	 * @param x
	 *            所在内容行的序号 >=1
	 * @param y
	 *            所在内容列的序号 >=1
	 * @param color
	 * @throws IOException
	 */
	public void setContentCellStyle(int hsNum, int x, int y, short color) throws Exception {
		if (hsNum >= 1 && hsNum <= sheetUnits.size()) {
			SheetUnit unit = (SheetUnit) this.sheetUnits.get(hsNum - 1);
			HSSFSheet hs = unit.getSheet();

			HSSFRow hr;
			HSSFCell hc;
			if (x >= 1 && x <= unit.getRowSize()) {
				hr = hs.getRow(x + 1);
			} else {
				throw new Exception("内容行序号传递参数错误");
			}
			if (y >= 1 && y <= unit.getColSize()) {
				hc = hr.getCell(y - 1);
			} else {
				throw new Exception("内容列序号传递参数错误");
			}

			HSSFCellStyle cs = hc.getCellStyle();
			// CommonUtil.deepClone(cs);
			HSSFFont font = hwb.createFont();
			font.setColor(color);
			cs.setFont(font);
			hc.setCellStyle(cs);
		} else {
			throw new Exception("工作表序号传递参数错误");
		}

	}

	/**
	 * 设置指定工作表指定列的宽度
	 * 
	 * @param hsNum
	 *            工作表的序号 >=1
	 * @param index
	 * @throws Exception
	 */
	public void setColumnWidth(int hsNum, int index, int width) throws Exception {
		if (hsNum >= 1 && hsNum <= sheetUnits.size()) {
			SheetUnit unit = (SheetUnit) this.sheetUnits.get(hsNum - 1);
			HSSFSheet hs = unit.getSheet();

			// 设置所在列宽度,注意这里单位的一个换算
			if (index >= 1 && index <= unit.getColSize()) {
				hs.setColumnWidth(index - 1, (int) (37.5 * width));
			} else {
				throw new Exception("标题列序号传递参数错误");
			}
		} else {
			throw new Exception("工作表序号传递参数错误");
		}
	}

	/**
	 * 递归方式处理.
	 * 
	 * @param obj
	 *            传入的对象
	 * @param fileNames
	 *            有层级javabean方式,model.user.name
	 * @return Object 值
	 * @author david
	 */
	private static Object getColumnValue(Object obj, String fieldNames) {
		if (null != fieldNames && !"".equals(fieldNames)) {

			Object objVal = null;
			int sp = fieldNames.indexOf(".");
			String fieldName = "";
			String afterFieldNames = "";

			if (sp == -1) {
				fieldName = fieldNames;
			} else {
				fieldName = fieldNames.substring(0, sp);
				afterFieldNames = fieldNames.substring(sp + 1, fieldNames.length());
			}

			String upFieldName = fieldName.substring(0, 1).toUpperCase() + fieldName.substring(1);
			Class classz = obj.getClass();
			Method getMethod;
			try {
				String getMethodName = "get" + upFieldName;
				getMethod = classz.getMethod(getMethodName, new Class[] {});
				objVal = getMethod.invoke(obj, new Object[] {});
			} catch (SecurityException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IllegalArgumentException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (NoSuchMethodException e) {
				// 当属性为boolean类型时,返回属性值方法前缀为is
				try {
					String getMethodName = "is" + upFieldName;
					getMethod = classz.getMethod(getMethodName, new Class[] {});
					objVal = getMethod.invoke(obj, new Object[] {});
				} catch (SecurityException e1) {
					// TODO Auto-generated catch block
					e1.printStackTrace();
				} catch (IllegalArgumentException e1) {
					// TODO Auto-generated catch block
					e1.printStackTrace();
				} catch (NoSuchMethodException e1) {
					// TODO Auto-generated catch block
					e1.printStackTrace();
				} catch (IllegalAccessException e1) {
					// TODO Auto-generated catch block
					e1.printStackTrace();
				} catch (InvocationTargetException e1) {
					// TODO Auto-generated catch block
					e1.printStackTrace();
				}
			} catch (IllegalAccessException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (InvocationTargetException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

			if (StringUtils.isEmpty(afterFieldNames)) {
				return objVal;
			} else {
				return getColumnValue(objVal, afterFieldNames);
			}

		}
		return null;
	}

	/**
	 * 增加序号列
	 * 
	 * @param str
	 * @param index
	 * @param old
	 * @return
	 */
	private static String[] addString(String str, int index, String[] old) {
		String[] temp = new String[old.length + 1];
		System.arraycopy(old, 0, temp, 0, old.length);
		for (int i = old.length; i > index; i--) {
			temp[i] = temp[i - 1];
		}
		temp[index] = str;
		return temp;
	}

	/**
	 * 获取默认样式
	 */
	private HSSFCellStyle getDefaultStyle(String type) {
		HSSFCellStyle cs = hwb.createCellStyle();
		if (type == null || type.equals("title")) {
			HSSFFont font = POIExcelUtil.createFont(hwb);
			font.setFontHeightInPoints((short) 14);
			font.setBoldweight(HSSFFont.BOLDWEIGHT_BOLD);
			cs.setFont(font);// 设置字体
			cs.setWrapText(true);
			cs.setBorderBottom(HSSFCellStyle.BORDER_THIN);// 下边框
			cs.setBorderLeft(HSSFCellStyle.BORDER_NONE);// 左边框
			cs.setBorderRight(HSSFCellStyle.BORDER_NONE);// 右边框
			cs.setBorderTop(HSSFCellStyle.BORDER_NONE);// 上边框
			cs.setAlignment(CellStyle.ALIGN_CENTER);// 设置水平对齐方式
			cs.setVerticalAlignment(CellStyle.VERTICAL_CENTER);// 设置垂直对齐方式
		} else if (type.equals("headline")) {
			HSSFFont font = POIExcelUtil.createFont(hwb);
			cs.setFont(font);// 设置字体
			cs.setAlignment(CellStyle.ALIGN_CENTER);
			cs.setVerticalAlignment(CellStyle.VERTICAL_CENTER);
			cs.setFillForegroundColor(HSSFColor.GREY_25_PERCENT.index);// 设置单元格背景
			cs.setFillPattern(HSSFCellStyle.SOLID_FOREGROUND);
			cs.setBorderLeft(CellStyle.BORDER_THIN);
			cs.setBorderRight(CellStyle.BORDER_THIN);
			cs.setBorderBottom(CellStyle.BORDER_THIN);
			cs.setBorderTop(CellStyle.BORDER_THIN);
		} else if (type.equals("body")) {
			cs.setWrapText(true);
		} else {
			HSSFFont font = POIExcelUtil.createFont(hwb);
			font.setColor(font.COLOR_RED);
			cs.setFont(font);
		}
		return cs;
	}

	/**
	 * 设置列宽
	 * 
	 * @param hs
	 * @param colWidth
	 */
	private void setColumnWidth(HSSFSheet hs, int colNum, int[] colWidth) {
		// 设置序号所在列宽度为20px,注意这里单位的一个换算
		// hs.setColumnWidth(0, (int) (35.7*45));
		hs.autoSizeColumn(0);
		if (colWidth != null && (colWidth.length + 1 == colNum)) {
			for (int i = 1; i < colNum; i++) {
				hs.setColumnWidth(i, (int) (35.7 * colWidth[i - 1]));
			}
		} else {
			for (int i = 1; i < colNum; i++) {
				hs.autoSizeColumn(i);
			}
		}
	}


	public static Cell findCell(Sheet sheet, String text) {
		for (Row row : sheet) {
			for (Cell cell : row) {
				if (cell.getCellType() == Cell.CELL_TYPE_STRING && text.equals(cell.getStringCellValue()))
					return cell;
			}
		}
		return null;
	}

	/**
	 *对sheet中所有的单元格(包括合并单元格)根据字数设置合适的行高
	 * 
	 */
	public void adjustRowHeight(Sheet stTpt) {

		int rows = stTpt.getPhysicalNumberOfRows();
		for (int r = 0; r < rows; r++) {
			HSSFRow row = (HSSFRow) stTpt.getRow(r);
			int cells = row.getPhysicalNumberOfCells();
			for (int c = 0; c < cells; c++) {
				HSSFCell cell = row.getCell(c);
				// 只对String类型单元格调整高度
				if (cell != null && cell.getCellType() == HSSFCell.CELL_TYPE_STRING) {
					// 默认行间距，pixel为单位
					float defaultRowGapInPoint = 4f;
					long stringWidths = cell.getRichStringCellValue().toString().getBytes().length * 256;
					// 得到列宽为一个字符的1/256
					long colWidth = stTpt.getColumnWidth(c);
					long aRows = stringWidths / colWidth + 1;
					// 得到每行应该有的高度
					HSSFFont font = cell.getCellStyle().getFont(stTpt.getWorkbook());
					float rowHeightInPoint = font.getFontHeightInPoints() + defaultRowGapInPoint;
					float height = rowHeightInPoint * aRows / (3);
					if (row.getHeightInPoints() < (aRows * rowHeightInPoint) && height > row.getHeightInPoints()) {
						row.setHeightInPoints(height);
					}
				}
			}
		}
	}

	/**
	 *对Row中所有的单元格 根据字数设置合适的行高
	 * 
	 */
	public void adjustRowHeight(Sheet sheet, HSSFRow row) {
		// int cells = row.getPhysicalNumberOfCells();
		// for (int c = 0; c < cells; c++) {
		HSSFCell cell = row.getCell(2);
		// 只对String类型单元格调整高度
		if (cell != null && cell.getCellType() == HSSFCell.CELL_TYPE_STRING) {
			// 默认行间距，pixel为单位
			float defaultRowGapInPoint = 4f;
			long stringWidths = cell.getRichStringCellValue().toString().getBytes().length * 256;
			// 得到列宽为一个字符的1/256
			long colWidth = sheet.getColumnWidth(2);
			long aRows = stringWidths / colWidth + 1;
			// 得到每行应该有的高度
			HSSFFont font = cell.getCellStyle().getFont(sheet.getWorkbook());
			float rowHeightInPoint = font.getFontHeightInPoints() + defaultRowGapInPoint;
			float height = rowHeightInPoint * aRows / (2);
			if (row.getHeightInPoints() < aRows * rowHeightInPoint && height > row.getHeightInPoints()) {
				row.setHeightInPoints(height+30);
			}

		}
	}
}

class SheetUnit {
	private HSSFSheet sheet;
	private int rowSize;
	private int colSize;

	public HSSFSheet getSheet() {
		return sheet;
	}

	public void setSheet(HSSFSheet t) {
		this.sheet = t;
	}

	public int getRowSize() {
		return rowSize;
	}

	public void setRowSize(int rowSize) {
		this.rowSize = rowSize;
	}

	public int getColSize() {
		return colSize;
	}

	public void setColSize(int colSize) {
		this.colSize = colSize;
	}

	public static void main(String[] args) {
		FileOutputStream fileOut = null;
		BufferedImage bufferImg = null;
		BufferedImage bufferImg1 = null;
		try {

			// 先把读进来的图片放到一个ByteArrayOutputStream中，以便产生ByteArray
			ByteArrayOutputStream byteArrayOut = new ByteArrayOutputStream();
			ByteArrayOutputStream byteArrayOut1 = new ByteArrayOutputStream();
			bufferImg = ImageIO.read(new File("E:\\sinovatech\\workspaces\\pmp\\q.jpg"));
			bufferImg1 = ImageIO.read(new File("E:\\sinovatech\\workspaces\\pmp\\qq.jpg"));
			ImageIO.write(bufferImg, "jpg", byteArrayOut);
			ImageIO.write(bufferImg1, "jpg", byteArrayOut1);

			// 创建一个工作薄
			HSSFWorkbook wb = new HSSFWorkbook();
			HSSFSheet sheet1 = wb.createSheet("new sheet");
			// HSSFRow row = sheet1.createRow(2);
			HSSFPatriarch patriarch = sheet1.createDrawingPatriarch();
			HSSFClientAnchor anchor = new HSSFClientAnchor(0, 0, 512, 255, (short) 1, 1, (short) 10, 20);
			HSSFClientAnchor anchor1 = new HSSFClientAnchor(0, 0, 512, 255, (short) 2, 30, (short) 10, 60);
			anchor1.setAnchorType(2);
			// 插入图片
			patriarch.createPicture(anchor, wb.addPicture(byteArrayOut.toByteArray(), HSSFWorkbook.PICTURE_TYPE_JPEG));
			patriarch
					.createPicture(anchor1, wb.addPicture(byteArrayOut1.toByteArray(), HSSFWorkbook.PICTURE_TYPE_JPEG));

			fileOut = new FileOutputStream("d:/workbook.xls");
			// 写入excel文件
			wb.write(fileOut);
			fileOut.close();

		} catch (IOException io) {
			io.printStackTrace();
			System.out.println("io erorr :  " + io.getMessage());
		} finally {
			if (fileOut != null) {
				try {
					fileOut.close();
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		}
	}

}