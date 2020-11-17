package com.unvs.service;

import com.unvs.dao.ProductDao;
import com.unvs.entity.Product;

import java.sql.SQLException;
import java.util.List;

public class ProductService {
    private ProductDao dao = new ProductDao();
    public List<Product> findall() throws SQLException {
        return dao.findall();
    }
    public Product FindOne(int pid) throws SQLException{
        return dao.QueryProductByPid(pid);
    }
}
