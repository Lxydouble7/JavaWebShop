package com.unvs.service;

import com.unvs.dao.ProductDao;
import com.unvs.entity.Product;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ProductService {
    private ProductDao dao = new ProductDao();
    public List<Product> findall() throws SQLException {
        return dao.findall();
    }
    public Product FindOne(int pid) throws SQLException{
        return dao.QueryProductByPid(pid);
    }
    public List<Product> recommend(Integer uid) throws SQLException{
        List<Product> result = dao.GetRecommend(uid);
        Integer length = result.size();
        if (length < 6){
            
            length = 6 - length;
            List<Product> trend = new ArrayList<>();
            trend = dao.GetPopular();

            // 不能直接用contain，要重写，这里直接比pid好了
            List<Integer> resultid = new ArrayList<>();
            List<Integer> trendid = new ArrayList<>();
            for (Product i : result){
                resultid.add(i.getPid());
            }
            for (Product i : trend){
                trendid.add(i.getPid());
            }
            for(Integer i :trendid){
                if (resultid.contains(i)){
                    continue;
                }
                result.add(dao.QueryProductByPid(i));
                length --;
                if(length==0){
                    break;
                }
            }
        }
        return result;
    }
}
