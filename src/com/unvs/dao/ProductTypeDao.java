package com.unvs.dao;

import com.unvs.entity.Product;
import com.unvs.entity.ProductType;
import com.unvs.utils.JDBCTools;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ProductTypeDao {
    public List<ProductType> findall() throws SQLException{
        Connection connection = JDBCTools.getConnection();
        String sql = "select * from producttype";
        PreparedStatement statement = null;
        ResultSet resultSet = null;

        List<ProductType> list = new ArrayList<>();
        try{
            statement = connection.prepareStatement(sql);
            resultSet = statement.executeQuery();
            while (resultSet.next()){
                list.add(new ProductType(resultSet.getInt(1),resultSet.getString(2)));
            }
        } catch (SQLException e){
            e.printStackTrace();
        } finally {
            JDBCTools.release(connection,statement,resultSet);
        }
        return list;
    }

    public void DeleteProductTypeByType(String type) throws SQLException{
        Connection connection = JDBCTools.getConnection();
        PreparedStatement statement = null;
        ResultSet resultSet = null;
        String sql = "delete from eshop.producttype where type = ?;";
        try {
            statement = connection.prepareStatement(sql);
            statement.setString(1,type);
            statement.executeUpdate();
        } catch (SQLException e){
            e.printStackTrace();
        } finally {
            JDBCTools.release(connection,statement,resultSet);
        }
    }
    public void NewProductType(String type) throws SQLException{
        Connection connection = JDBCTools.getConnection();
        ResultSet resultSet = null;
        PreparedStatement statement = null;
        String sql = "INSERT INTO `eshop`.`producttype` (`type`) VALUES (?);";
        try{
            statement = connection.prepareStatement(sql);
            statement.setString(1,type);
            statement.executeUpdate();
        } catch(SQLException e){
            e.printStackTrace();
        } finally {
            JDBCTools.release(connection,statement,resultSet);
        }
    }
}
