package com.unvs.entity;

public class Cart {
    private Integer cid;
    private Integer uid;
    private Integer pid;
    private Integer number;
    private Double total_price;
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

    public Cart(Integer uid, Integer pid, Integer number, Double total_price, Product detail) {
        this.uid = uid;
        this.pid = pid;
        this.number = number;
        this.total_price = total_price;
        this.detail = detail;
    }
}
