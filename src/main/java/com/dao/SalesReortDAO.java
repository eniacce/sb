package com.dao;

import com.connectionDao.PostgresqlDAO;
import com.model.SalesReport;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by mesutaygun on 6/26/2016.
 */
public class SalesReortDAO implements ISalesReport {
    Connection connection = null;

    public SalesReortDAO() throws Exception {
        connection = PostgresqlDAO.getConnection();

    }


    public List<SalesReport> getSalesReport() {
        PreparedStatement preparedStatement = null;
        ResultSet rs= null;
        try {

             preparedStatement = connection.prepareStatement("SELECT date_trunc('day',mp.sales_report.sales_date) AS day " +
                    ",sum(mp.sales_report.amount) AS Total," +
                    "  sku_name" +
                    " FROM" +
                    "  mp.sales_report" +
                    " WHERE" +
                    "  sales_date >= '2013-01-01 00:00'" +
                    "  AND sales_date < '2016-12-08 00:00'"+
                    " GROUP BY" +
                    "  day,sku_name" +
                    " ORDER BY day ASC");
        } catch (SQLException e) {
            e.printStackTrace();
        }
        SalesReport sp = new SalesReport();
        List<SalesReport> list = new ArrayList<SalesReport>();
        try {
            rs = preparedStatement.executeQuery();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        try {
            while(rs.next()){
                System.out.println(rs.getDouble("total"));
                sp.setAmount(rs.getDouble("total"));
                sp.setSales_date(rs.getDate("day"));
                sp.setSku_name(rs.getString("sku_name"));
                list.add(sp);

            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }
}
