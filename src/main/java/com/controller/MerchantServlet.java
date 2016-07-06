package com.controller;

import com.dao.MerchantDao;
import com.google.gson.Gson;
import com.jsonResponse.MerchantsJson;
import com.jsonResponse.StaffsJson;
import com.model.Sales;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Date;
import java.util.List;

/**
 * Created by mesutaygun on 6/29/2016.
 */
@WebServlet("create-merchant")
public class MerchantServlet extends HttpServlet {

    MerchantDao merchantDao =null;



    public  void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {


        req.getRequestDispatcher("merchant-create.jsp").forward(req,resp);
    }


    public  void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            merchantDao = new MerchantDao();
        } catch (Exception e) {
            e.printStackTrace();
        }
        String parameters = req.getParameter("search[value]") != null ?  req.getParameter("search[value]") : null ;



        MerchantsJson sjson = new MerchantsJson();

        if(parameters != null){
            List<Sales> listAll = merchantDao.getListAll(parameters);
            sjson.setiTotalRecords(listAll.size());
            sjson.setAaData(listAll);
            sjson.setiTotalDisplayRecords(10);

            resp.setContentType("application/json");
            String json = new Gson().toJson(listAll);
            System.out.println(json);
            resp.getWriter().write(new Gson().toJson(sjson).toString());
        }else {

            List<Sales> merchants = merchantDao.listAll();
            sjson.setiTotalRecords(merchants.size());
            sjson.setAaData(merchants);
            sjson.setiTotalDisplayRecords(10);

            resp.setContentType("application/json");
                String json = new Gson().toJson(merchants);
            System.out.println(json);
            resp.getWriter().write(new Gson().toJson(sjson).toString());
        }
    }
}
