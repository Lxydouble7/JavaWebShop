package com.unvs.dao;

import com.unvs.entity.Cart;
import com.unvs.entity.Order;
import com.unvs.utils.JDBCTools;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class OrderDao {
    public boolean NewOrder(Integer uid,String uname,String address,String telephone,Integer pid,String pname,Integer number,Double total_price,String time,String pay,String email,String type,String merchant)throws SQLException{
        String sql = "INSERT INTO `eshop`.`order` (`uid`, `uname`, `address`, `telephone`, `pid`, `pname`, `number`, `total_price`, `time`, `pay`,`email`,`type`,`merchant`) VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?);";
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
            statement.setString(12,type);
            statement.setString(13,merchant);
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
        String sql = "SELECT * FROM eshop.order;";
        if (index != null && index.equals("全部")){
            sql = "SELECT * FROM eshop.order where pname in (select pname from eshop.product where type =\"" + index +"\");";
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

    public String GetMerchantTurnover(){
        String sql = "SELECT SUM(order.total_price),merchant FROM eshop.order Group By merchant;";
        ResultSet resultSet = null;
        PreparedStatement statement = null;
        String result = "data:[";
        Connection connection = JDBCTools.getConnection();
        try{
            statement = connection.prepareStatement(sql);
            resultSet = statement.executeQuery();
            while(resultSet.next()){
                result = result + "{value:"+ String.valueOf(resultSet.getDouble(1))+", name: \"" + resultSet.getString(2) +"\"},";
                }
            result = result + "]";
        } catch (SQLException e){
            e.printStackTrace();
        } finally {
            JDBCTools.release(connection,statement,resultSet);
        }
        return result;
    }
    public String GetTypeTurnover(){
        String sql = "SELECT SUM(order.total_price),type FROM eshop.order Group By type;";
        ResultSet resultSet = null;
        PreparedStatement statement = null;
        String result = "data:[";
        Connection connection = JDBCTools.getConnection();
        try{
            statement = connection.prepareStatement(sql);
            resultSet = statement.executeQuery();
            while(resultSet.next()){
                result = result + "{value:"+ String.valueOf(resultSet.getDouble(1))+", name: \"" + resultSet.getString(2) +"\"},";
            }
            result = result + "]";
        } catch (SQLException e){
            e.printStackTrace();
        } finally {
            JDBCTools.release(connection,statement,resultSet);
        }
        return result;
    }
    public String GetMerchantNum(){
        String sql = "SELECT count(*),merchant FROM eshop.order Group By merchant;";
        ResultSet resultSet = null;
        PreparedStatement statement = null;
        String result = "data:[";
        Connection connection = JDBCTools.getConnection();
        try{
            statement = connection.prepareStatement(sql);
            resultSet = statement.executeQuery();
            while(resultSet.next()){
                result = result + "{value:"+ String.valueOf(resultSet.getDouble(1))+", name: \"" + resultSet.getString(2) +"\"},";
            }
            result = result + "]";
        } catch (SQLException e){
            e.printStackTrace();
        } finally {
            JDBCTools.release(connection,statement,resultSet);
        }
        return result;
    }
    public String GetTypeNum(){
        String sql = "SELECT count(*),type FROM eshop.order Group By type;";
        ResultSet resultSet = null;
        PreparedStatement statement = null;
        String result = "data:[";
        Connection connection = JDBCTools.getConnection();
        try{
            statement = connection.prepareStatement(sql);
            resultSet = statement.executeQuery();
            while(resultSet.next()){
                result = result + "{value:"+ String.valueOf(resultSet.getDouble(1))+", name: \"" + resultSet.getString(2) +"\"},";
            }
            result = result + "]";
        } catch (SQLException e){
            e.printStackTrace();
        } finally {
            JDBCTools.release(connection,statement,resultSet);
        }
        return result;
    }

    public Integer GetOrderNum(Integer date){
        String sql = "SELECT count(*),order.time FROM eshop.order WHERE TO_DAYS( NOW( ) ) - TO_DAYS( order.time) = ? group by order.time order by order.time;";
        ResultSet resultSet = null;
        PreparedStatement statement = null;
        Integer result = 0;
        Connection connection = JDBCTools.getConnection();
        try{
            statement = connection.prepareStatement(sql);
            statement.setInt(1,date);
            resultSet = statement.executeQuery();
            while(resultSet.next()){
                result = resultSet.getInt(1);
            }
        } catch (SQLException e){
            e.printStackTrace();
        } finally {
            JDBCTools.release(connection,statement,resultSet);
        }
        return result;
    }

    public List<Order> Warning() throws SQLException{
        String sql = "SELECT * FROM eshop.order where number >10;";
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
}
