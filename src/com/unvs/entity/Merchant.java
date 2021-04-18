package com.unvs.entity;

public class Merchant {
    private Integer mid;
    private String merchantname;  //login
    private String password;
    private String name;  //name of shop

    public Merchant(Integer mid, String merchantname, String password, String name) {
        this.mid = mid;
        this.merchantname = merchantname;
        this.password = password;
        this.name = name;
    }

}
