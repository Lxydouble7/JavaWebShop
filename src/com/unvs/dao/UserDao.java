package com.unvs.dao;
import com.unvs.entity.User;
import java.sql.SQLException;
import com.unvs.utils.JDBCTools;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.*;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

/**
 * 用户数据交互层
 */
public class UserDao {
    //查重
    public boolean checking(String username) throws SQLException {
        Connection connection = JDBCTools.getConnection();
        String sql = "select * from user where username = ?";
        PreparedStatement statement = null;
        ResultSet resultSet = null;
        statement = connection.prepareStatement(sql);
        statement.setString(1,username);
        resultSet = statement.executeQuery();
        if(resultSet.next()){
            JDBCTools.release(connection,statement,resultSet);
            return true;
        }
        JDBCTools.release(connection,statement,resultSet);
        return false;
    }
    //注册
    public void register(User user) throws SQLException {
        Connection connection = JDBCTools.getConnection();
        String sql ="INSERT INTO `eshop`.`user` (`username`, `password`, `name`, `email`, `telephone`, `birthday`, `gender`, `address`) VALUES (?,?,?,?,?,?,?,?);";
        PreparedStatement statement = null;
        ResultSet resultSet = null;
        try{
            statement = connection.prepareStatement(sql);
            statement.setString(1, user.getUsername());
            statement.setString(2, user.getPassword());
            statement.setString(3, user.getName());
            statement.setString(4, user.getEmail());
            statement.setString(5, user.getTelephone());
            statement.setString(6, user.getBirthday());
            statement.setString(7, user.getSex());
            statement.setString(8,user.getAddress());
            statement.executeUpdate();
        } catch (SQLException e){
            e.printStackTrace();
        } finally {
            JDBCTools.release(connection,statement,resultSet);
        }
    }
    //登录
    public User login(String username, String password) throws SQLException{
        Connection connection = JDBCTools.getConnection();
        String sql = "select * from user where username = ? and password = ?";
        PreparedStatement statement = null;
        ResultSet resultSet = null;
        User user = null;
        try {
            statement = connection.prepareStatement(sql);
            statement.setString(1,username);
            statement.setString(2,password);
            resultSet = statement.executeQuery();
            //System.out.println(resultSet.getString(1));
            if(resultSet.next()){
                SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");//注意月份是MM
                //Date date = (Date) simpleDateFormat.parse(resultSet.getString(7));
                user = new User(resultSet.getInt(1), resultSet.getString(2),
                        resultSet.getString(3),resultSet.getString(4),
                        resultSet.getString(5),resultSet.getString(6),
                        resultSet.getString(7),resultSet.getString(8),
                        resultSet.getString(9));
                //user = new User(resultSet.getInt(1),resultSet.getString(2),resultSet.getString(3),resultSet.getString(4),resultSet.getString(5),resultSet.getString(6),resultSet.getString(7),resultSet.getString(8),resultSet.getString(9));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            JDBCTools.release(connection,statement,resultSet);
        }
        return user;
    }
    public List<User> showall() throws SQLException{
        Connection connection = JDBCTools.getConnection();
        PreparedStatement statement = null;
        ResultSet resultSet = null;
        String sql = "select * from user;";
        List<User> userList = new ArrayList<>();
        try{
            statement = connection.prepareStatement(sql);
            resultSet = statement.executeQuery();
            while (resultSet.next()){
                userList.add(new User(resultSet.getInt(1), resultSet.getString(2),
                        resultSet.getString(3),resultSet.getString(4),
                        resultSet.getString(5),resultSet.getString(6),
                        resultSet.getString(7),resultSet.getString(8),
                        resultSet.getString(9)));
            }
        } catch (SQLException e){
            e.printStackTrace();
        } finally {
            JDBCTools.release(connection,statement,resultSet);
        }
        return userList;
    }
    public void DeleteUserByUid(Integer uid) throws SQLException{
        Connection connection = JDBCTools.getConnection();
        PreparedStatement statement = null;
        ResultSet resultSet = null;
        String sql = "delete from user where uid = ?;";
        try {
            statement = connection.prepareStatement(sql);
            statement.setInt(1,uid);
            statement.executeUpdate();
        } catch (SQLException e){
            e.printStackTrace();
        } finally {
            JDBCTools.release(connection,statement,resultSet);
        }
    }
    public void timeset(String username,String ip,String in,String out){
        Connection connection = JDBCTools.getConnection();
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;
        String sql = "INSERT INTO `eshop`.`userlog` (`username`, `ip`, `in`, `out`) VALUES (?,?,?,?);";
        try{
            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1, username);
            preparedStatement.setString(2, ip);
            preparedStatement.setString(3, in);
            preparedStatement.setString(4, out);
            preparedStatement.executeUpdate();
        } catch (SQLException e){
            e.printStackTrace();
        } finally {
            JDBCTools.release(connection,preparedStatement,resultSet);
        }
    }
    public void ViewRecord(Integer uid,Integer pid,String type,String start,String end,String minus){
        Connection connection = JDBCTools.getConnection();
        String sql = "INSERT INTO `eshop`.`viewrecord` (`uid`, `pid`, `type`, `start`, `end`, `minus`) VALUES (?,?,?,?,?,?);";
        PreparedStatement statement = null;
        ResultSet resultSet = null;
        User user = null;
        try {
            statement = connection.prepareStatement(sql);
            statement.setInt(1,uid);
            statement.setInt(2,pid);
            statement.setString(3, type);
            statement.setString(4, start);
            statement.setString(5, end);
            statement.setString(6, minus);
            statement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            JDBCTools.release(connection,statement,resultSet);
        }
    }

    public String GetAbstruct(Integer uid) throws SQLException{
        Connection connection = JDBCTools.getConnection();
        PreparedStatement statement = null;
        ResultSet resultSet = null;
        String sql = "SELECT type,count(*) as t FROM eshop.viewrecord where uid = ? group by type order by t desc;";
        String abstruct = "";
        try{
            statement = connection.prepareStatement(sql);
            statement.setInt(1,uid);
            resultSet = statement.executeQuery();
            while (resultSet.next()){
                abstruct = abstruct + " " + resultSet.getString(1);
            }
        } catch (SQLException e){
            e.printStackTrace();
        } finally {
            JDBCTools.release(connection,statement,resultSet);
        }
        return abstruct;
    }
}
