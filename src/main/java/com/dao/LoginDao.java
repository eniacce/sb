package com.dao;

import com.connectionDao.PostgresqlDAO;
import com.model.Staffs;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 * Created by mesutaygun on 6/26/2016.
 */
public class LoginDao implements ILogin {
    Connection connection = null;

    public LoginDao() throws Exception {
        connection = PostgresqlDAO.getConnection();

    }

    public Staffs getStaff(String username,String password ) {
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;
        Staffs staffs = null;
        try {
            preparedStatement = connection.prepareStatement("SELECT  * FROM  mp.staffs WHERE  username=? and password = ?");
        } catch (SQLException e) {
            e.printStackTrace();
        }
        try {
            preparedStatement.setString(1, username);
            preparedStatement.setString(2,password);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        try {
            resultSet = preparedStatement.executeQuery();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        try {
            staffs = new Staffs();
            while (resultSet.next()) {
                staffs.setId(resultSet.getLong("id"));
                staffs.setUsername(resultSet.getString("username"));
                staffs.setPassword(resultSet.getString("password"));

            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return staffs;
    }
}


