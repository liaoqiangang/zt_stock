package com.niuniu.ym.util;

import com.csvreader.CsvReader;

import java.io.IOException;
import java.io.InputStream;
import java.nio.charset.Charset;
import java.util.ArrayList;

public class CsvUtil {

    public static String[][] getCsvData(InputStream inputStream,int header){
        // 用来保存数据
        ArrayList<String[]> result = new ArrayList<String[]>();
        int rowSize = 0;
        String[][] returnArray ;
        try {
            // 定义一个CSV路径
            // 创建CSV读对象 例如:CsvReader(文件路径，分隔符，编码格式);
            CsvReader reader = new CsvReader(inputStream, ',', Charset.forName("GBK"));
            // 跳过表头 如果需要表头的话，这句可以忽略
            if(header==1){
                reader.readHeaders();
            }
            // 逐行读入除表头的数据
            int columnSize = 0;
            while (reader.readRecord()) {
                result.add(reader.getValues());
                columnSize = reader.getColumnCount();
            }
            reader.close();
            returnArray = new String[result.size()][columnSize];
            // 遍历读取的CSV文件
            for (int row = 0; row < result.size(); row++) {
                // 取得第row行第0列的数据
                String cell = result.get(row)[0];
                for (int j=0;j<columnSize;j++){
                    returnArray[row][j]= result.get(row)[j];
                }
            }
            return returnArray;
        } catch (IOException e) {
            e.printStackTrace();

        }
        return null;

    }
}
