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

    public Integer getMid() {
        return mid;
    }

    public void setMid(Integer mid) {
        this.mid = mid;
    }

    public String getMerchantname() {
        return merchantname;
    }

    public void setMerchantname(String merchantname) {
        this.merchantname = merchantname;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }
}
