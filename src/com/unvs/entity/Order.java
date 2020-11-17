package com.unvs.entity;

public class Order {
    private Integer oid;
    private Integer uid;
    private String uname;
    private String address;
    private String telephone;
    private Integer pid;
    private String pname;
    private String number;
    private Double total_price;
    private String time;
    private String pay;
    private String email;

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public Integer getOid() {
        return oid;
    }

    public void setOid(Integer oid) {
        this.oid = oid;
    }

    public Integer getUid() {
        return uid;
    }

    public void setUid(Integer uid) {
        this.uid = uid;
    }

    public String getUname() {
        return uname;
    }

    public void setUname(String uname) {
        this.uname = uname;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getTelephone() {
        return telephone;
    }

    public void setTelephone(String telephone) {
        this.telephone = telephone;
    }

    public Integer getPid() {
        return pid;
    }

    public void setPid(Integer pid) {
        this.pid = pid;
    }

    public String getPname() {
        return pname;
    }

    public void setPname(String pname) {
        this.pname = pname;
    }

    public String getNumber() {
        return number;
    }

    public void setNumber(String number) {
        this.number = number;
    }

    public Double getTotal_price() {
        return total_price;
    }

    public void setTotal_price(Double total_price) {
        this.total_price = total_price;
    }

    public String getTime() {
        return time;
    }

    public void setTime(String time) {
        this.time = time;
    }

    public String getPay() {
        return pay;
    }

    public void setPay(String pay) {
        this.pay = pay;
    }

    public Order(Integer oid, Integer uid, String uname, String address, String telephone, Integer pid, String pname, String number, Double total_price, String time, String pay, String email) {
        this.oid = oid;
        this.uid = uid;
        this.uname = uname;
        this.address = address;
        this.telephone = telephone;
        this.pid = pid;
        this.pname = pname;
        this.number = number;
        this.total_price = total_price;
        this.time = time;
        this.pay = pay;
        this.email = email;
    }
}
