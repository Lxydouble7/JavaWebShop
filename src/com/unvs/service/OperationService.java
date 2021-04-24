package com.unvs.service;

import com.unvs.dao.OperationDao;
import com.unvs.entity.Operation;

import java.sql.SQLException;
import java.util.List;

public class OperationService {
    private OperationDao operationDao = new OperationDao();
    public List<Operation> ShowAllOperation() throws SQLException {
        return operationDao.ShowAllOperation();
    }
    public void NewOperation(String user,String ip,String details) throws SQLException{
        operationDao.NewOperation(user,ip,details);
    }
}
