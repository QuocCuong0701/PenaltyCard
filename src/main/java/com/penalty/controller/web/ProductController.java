package com.penalty.controller.web;

import com.penalty.constant.SystemConstant;
import com.penalty.model.CategoryModel;
import com.penalty.model.ProductModel;
import com.penalty.paging.PageRequest;
import com.penalty.paging.Pageble;
import com.penalty.service.ICategoryService;
import com.penalty.service.IProductService;
import com.penalty.sort.Sorter;
import com.penalty.utils.FormUtil;

import javax.inject.Inject;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(urlPatterns = {"/product", "/single-shop"})
public class ProductController extends HttpServlet {
    @Inject
    private IProductService iProductService;

    @Inject
    private ICategoryService iCategoryService;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        ProductModel productModel = FormUtil.toModel(ProductModel.class, req);
        String category_id = req.getParameter("category_id");
        String product_name = req.getParameter("product_name");
        Pageble pageble = null;
        String view = "";
        String act = req.getParameter("act");
        String sortName = req.getParameter("sortName");
        String sortBy = req.getParameter("sortBy");

        if (req.getRequestURI().endsWith("product")) {
            if (sortName != null && sortBy != null) {
                pageble = new PageRequest((productModel.getPage()), 9, new Sorter(sortName, sortBy));
            } else {
                pageble = new PageRequest(productModel.getPage(), 9, new Sorter("product_name", "asc"));
            }
            view = "/views/web/product/product.jsp";
        }
        if (req.getRequestURI().endsWith("single-shop")) {
            if (sortName != null && sortBy != null) {
                pageble = new PageRequest((productModel.getPage()), 6, new Sorter(sortName, sortBy));
            } else {
                pageble = new PageRequest(productModel.getPage(), 6, new Sorter("product_name", "asc"));
            }
            view = "/views/web/product/single-shop.jsp";
        }

        if (category_id == null || category_id.equalsIgnoreCase("")) {
            if (product_name == null) {
                productModel.setListResult(iProductService.findAll(pageble));
            } else {
                productModel.setListResult(iProductService.findByCategoryAndName(pageble, "", product_name));
            }
        } else {
            if (product_name == null || product_name.equalsIgnoreCase("")) {
                productModel.setListResult(iProductService.findByCategory(pageble, Integer.parseInt(category_id)));
            } else {
                productModel.setListResult(iProductService.findByCategoryAndName(pageble, iCategoryService.findOne(Integer.parseInt(category_id)).getCategory_name(), product_name.trim()));
            }
        }
        productModel.setTotalItem(iProductService.getTotalItem());
        productModel.setTotalPage((int) Math.ceil((double) productModel.getTotalItem() / pageble.getLimit()));

        CategoryModel categoryModel = FormUtil.toModel(CategoryModel.class, req);
        categoryModel.setListResult(iCategoryService.findAll());
        req.setAttribute("categories", categoryModel);

        req.setAttribute(SystemConstant.MODEL, productModel);
        RequestDispatcher rd = req.getRequestDispatcher(view);
        rd.forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doPost(req, resp);
    }
}
