package com.unvs.service;

import com.unvs.dao.ProductTypeDao;
import com.unvs.entity.ProductType;

import java.sql.SQLException;
import java.util.List;

public class ProductTypeService {
    private ProductTypeDao dao = new ProductTypeDao();
    public List<ProductType> findall() throws SQLException{
        return dao.findall();
    }
    public void DeleteProductType(String type) throws SQLException {
        dao.DeleteProductTypeByType(type);
    }
    public void NewProductType(String type) throws SQLException {
        dao.NewProductType(type);
    }

}
