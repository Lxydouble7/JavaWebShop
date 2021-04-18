package com.unvs.dao;

import com.unvs.entity.Merchant;
import com.unvs.utils.JDBCTools;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

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


}
