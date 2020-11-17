package com.unvs.dao;

import com.mysql.cj.jdbc.JdbcConnection;
import com.unvs.entity.Cart;
import com.unvs.entity.Product;
import com.unvs.utils.JDBCTools;

import javax.print.DocFlavor;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;


public class CartDao {
    public Cart QueryCartByUidPid(Integer uid, Integer pid) throws SQLException{

        String sql ="select * from cart where uid= ? and pid = ?";
        Connection connection = JDBCTools.getConnection();
        PreparedStatement statement = null;
        ResultSet resultSet = null;
        Cart result = null;
        try{
            statement = connection.prepareStatement(sql);
            statement.setInt(1,uid);
            statement.setInt(2,pid);
            resultSet = statement.executeQuery();
            while(resultSet.next()){
                result = new Cart(resultSet.getInt(1),resultSet.getInt(2),resultSet.getInt(3),resultSet.getDouble(4));
            }
        } catch (SQLException e){
            e.printStackTrace();
        } finally{
            JDBCTools.release(connection,statement,resultSet);
        }
        return result;
    }
    public void UpdateCartNumber(Integer uid, Integer pid, Integer number, Double price){
        String sql = "update cart set number=number+? ,total_price = total_price+? where uid = ? and pid= ?";
        PreparedStatement statement = null;
        Connection connection = JDBCTools.getConnection();
        ResultSet resultSet = null;
        try {
            statement = connection.prepareStatement(sql);
            statement.setInt(1,number);
            price *= number;
            statement.setDouble(2,price);
            statement.setInt(3,uid);
            statement.setInt(4,pid);
            statement.executeUpdate();
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        } finally {
            JDBCTools.release(connection,statement,resultSet);
        }
    }
    public void InsertIntoCart(Cart cart) throws SQLException {
        String sql="INSERT INTO `eshop`.`cart` (`uid`, `pid`, `number`, `total_price`) VALUES (?,?,?,?)";
        Connection connection = JDBCTools.getConnection();
        PreparedStatement statement = null;
        ResultSet resultSet = null;
        try{
            statement = connection.prepareStatement(sql);
            statement.setString(1,Integer.toString(cart.getUid()));
            statement.setString(2,Integer.toString(cart.getPid()));
            statement.setString(3,Integer.toString(cart.getNumber()));
            statement.setDouble(4,cart.getTotal_price());
            statement.executeUpdate();
        } catch (SQLException e){
            e.printStackTrace();
        } finally {
            JDBCTools.release(connection,statement,resultSet);
        }

    }
    public List<Cart> QueryCartByUid(Integer uid) throws SQLException{
        Connection connection = JDBCTools.getConnection();
        String sql = "select * from cart where uid = ?";
        PreparedStatement statement = null;
        ResultSet resultSet = null;
        List<Cart> PidList = new ArrayList<>();
        try{
            statement = connection.prepareStatement(sql);
            statement.setInt(1,uid);
            resultSet = statement.executeQuery();
            while (resultSet.next()){
                PidList.add(new Cart(resultSet.getInt(2),resultSet.getInt(3),resultSet.getInt(4),resultSet.getDouble(5)));
                //PidList.add(resultSet.getInt(1));
            }
        } catch (SQLException e){
            e.printStackTrace();
        } finally {
            JDBCTools.release(connection,statement,resultSet);
        }
        return PidList;
    }
    public boolean DeleteCartByUidPid(Integer uid,Integer pid) throws SQLException{
        Connection connection = JDBCTools.getConnection();
        String sql="delete from cart where uid=? and pid=?";
        PreparedStatement statement = null;
        ResultSet resultSet = null;
        try{
            statement = connection.prepareStatement(sql);
            statement.setInt(1,uid);
            statement.setInt(2,pid);
            statement.executeUpdate();
        } catch (SQLException e){
            e.printStackTrace();
        } finally {
            JDBCTools.release(connection,statement,resultSet);
        }
        return true;
    }

}
