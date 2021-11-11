package com.penalty.controller.web;

import com.penalty.model.CategoryModel;
import com.penalty.model.ProductModel;
import com.penalty.service.ICategoryService;
import com.penalty.service.IProductService;
import com.penalty.service.IUserService;
import com.penalty.utils.FormUtil;
import com.penalty.utils.SessionUtil;

import javax.inject.Inject;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.nio.charset.StandardCharsets;
import java.util.ResourceBundle;

@WebServlet(urlPatterns = {"/home", "/login", "/logout"})
public class HomeController extends HttpServlet {

    @Inject
    private IUserService iUserService;

    @Inject
    private ICategoryService iCategoryService;

    @Inject
    private IProductService iProductService;

    private ResourceBundle resourceBundle = ResourceBundle.getBundle("message");

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        HttpSession httpSession = req.getSession();
        if (action != null && action.equals("login")) {
            String alert = req.getParameter("alert");
            String message = req.getParameter("message");
            if (message != null && alert != null) {
                req.setAttribute("message", new String(resourceBundle.getString(message).getBytes(StandardCharsets.ISO_8859_1), StandardCharsets.UTF_8));
                req.setAttribute("alert", alert);
            }
            RequestDispatcher rd = req.getRequestDispatcher("/views/login.jsp");
            rd.forward(req, resp);
        } else if (action != null && action.equals("logout")) {
            httpSession.invalidate();
            SessionUtil.getInstance().removeValue(req, "USERMODEL");
            resp.sendRedirect(req.getContextPath() + "/home");
        } else {
            CategoryModel categoryModel = FormUtil.toModel(CategoryModel.class, req);
            categoryModel.setListResult(iCategoryService.findAll());
            req.setAttribute("categories", categoryModel);

            // Offer Product
            ProductModel twoLatestProduct = FormUtil.toModel(ProductModel.class, req);
            twoLatestProduct.setListResult(iProductService.twoLatestProduct("created_date", 2));
            req.setAttribute("twoLatestProduct", twoLatestProduct);
            // Best Seller
            ProductModel bestSeller = FormUtil.toModel(ProductModel.class, req);
            bestSeller.setListResult(iProductService.twoLatestProduct("buy", 4));
            req.setAttribute("bestSeller", bestSeller);

            // List Products
            ProductModel list1 = FormUtil.toModel(ProductModel.class, req);
            list1.setListResult(iProductService.listProduct(1, 6));
            req.setAttribute("list1", list1);
            CategoryModel category1 = FormUtil.toModel(CategoryModel.class, req);
            category1 = iCategoryService.findOne(1);
            req.setAttribute("category1", category1);

            ProductModel list2 = FormUtil.toModel(ProductModel.class, req);
            list2.setListResult(iProductService.listProduct(5, 6));
            req.setAttribute("list2", list2);
            CategoryModel category2 = FormUtil.toModel(CategoryModel.class, req);
            category2 = iCategoryService.findOne(5);
            req.setAttribute("category2", category2);

            ProductModel list3 = FormUtil.toModel(ProductModel.class, req);
            list3.setListResult(iProductService.listProduct(3, 6));
            req.setAttribute("list3", list3);
            CategoryModel category3 = FormUtil.toModel(CategoryModel.class, req);
            category3 = iCategoryService.findOne(3);
            req.setAttribute("category3", category3);

            ProductModel list4 = FormUtil.toModel(ProductModel.class, req);
            list4.setListResult(iProductService.listProduct(4, 6));
            req.setAttribute("list4", list4);
            CategoryModel category4 = FormUtil.toModel(CategoryModel.class, req);
            category4 = iCategoryService.findOne(4);
            req.setAttribute("category4", category4);
            // End List Products

            RequestDispatcher rd = req.getRequestDispatcher("/views/web/home.jsp");
            rd.forward(req, resp);
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        /*if (action != null && action.equals("login")) {
            UserModel userModel = FormUtil.toModel(UserModel.class, req);
            userModel = iUserService.findByUserNameAndPassword(userModel.getUser_name(), userModel.getUser_pass());
            if (userModel != null) {
                SessionUtil.getInstance().putValue(req, "USERMODEL", userModel);
                if (!userModel.getUser_role()) {
                    resp.sendRedirect(req.getContextPath() + "/admin-home");
                } else {
                    resp.sendRedirect(req.getContextPath() + "/home");
                }
            } else {
                resp.sendRedirect(req.getContextPath() + "/login?action=login&message=username_password_invalid&alert=danger");
            }
        }*/
        resp.sendRedirect(req.getContextPath() + "/admin-home");
    }
}
