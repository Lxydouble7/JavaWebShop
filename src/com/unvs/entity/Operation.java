package com.unvs.entity;

public class Operation {
    private Integer id;
    private String user;
    private String time;
    private String ip;
    private String details;

    public Operation(Integer id, String user, String time, String ip, String details) {
        this.id = id;
        this.user = user;
        this.time = time;
        this.ip = ip;
        this.details = details;
    }




    public Integer getId() {
        return id;
    }

    public String getTime() {
        return time;
    }

    public void setTime(String time) {
        this.time = time;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getUser() {
        return user;
    }

    public void setUser(String user) {
        this.user = user;
    }

    public String getIp() {
        return ip;
    }

    public void setIp(String ip) {
        this.ip = ip;
    }

    public String getDetails() {
        return details;
    }

    public void setDetails(String details) {
        this.details = details;
    }

}
