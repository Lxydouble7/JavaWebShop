package com.unvs.service;

import com.unvs.dao.*;
import com.unvs.entity.Admin;
import com.unvs.entity.Merchant;
import com.unvs.entity.Order;
import com.unvs.entity.Product;

import java.sql.SQLException;
import java.util.List;

public class MerchantService {
    private MerchantDao merchantDao = new MerchantDao();
    private AdminDao adminDao = new AdminDao();
    private UserDao userDao = new UserDao();
    private OrderDao orderDao = new OrderDao();
    private ProductDao productDao = new ProductDao();

    public Merchant login(String name, String password) throws SQLException {
        return merchantDao.login(name,password);
    }

    public List<Order> GetAllOrder(String name) throws SQLException{
        return  orderDao.QueryOrderByMerchant(name);
    }
    public void DeleteOrderByOid(Integer oid) throws SQLException{
        orderDao.DeleteOrderByOid(oid);
    }
    public List<Product> GetYourProduct(String name) throws SQLException{
        return  productDao.QueryProductByMerchant(name);
    }
    public void NewProduct (String pname,Double price,String image,String image1,String image2,String type,String intro,Integer stock,String description,String merchant) throws SQLException {
        productDao.NewProduct(pname,price,image,image1,image2,type,intro,stock,description,merchant);
    }
    public void AlterProductByPid(Integer pid,String pname,Double price,String image,String image1,String image2,String type,String intro,Integer stock,String description,String merchant) throws SQLException {
        productDao.AlterProductByPid(pid,pname,price,image,image1,image2,type,intro,stock,description,merchant);
    }
    public void timeset(String username,String ip,String in,String out){
        merchantDao.timeset(username,ip,in,out);
    }
    public void NewMerchant(String merchantname,String password,String name) throws SQLException{
        merchantDao.NewMerchant(merchantname,password,name);
    }
}
