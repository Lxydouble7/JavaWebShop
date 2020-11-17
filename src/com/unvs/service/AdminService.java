package com.unvs.service;

import com.unvs.dao.AdminDao;
import com.unvs.dao.OrderDao;
import com.unvs.dao.ProductDao;
import com.unvs.dao.UserDao;
import com.unvs.entity.Admin;
import com.unvs.entity.Order;
import com.unvs.entity.Product;
import com.unvs.entity.User;

import java.sql.SQLException;
import java.util.List;

public class AdminService {
    private AdminDao dao = new AdminDao();
    private UserDao userDao = new UserDao();
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
    public List<Product> GetAllProduct() throws SQLException{
        return  productDao.findall();
    }
    public void NewProduct (String pname,Double price,String image,String image1,String image2,int type,String intro,Integer stock,String description) throws SQLException {
        productDao.NewProduct(pname,price,image,image1,image2,type,intro,stock,description);
    }
}

