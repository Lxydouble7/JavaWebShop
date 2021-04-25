package com.unvs.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

public class test {
    public static void main(String[] args) throws ParseException {
        String data_date = "data:[";
        Calendar now = Calendar.getInstance();
        String tdate = "\'" + (now.get(Calendar.MONTH) + 1) + "-" + now.get(Calendar.DAY_OF_MONTH) +"\'";
        for (int i =0; i<13;i++){
            now.add(Calendar.DAY_OF_YEAR, -1);
            tdate = "\'" + (now.get(Calendar.MONTH) + 1) + "-" + now.get(Calendar.DAY_OF_MONTH) +"\'," + tdate ;
        }
        now = Calendar.getInstance();
        for (int i = 0;i<3;i++){
            now.add(Calendar.DAY_OF_YEAR, 1);
            tdate = tdate+ ",\'" + (now.get(Calendar.MONTH) + 1) + "-" + now.get(Calendar.DAY_OF_MONTH) +"\'";
        }
        System.out.println(tdate);
        tdate = "data:[" + tdate + "],";
        System.out.println(tdate);


    }
}
