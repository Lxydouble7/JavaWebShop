package com.unvs.dao;

import com.unvs.entity.Admin;
import com.unvs.utils.JDBCTools;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class AdminDao {
    public Admin login(String name,String password) throws SQLException {
        String sql = "select * from admin where name = ? and password = ?;";
        Connection connection = JDBCTools.getConnection();
        PreparedStatement statement = null;
        ResultSet resultSet = null;
        Admin admin = null;
        try{
            statement = connection.prepareStatement(sql);
            statement.setString(1,name);
            statement.setString(2,password);
            resultSet = statement.executeQuery();
            if(resultSet.next()){
                admin = new Admin(resultSet.getString(2),resultSet.getString(3) );
            }
        } catch (SQLException e){
            e.printStackTrace();
        } finally {
            JDBCTools.release(connection,statement,resultSet);
        }
        return admin;
    }
}
