package com.connectionDao;

import com.connectionDao.ServiceLocator;

import javax.sql.DataSource;
import java.sql.Connection;
import java.sql.SQLException;

public class PostgresqlDAO {

    public static Connection getConnection() throws Exception {
        ServiceLocator serviceLocator = ServiceLocator.getInstance();
        DataSource dataSource = serviceLocator.getDataSource("java:/PostgresDS");
        return dataSource.getConnection();
    }
}