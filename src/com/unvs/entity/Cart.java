package com.unvs.entity;

public class Cart {
    private Integer cid;
    private Integer uid;
    private Integer pid;
    private Integer number;
    private Double total_price;
    private String type;
    private String merchant;

    public Cart(Integer uid, Integer pid, Integer number, Double total_price, String type, String merchant) {
        this.uid = uid;
        this.pid = pid;
        this.number = number;
        this.total_price = total_price;
        this.type = type;
        this.merchant = merchant;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getMerchant() {
        return merchant;
    }

    public void setMerchant(String merchant) {
        this.merchant = merchant;
    }

    private Product detail;
    public Integer getUid(){return uid;}
    public Integer getPid(){return pid;}
    public Integer getNumber(){return number;}
    public Double getTotal_price(){return total_price;}
    public Product getDetail(){return detail;}
    public Cart(Integer uid, Integer pid, Integer number, Double total_price) {
        this.cid = null;
        this.uid = uid;
        this.pid = pid;
        this.number = number;
        this.total_price = total_price;
    }

    public Cart(Integer uid, Integer pid, Integer number, Double total_price, Product detail, String type, String merchant) {
        this.uid = uid;
        this.pid = pid;
        this.number = number;
        this.total_price = total_price;
        this.detail = detail;
        this.type = type;
        this.merchant = merchant;
    }
}
