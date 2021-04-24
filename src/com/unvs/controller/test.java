package com.unvs.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;

public class test {
    public static void main(String[] args) {
        Process pr = null;
        try{
            pr = Runtime.getRuntime().exec("python C:\\Users\\UNVS\\Desktop\\test\\try.py 1 2 3 4 5 6 7 8 9 10 11 12 13 14");
            BufferedReader in = new BufferedReader(new InputStreamReader(pr.getInputStream()));
            String line = null;
            while((line = in.readLine())!=null){
                System.out.println(line);
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
