package com.unvs.dao;

import com.unvs.entity.Cart;
import com.unvs.entity.Order;
import com.unvs.utils.JDBCTools;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class OrderDao {
    public boolean NewOrder(Integer uid,String uname,String address,String telephone,Integer pid,String pname,Integer number,Double total_price,String time,String pay,String email)throws SQLException{
        String sql = "INSERT INTO `eshop`.`order` (`uid`, `uname`, `address`, `telephone`, `pid`, `pname`, `number`, `total_price`, `time`, `pay`,`email`) VALUES (?,?,?,?,?,?,?,?,?,?,?);";
        PreparedStatement statement = null;
        Connection connection = JDBCTools.getConnection();
        ResultSet resultSet = null;
        try{
            statement= connection.prepareStatement(sql);
            statement.setInt(1,uid);
            statement.setString(2,uname);
            statement.setString(3,address);
            statement.setString(4,telephone);
            statement.setInt(5,pid);
            statement.setString(6,pname);
            statement.setInt(7,number);
            statement.setDouble(8,total_price);
            statement.setString(9,time);
            statement.setString(10,pay);
            statement.setString(11,email);
            statement.executeUpdate();
        } catch (SQLException e){
            e.printStackTrace();
        } finally {
            JDBCTools.release(connection,statement,resultSet);
        }
        return true;
    }
    public List<Order> QueryOrderByUid(Integer uid) throws SQLException{
        String sql = "SELECT * FROM eshop.order where uid = ?;";
        ResultSet resultSet = null;
        PreparedStatement statement = null;
        List<Order> result = new ArrayList<>();
        Connection connection = JDBCTools.getConnection();
        try{
            statement = connection.prepareStatement(sql);
            statement.setInt(1,uid);
            resultSet = statement.executeQuery();
            while(resultSet.next()){
                result.add(new Order(resultSet.getInt(1),resultSet.getInt(2),resultSet.getString(3),resultSet.getString(4),
                        resultSet.getString(5),resultSet.getInt(6),resultSet.getString(7),resultSet.getString(8),
                        resultSet.getDouble(9),resultSet.getString(10),resultSet.getString(11),resultSet.getString(12)));
            }
        } catch (SQLException e){
            e.printStackTrace();
        } finally {
            JDBCTools.release(connection,statement,resultSet);
        }
        return result;
    }
    public List<Order> QueryOrderByMerchant(String merchant) throws SQLException{
        String sql = "SELECT * FROM eshop.order where merchant = ?;";
        ResultSet resultSet = null;
        PreparedStatement statement = null;
        List<Order> result = new ArrayList<>();
        Connection connection = JDBCTools.getConnection();
        try{
            statement = connection.prepareStatement(sql);
            statement.setString(1,merchant);
            resultSet = statement.executeQuery();
            while(resultSet.next()){
                result.add(new Order(resultSet.getInt(1),resultSet.getInt(2),resultSet.getString(3),resultSet.getString(4),
                        resultSet.getString(5),resultSet.getInt(6),resultSet.getString(7),resultSet.getString(8),
                        resultSet.getDouble(9),resultSet.getString(10),resultSet.getString(11),resultSet.getString(12),
                        resultSet.getString(13)));
            }
        } catch (SQLException e){
            e.printStackTrace();
        } finally {
            JDBCTools.release(connection,statement,resultSet);
        }
        return result;
    }
    public List<Order> ShowAllOrder(String index) throws SQLException{
        String sql = null;
        if (index == null){
            sql = "SELECT * FROM eshop.order;";
        }
        else {
            sql = "SELECT * FROM eshop.order where pname in (select pname from eshop.product where type =\"" + index +"\");";
            System.out.println(sql);
        }

        ResultSet resultSet = null;
        PreparedStatement statement = null;
        List<Order> result = new ArrayList<>();
        Connection connection = JDBCTools.getConnection();
        try{
            statement = connection.prepareStatement(sql);
            resultSet = statement.executeQuery();
            while(resultSet.next()){
                result.add(new Order(resultSet.getInt(1),resultSet.getInt(2),resultSet.getString(3),resultSet.getString(4),
                        resultSet.getString(5),resultSet.getInt(6),resultSet.getString(7),resultSet.getString(8),
                        resultSet.getDouble(9),resultSet.getString(10),resultSet.getString(11),resultSet.getString(12)));
            }
        } catch (SQLException e){
            e.printStackTrace();
        } finally {
            JDBCTools.release(connection,statement,resultSet);
        }
        return result;
    }
    public void DeleteOrderByOid(Integer oid) throws SQLException{
        Connection connection = JDBCTools.getConnection();
        PreparedStatement statement = null;
        ResultSet resultSet = null;
        String sql = "delete from eshop.order where oid = ?;";
        try {
            statement = connection.prepareStatement(sql);
            statement.setInt(1,oid);
            statement.executeUpdate();
        } catch (SQLException e){
            e.printStackTrace();
        } finally {
            JDBCTools.release(connection,statement,resultSet);
        }
    }
}
