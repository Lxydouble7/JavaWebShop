package com.unvs.service;
import com.unvs.dao.UserDao;
import com.unvs.entity.User;

import java.sql.SQLException;
import java.util.List;

/**
 * 用户的业务逻辑层
 */
public class UserService {

    private UserDao dao = new UserDao();
    //登录
    public User login(String username,String password){
        User user = null;
        try {
            user = dao.login(username,password);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return user;
    }
    //查重
    public boolean checking(String username){
        boolean i = false;
        try{
            i = dao.checking(username);
        } catch (SQLException e){
            e.printStackTrace();
        }
        return i;
    }
    //用户注册
    public boolean register(User user){
        try {
            dao.register(user);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return true ;
    }
}
