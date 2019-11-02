package com.niuniu.ym.Scheduled;

import java.text.SimpleDateFormat;
import java.util.Date;

public class TimeTest {
    public static void main(String[] args) {
        SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmm");
        String dateStr = sdf.format(new Date());
        int HHmm = Integer.valueOf("0925");
        System.out.println(HHmm);
        if (925 < HHmm && HHmm < 1450) {//14:45~15:00  播报

        }
    }
}
