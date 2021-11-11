package com.penalty.controller.admin;

import com.penalty.constant.SystemConstant;
import com.penalty.model.ProductModel;
import com.penalty.service.ICategoryService;
import com.penalty.service.IProductService;
import com.penalty.utils.FormUtil;
import com.penalty.utils.MessageUtil;

import javax.inject.Inject;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(urlPatterns = {"/admin-product"})
public class ProductController extends HttpServlet {

    @Inject
    private IProductService iProductService;
    @Inject
    private ICategoryService iCategoryService;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        ProductModel productModel = FormUtil.toModel(ProductModel.class, req);
        String view = "";
        if (productModel.getType().equals(SystemConstant.LIST)) {
            productModel.setListResult(iProductService.findAll());
            view = "/views/admin/product/list.jsp";
        } else if (productModel.getType().equals(SystemConstant.EDIT)) {
            if (productModel.getProduct_id() != 0) {
                productModel = iProductService.findOne(productModel.getProduct_id());
            }
            view = "/views/admin/product/edit.jsp";
        }
        MessageUtil.showMessage(req);
        req.setAttribute("categories", iCategoryService.findAll());
        req.setAttribute(SystemConstant.MODEL, productModel);
        RequestDispatcher rd = req.getRequestDispatcher(view);
        rd.forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doPost(req, resp);
    }
}
