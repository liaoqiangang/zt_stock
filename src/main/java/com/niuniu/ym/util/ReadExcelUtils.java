package com.niuniu.ym.util;

import java.io.BufferedInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.apache.commons.lang3.math.NumberUtils;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;

import com.alibaba.fastjson.JSONObject;

public class ReadExcelUtils {
	
	
	public static String[][] getData(InputStream inputStream,int sheetIndex, int firstrow)
			throws FileNotFoundException, IOException {
		List<String[]> result = new ArrayList<String[]>();
		int rowSize = 0;
		BufferedInputStream in = new BufferedInputStream(inputStream);
		Workbook workBook = new HSSFWorkbook(in); 
		Sheet sheet = workBook.getSheetAt(sheetIndex);
		if(sheet == null){
			System.out.println("sheet "+sheetIndex +"不存在");
			return null;
		}
		for (int rowNum = firstrow; rowNum <= sheet.getLastRowNum(); rowNum++) {
			Row row = sheet.getRow(rowNum);
			if (row == null) {
				continue;
			}
			int tempRowSize = row.getLastCellNum() + 1;
			if (tempRowSize > rowSize) {
				rowSize = tempRowSize;
			}
			// 循环行Row
			String[] values = new String[rowSize];
			Arrays.fill(values, "");
			// 循环列Cell
			for (int cellNum = 0; cellNum <= row.getLastCellNum(); cellNum++) {
				Cell cell = row.getCell(cellNum);
				if (cell == null) {
					continue;
				}
				values[cellNum] = rightTrim(getValue(cell));
			}
			result.add(values);
		}
		in.close();
		String[][] returnArray = new String[result.size()][rowSize];
		for (int i = 0; i < returnArray.length; i++) {
			returnArray[i] = (String[]) result.get(i);
		}
		return returnArray;
	}

	private static String getValue(Cell cell) {
		if (cell.getCellType() == cell.CELL_TYPE_BOOLEAN) {
			return String.valueOf(cell.getBooleanCellValue());
		} else if (cell.getCellType() == cell.CELL_TYPE_NUMERIC) {
			return String.valueOf(cell.getNumericCellValue());
		} else {
			return String.valueOf(cell.getStringCellValue());
		}
	}
	
	/**
	 * 去掉字符串右边的空格*
	 * 
	 * @param str要处理的字符串
	 * @return 处理后的字符串
	 **/
	public static String rightTrim(String str) {
		if (str == null) {
			return "";
		}
		int length = str.length();
		for (int i = length - 1; i >= 0; i--) {
			if (str.charAt(i) != 0x20) {
				break;
			}
			length--;
		}
		return str.substring(0, length);
	}

	public static void main(String[] args) {
		try {
			String path = "D://深度研究_研究报告.xls";// 文件路径
			File file = new File(path);
			FileInputStream fis = new FileInputStream(file);
			String[][] data = ReadExcelUtils.getData(fis, 0, 1);
			if(data != null){
				for(String[] rows : data){
					if(StringUtils.isNotEmpty(rows[0]) && NumberUtils.isNumber(rows[0])){
						System.out.println(JSONObject.toJSONString(rows));
					}
				}
			}	
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
}

