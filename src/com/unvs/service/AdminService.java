package com.unvs.service;

import com.unvs.dao.*;
import com.unvs.entity.*;

import java.sql.SQLException;
import java.util.ArrayList;
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
        List<User> result =  new ArrayList<>();
        List<User> temp = userDao.showall();
        String abstruct =null;
        int index = 0;
        for(User i : temp){
            result.add(new User(i.getUid(),i.getUsername(),i.getPassword(),i.getName(),i.getEmail(),i.getTelephone(),i.getBirthday(),i.getGender(),i.getAddress(),userDao.GetAbstruct(i.getUid())));
        }
        return result;

    }
    public void DeleteUserByUid(Integer uid) throws SQLException{
        userDao.DeleteUserByUid(uid);
    }
    public void DeleteOrderByOid(Integer oid) throws SQLException{
        orderDao.DeleteOrderByOid(oid);
    }
    public List<Order> GetAllOrder(String index) throws SQLException{
        return  orderDao.ShowAllOrder(index);
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

