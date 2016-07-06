package com.connectionDao;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class ServiceLocator {
    public Context environmentContext;
    public static ServiceLocator me;

    static {
        try {
            me = new ServiceLocator();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public ServiceLocator() throws Exception {
        try {
            InitialContext initialContext = new InitialContext();
            environmentContext = initialContext; //(Context) initialContext.lookup("java:comp/env");
        } catch (NamingException ne) {
            throw new Exception(ne);
        }
    }

    public static ServiceLocator getInstance() {
        return me;
    }

    public DataSource getDataSource(String dataSourceName) throws Exception {
        try {
            return (DataSource) environmentContext.lookup(dataSourceName);
        } catch (NamingException ne) {
            throw new Exception(ne);
        }
    }
}
