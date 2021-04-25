package com.unvs.service;

import com.unvs.dao.OrderDao;
import com.unvs.entity.Order;

import java.sql.SQLException;
import java.util.List;

public class OrderService {
    private OrderDao orderDao = new OrderDao();
    public boolean NewOrder(Integer uid,String uname,String address,String telephone,Integer pid,String pname,Integer number,Double total_price,String time,String pay,String email,String type,String merchant)throws SQLException{
        return orderDao.NewOrder(uid, uname, address, telephone, pid, pname, number, total_price, time, pay,email,type,merchant);
    }
    public List<Order> QueryOrderByUid(Integer uid)throws SQLException{
        return orderDao.QueryOrderByUid(uid);
    }
    public String GetMerchantTurnover(){
        return orderDao.GetMerchantTurnover();
    }
    public String GetTypeTurnOver(){
        return orderDao.GetTypeTurnover();
    }
    public String GetMerchantNum(){
        return orderDao.GetMerchantNum();
    }
    public String GetTypeNum(){
        return orderDao.GetTypeNum();
    }
    public Integer GetOrderNum(Integer i){return orderDao.GetOrderNum(i);}
    public List<Order> Warning()throws SQLException{
        return orderDao.Warning();
    }
}
