package com.unvs.entity;

import java.util.Date;

public class User {

    private Integer uid;       //用户编号（随机数产生）
    private String username;  //昵称
    private String password;  //密码
    private String name;      //真实姓名
    private String email;     //邮箱
    private String telephone; //电话
    private String birthday;    //生日
    private String gender;       //性别
    private String address;   //地址
    private String abstruct;  //客户画像

    public void setUid(Integer uid) {
        this.uid = uid;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public String getAbstruct() {
        return abstruct;
    }

    public void setAbstruct(String abstruct) {
        this.abstruct = abstruct;
    }

    public User(Integer uid, String username, String password, String name, String email, String telephone, String birthday, String gender, String address, String abstruct) {
        this.uid = uid;
        this.username = username;
        this.password = password;
        this.name = name;
        this.email = email;
        this.telephone = telephone;
        this.birthday = birthday;
        this.gender = gender;
        this.address = address;
        this.abstruct = abstruct;
    }

    public User() {
    }

    public User(Integer uid, String username, String password, String name, String email, String telephone, String birthday, String sex, String address) {
        this.uid = uid;
        this.username = username;
        this.password = password;
        this.name = name;
        this.email = email;
        this.telephone = telephone;
        this.birthday = birthday;
        this.gender = sex;
        this.address = address;
    }

    public int getUid() {
        return uid;
    }

    public void setUid(int uid) {
        this.uid = uid;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
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

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getTelephone() {
        return telephone;
    }

    public void setTelephone(String telephone) {
        this.telephone = telephone;
    }

    public String getBirthday() {
        return birthday;
    }

    public void setBirthday(String birthday) {
        this.birthday = birthday;
    }

    public String getSex() {
        return gender;
    }

    public void setSex(String sex) {
        this.gender = sex;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    @Override
    public String toString() {
        return "User{" +
                "uid='" + uid + '\'' +
                ", username='" + username + '\'' +
                ", password='" + password + '\'' +
                ", name='" + name + '\'' +
                ", email='" + email + '\'' +
                ", telephone='" + telephone + '\'' +
                ", birthday=" + birthday +
                ", sex='" + gender + '\'' +
                ", address='" + address + '\'' +
                '}';
    }
}
