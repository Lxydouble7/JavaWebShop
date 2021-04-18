package com.unvs.dao;

import com.unvs.entity.Product;
import com.unvs.utils.JDBCTools;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ProductDao {
    public List<Product> findall() throws SQLException {
        Connection connection = JDBCTools.getConnection();
        String sql = "select * from product";
        PreparedStatement statement = null;
        ResultSet resultSet = null;

        List<Product> list = new ArrayList<>();
        try{
            statement = connection.prepareStatement(sql);
            resultSet = statement.executeQuery();
            while (resultSet.next()){
                list.add(new Product(resultSet.getInt(1),resultSet.getString(2),resultSet.getDouble(3),
                        resultSet.getString(4),resultSet.getString(5),resultSet.getString(6),
                        resultSet.getString(7),resultSet.getString(8),resultSet.getInt(9),
                        resultSet.getString(10),resultSet.getString(11)));
            }
        } catch (SQLException e){
            e.printStackTrace();
        } finally {
            JDBCTools.release(connection,statement,resultSet);
        }
        return list;
    }
    public Product QueryProductByPid(int pid) throws SQLException{
        Connection connection = JDBCTools.getConnection();
        String sql = "select * from product where pid = ?";
        PreparedStatement statement = null;
        ResultSet resultSet = null;
        Product product = null;
        try{
            statement = connection.prepareStatement(sql);
            statement.setString(1,String.valueOf(pid));
            resultSet = statement.executeQuery();
            while (resultSet.next()){
                product = new Product(resultSet.getInt(1),resultSet.getString(2),resultSet.getDouble(3),
                        resultSet.getString(4),resultSet.getString(5),resultSet.getString(6),
                        resultSet.getString(7),resultSet.getString(8),resultSet.getInt(9),
                        resultSet.getString(10),resultSet.getString(11));
            }
        } catch (SQLException e){
            e.printStackTrace();
        } finally{
            JDBCTools.release(connection,statement,resultSet);
        }
        return product;
    }
    public void DeleteProductByPid(Integer pid) throws SQLException{
        Connection connection = JDBCTools.getConnection();
        PreparedStatement statement = null;
        ResultSet resultSet = null;
        String sql = "delete from eshop.product where pid = ?;";
        try {
            statement = connection.prepareStatement(sql);
            statement.setInt(1,pid);
            statement.executeUpdate();
        } catch (SQLException e){
            e.printStackTrace();
        } finally {
            JDBCTools.release(connection,statement,resultSet);
        }
    }
    public void AlterProductByPid(Integer pid,String pname,Double price,String image,String image1,String image2,String type,String intro,Integer stock,String description, String merchant) throws SQLException{
        Connection connection = JDBCTools.getConnection();
        PreparedStatement statement = null;
        ResultSet resultSet = null;
        String sql = "update `eshop`.`product` set pname=?, price=?, image=?, image1=?, image2=?, type=?, intro=?, stock=?, description=?, merchant=? where pid=?;";
        try {
            statement = connection.prepareStatement(sql);
            statement.setString(1,pname);
            statement.setDouble(2,price);
            statement.setString(3,image);
            statement.setString(4,image1);
            statement.setString(5,image2);
            statement.setString(6,type);
            statement.setString(7,intro);
            statement.setInt(8,stock);
            statement.setString(9,description);
            statement.setString(10,merchant);
            statement.setInt(11,pid);
            statement.executeUpdate();
        } catch (SQLException e){
            e.printStackTrace();
        } finally {
            JDBCTools.release(connection,statement,resultSet);
        }
    }
    public void NewProduct(String pname, Double price, String image, String image1, String image2, String type, String intro, Integer stock, String description) throws SQLException{
        Connection connection = JDBCTools.getConnection();
        ResultSet resultSet = null;
        PreparedStatement statement = null;
        String sql = "INSERT INTO `eshop`.`product` ( `pname`, `price`, `image`, `image1`, `image2`, `type`, `intro`, `stock`, `description`) VALUES (?,?,?,?,?,?,?,?,?);";
        try{
            statement = connection.prepareStatement(sql);
            statement.setString(1,pname);
            statement.setDouble(2,price);
            statement.setString(3,image);
            statement.setString(4,image1);
            statement.setString(5,image2);
            statement.setString(6,type);
            statement.setString(7,intro);
            statement.setInt(8,stock);
            statement.setString(9,description);
            statement.executeUpdate();
        } catch(SQLException e){
            e.printStackTrace();
        } finally {
            JDBCTools.release(connection,statement,resultSet);
        }
    }
    public List<Product> QueryProductByMerchant(String name) throws SQLException{
        Connection connection = JDBCTools.getConnection();
        String sql = "select * from product where merchant = ?";
        PreparedStatement statement = null;
        ResultSet resultSet = null;
        Product product = null;
        List<Product> list = new ArrayList<>();
        try{
            statement = connection.prepareStatement(sql);
            statement.setString(1,String.valueOf(name));
            resultSet = statement.executeQuery();
            while (resultSet.next()){
                list.add(new Product(resultSet.getInt(1),resultSet.getString(2),resultSet.getDouble(3),
                        resultSet.getString(4),resultSet.getString(5),resultSet.getString(6),
                        resultSet.getString(7),resultSet.getString(8),resultSet.getInt(9),
                        resultSet.getString(10),resultSet.getString(11)));
            }
        } catch (SQLException e){
            e.printStackTrace();
        } finally{
            JDBCTools.release(connection,statement,resultSet);
        }
        return list;
    }

}
