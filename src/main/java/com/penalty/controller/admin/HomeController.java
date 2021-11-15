package com.penalty.controller.admin;

import com.penalty.constant.SystemConstant;
import com.penalty.model.SanDau;
import com.penalty.service.ISanDauService;
import com.penalty.utils.FormUtil;

import javax.inject.Inject;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(urlPatterns = {"/admin-home"})
public class HomeController extends HttpServlet {

    @Inject
    private ISanDauService iSanDauService;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        RequestDispatcher rd = req.getRequestDispatcher("/views/admin/home.jsp");
//        req.setAttribute("sanDaus", iSanDauService.findAll());
        rd.forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

    }
}
