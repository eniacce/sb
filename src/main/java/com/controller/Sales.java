package com.controller;

import com.connectionDao.PostgresqlDAO;
import com.dao.LoginDao;
import com.dao.SalesReortDAO;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.jsonResponse.StaffsJson;
import com.model.SalesReport;
import com.model.Staffs;
import org.json.JSONArray;
import org.json.JSONObject;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import static java.lang.System.out;

/**
 * Created by mesutaygun on 6/26/2016.
 */
@WebServlet("sales")
public class Sales extends HttpServlet {

    LoginDao ld;
    SalesReortDAO salesReortDAO;

    public void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            salesReortDAO = new SalesReortDAO();
        } catch (Exception e) {
            e.printStackTrace();
        }
        List<SalesReport> salesReport = salesReortDAO.getSalesReport();
        String json="";
        int counter = 1;
        if (salesReport != null) {
            json += "[";
        }

        for (SalesReport chartModel : salesReport) {
            json += chartModel.getAmount() + ",";
                        counter++;
        }
        if (salesReport != null) {
            json += "0]";
        }
        System.out.println(json);
        resp.setContentType("application/json");
        resp.getWriter().write(json);

    }

    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        try {
            ld = new LoginDao();
        } catch (Exception e) {
            e.printStackTrace();
        }

        Staffs mesut = ld.getStaff("mesut", "060102056");
        Staffs s = new Staffs();
        s.setId(2L);
        s.setUsername("umit");
        s.setPassword("123456");
        List<Staffs> ss = new ArrayList<Staffs>();
        ss.add(mesut);
        ss.add(s);
        StaffsJson staffsJson = new StaffsJson();
        staffsJson.setiTotalRecords(10);
        staffsJson.setiTotalRecords(ss.size());
        staffsJson.setAaData(ss);
        response.setContentType("application/json");
        PrintWriter out = response.getWriter();
        Gson gson = new GsonBuilder().setPrettyPrinting().create();
        String json2 = gson.toJson(staffsJson);
        out.print(json2);


    }

}

