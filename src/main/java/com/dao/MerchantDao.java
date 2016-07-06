package com.dao;

import com.connectionDao.PostgresqlDAO;
import com.model.Sales;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by mesutaygun on 6/29/2016.
 */
public class MerchantDao implements  IMerchant {
    Connection connection = null;

    public MerchantDao() throws Exception {
        connection = PostgresqlDAO.getConnection();

    }
    public List<Sales> listAll() {
        PreparedStatement preparedStatement = null;
        ResultSet rs= null;

        try {
            preparedStatement = connection.prepareStatement("SELECT * FROM mp.merchants");
        } catch (SQLException e) {
            e.printStackTrace();
        }

        try {
             rs = preparedStatement.executeQuery();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        Sales merchant = new Sales();
        List<Sales> liste =new ArrayList<Sales>();

        try {
            while (rs.next()){
                merchant.setId(rs.getLong("id"));
                merchant.setCity(rs.getString("city"));
                merchant.setName(rs.getString("name"));
                merchant.setCreate_time(rs.getDate("create_time"));
                liste.add(merchant);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }


        return liste;

    }
    public List<Sales> getListAll(String name) {
        PreparedStatement preparedStatement = null;
        ResultSet rs= null;

        try {
            preparedStatement = connection.prepareStatement("SELECT * FROM mp.merchants where name ilike "+name);
        } catch (SQLException e) {
            e.printStackTrace();
        }

        try {
            rs = preparedStatement.executeQuery();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        Sales merchant = new Sales();
        List<Sales> liste =new ArrayList<Sales>();

        try {
            while (rs.next()){
                merchant.setId(rs.getLong("id"));
                merchant.setCity(rs.getString("city"));
                merchant.setName(rs.getString("name"));
                merchant.setCreate_time(rs.getDate("create_time"));
                liste.add(merchant);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }


        return liste;

    }

}
