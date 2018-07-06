package com.niuniu.ym.web;

public class FetchStock {

    public static void main(String[] args) {

        String msg = "1,金杯汽车,600609,4.82,10.05%,0.44,1291万,-0.82%,-3.21%,14,汽车制造,4.82,---,4.82,4.29,4.39,4.38,0.00,1.24,12.10%,4.71,100.0%,24360,1.88%,9664万,20.50万,9.77万,10.73万,63.42,10.93亿,10.93亿,52.67亿,17.87,0.0190,0.27,";

        String []stock = msg.split(",");

        String name = stock[1];
        String stockcode = stock[2];
        String open = stock[15];

        System.out.println( name +"="+stockcode+"="+open);



    }
}
