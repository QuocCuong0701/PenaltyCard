package com.penalty.controller.web;

import com.penalty.model.CategoryModel;
import com.penalty.service.ICategoryService;
import com.penalty.utils.FormUtil;

import javax.inject.Inject;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(urlPatterns = {"/about-us","/contact"})
public class AboutUsController extends HttpServlet {
    @Inject
    private ICategoryService iCategoryService;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        CategoryModel categoryModel = FormUtil.toModel(CategoryModel.class, req);
        categoryModel.setListResult(iCategoryService.findAll());
        req.setAttribute("categories", categoryModel);

        String view = "";
        if(req.getRequestURI().endsWith("about-us")){
            view="/views/web/aboutUs/aboutUs.jsp";
        }
        if(req.getRequestURI().endsWith("contact")){
            view="/views/web/contactUs/contactUs.jsp";
        }
        RequestDispatcher rd = req.getRequestDispatcher(view);
        rd.forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doPost(req, resp);
    }
}
