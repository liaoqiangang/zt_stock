package com.niuniu.ym.web;

import com.alibaba.fastjson.JSONObject;
import com.csvreader.CsvReader;
import net.sf.json.JSON;

import java.io.IOException;
import java.nio.charset.Charset;
import java.util.ArrayList;

public class cvsTest {


    public static void main(String[] args) {
        String[][]result =  getCvsData();
        for (String[]rows:result){
            System.out.println(JSONObject.toJSONString(rows));

        }

    }

    public static  String[][] getCvsData() {
        String csvFilePath = "/Users/liaoqiangang/Desktop/爱炒股-0706.csv";
        // 用来保存数据
        ArrayList<String[]> result = new ArrayList<String[]>();
        int rowSize = 0;
        String[][] returnArray ;
        try {
            // 定义一个CSV路径
            // 创建CSV读对象 例如:CsvReader(文件路径，分隔符，编码格式);
            CsvReader reader = new CsvReader(csvFilePath, ',', Charset.forName("GBK"));
            // 跳过表头 如果需要表头的话，这句可以忽略
            reader.readHeaders();
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
