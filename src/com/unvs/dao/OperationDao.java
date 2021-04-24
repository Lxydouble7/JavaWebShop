package com.unvs.dao;

import com.unvs.entity.Operation;
import com.unvs.entity.Order;
import com.unvs.utils.JDBCTools;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

public class OperationDao {
    public void NewOperation(String user,String ip,String details) throws SQLException {
        SimpleDateFormat sf=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String time = sf.format(System.currentTimeMillis());//系统当前时间
        String sql = "INSERT INTO `eshop`.`operation` (`user`, `time`, `ip`, `details`) VALUES (?,?,?,?);";
        PreparedStatement statement = null;
        Connection connection = JDBCTools.getConnection();
        ResultSet resultSet = null;
        try{
            statement= connection.prepareStatement(sql);
            statement.setString(1,user);
            statement.setString(2,time);
            statement.setString(3,ip);
            statement.setString(4,details);
            statement.executeUpdate();
        } catch (SQLException e){
            e.printStackTrace();
        } finally {
            JDBCTools.release(connection,statement,resultSet);
        }
    }

    public List<Operation> ShowAllOperation() throws SQLException{
        String sql = "SELECT * FROM eshop.operation;";
        ResultSet resultSet = null;
        PreparedStatement statement = null;
        List<Operation> result = new ArrayList<>();
        Connection connection = JDBCTools.getConnection();
        try{
            statement = connection.prepareStatement(sql);
            resultSet = statement.executeQuery();
            while(resultSet.next()){
                result.add(new Operation(resultSet.getInt(1),resultSet.getString(2),resultSet.getString(3),
                        resultSet.getString(4),resultSet.getString(5)));
                        }
        } catch (SQLException e){
            e.printStackTrace();
        } finally {
            JDBCTools.release(connection,statement,resultSet);
        }
        return result;
    }

}
