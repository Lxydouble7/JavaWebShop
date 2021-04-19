package com.unvs.dao;

import com.unvs.entity.Merchant;
import com.unvs.entity.User;
import com.unvs.utils.JDBCTools;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class MerchantDao {
    public Merchant login(String merchantname, String password) throws SQLException {
        String sql = "select * from merchant where name = ? and password = ?";
        Connection connection = JDBCTools.getConnection();
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;
        Merchant merchant = null;
        try{
            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1,merchantname);
            preparedStatement.setString(2,password);
            resultSet = preparedStatement.executeQuery();
            if(resultSet.next()){
                merchant = new Merchant(resultSet.getInt(1),resultSet.getString(2),
                        resultSet.getString(3),resultSet.getString(4));
            }
        } catch (SQLException e){
            e.printStackTrace();
        } finally {
            JDBCTools.release(connection,preparedStatement,resultSet);
        }
        return merchant;
    }

    public List<Merchant> showall() throws SQLException{
        Connection connection = JDBCTools.getConnection();
        PreparedStatement statement = null;
        ResultSet resultSet = null;
        String sql = "select * from merchant;";
        List<Merchant> MerchantList = new ArrayList<>();
        try{
            statement = connection.prepareStatement(sql);
            resultSet = statement.executeQuery();
            while (resultSet.next()){
                MerchantList.add(new Merchant(resultSet.getInt(1), resultSet.getString(2),
                        resultSet.getString(3),resultSet.getString(4)));
            }
        } catch (SQLException e){
            e.printStackTrace();
        } finally {
            JDBCTools.release(connection,statement,resultSet);
        }
        return MerchantList;
    }
    public void DeleteMerchantByMid(Integer mid) throws SQLException{
        Connection connection = JDBCTools.getConnection();
        PreparedStatement statement = null;
        ResultSet resultSet = null;
        String sql = "delete from merchant where mid = ?;";
        try {
            statement = connection.prepareStatement(sql);
            statement.setInt(1,mid);
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
        String sql = "INSERT INTO `eshop`.`merchantlog` (`name`, `ip`, `in`, `out`) VALUES (?,?,?,?);";
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

}
