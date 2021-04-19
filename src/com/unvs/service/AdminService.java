package com.unvs.service;

import com.unvs.dao.*;
import com.unvs.entity.*;

import java.sql.SQLException;
import java.util.List;

public class AdminService {
    private AdminDao dao = new AdminDao();
    private UserDao userDao = new UserDao();
    private MerchantDao merchantDao = new MerchantDao();
    private OrderDao orderDao = new OrderDao();
    private ProductDao productDao = new ProductDao();
    public Admin login(String name, String password) throws SQLException {
        return dao.login(name,password);
    }
    public List<User> GetAllUser() throws SQLException {
        return userDao.showall();
    }
    public void DeleteUserByUid(Integer uid) throws SQLException{
        userDao.DeleteUserByUid(uid);
    }
    public void DeleteOrderByOid(Integer oid) throws SQLException{
        orderDao.DeleteOrderByOid(oid);
    }
    public List<Order> GetAllOrder() throws SQLException{
        return  orderDao.ShowAllOrder();
    }
    public void DeleteProductByPid(Integer oid) throws SQLException{
        productDao.DeleteProductByPid(oid);
    }
//    public void AlterProductByPid(Integer oid) throws SQLException{
//        productDao.AlterProductByPid(oid);
//    }
    public List<Product> GetAllProduct() throws SQLException{
        return  productDao.findall();
    }
    public List<Merchant> GetAllMerchant() throws SQLException {
        return merchantDao.showall();
    }
    public void DeleteMerchantByMid(Integer mid) throws SQLException{
        merchantDao.DeleteMerchantByMid(mid);
    }
    public void timeset(String username,String ip,String in,String out){
        dao.timeset(username,ip,in,out);
    }

}

