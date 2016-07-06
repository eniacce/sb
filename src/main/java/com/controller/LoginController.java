package com.controller;

import com.dao.LoginDao;
import com.model.Staffs;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

/**
 * Created by mesutaygun on 6/26/2016.
 */
@WebServlet("login")
public class LoginController  extends HttpServlet {

    LoginDao ld= null;

    public void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {



    }

    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            ld= new LoginDao();
        } catch (Exception e) {
            e.printStackTrace();
        }
        Staffs staffs = ld.getStaff(req.getParameter("username"),req.getParameter("password"));
        HttpSession session = req.getSession();
        session.setAttribute("staffs",staffs);
        req.getRequestDispatcher("giris.jsp").forward(req,resp);
    }
}
