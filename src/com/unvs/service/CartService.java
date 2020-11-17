package com.unvs.service;

import com.unvs.dao.CartDao;
import com.unvs.dao.ProductDao;
import com.unvs.entity.Cart;
import com.unvs.entity.Product;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class CartService {
    private CartDao cartDao = new CartDao();
    private ProductDao productDao = new ProductDao();
    public boolean AddCart(Integer uid, Integer pid, Integer number, Double price) throws SQLException {
        if (cartDao.QueryCartByUidPid(uid,pid)==null) {
            Cart cart = new Cart(uid, pid, number, number*price);
            cartDao.InsertIntoCart(cart);
        }
        else{
            cartDao.UpdateCartNumber(uid, pid, number, price);
        }
        return true;
    }
    public List<Cart> checkout(Integer uid) throws SQLException{
        List<Cart> PidList = cartDao.QueryCartByUid(uid);
        List<Product> ProductList = new ArrayList<>();
        List<Cart> CartList = new ArrayList<>();
        for (Cart i : PidList){
            ProductList.add(productDao.QueryProductByPid(i.getPid()));
        }
        for (int i=0;i< PidList.size();i++){
            CartList.add(new Cart(PidList.get(i).getUid(),PidList.get(i).getPid(),PidList.get(i).getNumber(),PidList.get(i).getTotal_price(),ProductList.get(i)));
        }
        return CartList;
    }
    public boolean DeleteCart(Integer uid,Integer pid) throws SQLException{
        return cartDao.DeleteCartByUidPid(uid,pid);
    }
    public boolean CheckOutUpdateCart(Integer uid, Integer pid, Integer op, Double price) throws SQLException{
        if (op == 1){
            cartDao.UpdateCartNumber(uid, pid, op, price);
        }
        if (op == -1){
            cartDao.UpdateCartNumber(uid, pid, op, price);
        }
        return true;
    }
}
