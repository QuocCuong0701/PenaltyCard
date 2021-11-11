package com.penalty.controller.web;

import com.penalty.model.BillModel;
import com.penalty.model.CategoryModel;
import com.penalty.service.IBillDetailService;
import com.penalty.service.IBillService;
import com.penalty.service.ICategoryService;
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

@WebServlet(urlPatterns = {"/registration", "/account", "/account/profile", "/account/receipt"})
public class RegistrationController extends HttpServlet {
    @Inject
    private ICategoryService iCategoryService;
    @Inject
    private IBillService iBillService;
    @Inject
    private IBillDetailService iBillDetailService;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String view = "";
        if (req.getRequestURI().endsWith("profile")) {
            view = "/views/web/account/account.jsp";
        } else if (req.getRequestURI().endsWith("receipt")) {
            String user_id = req.getParameter("user_id");
            BillModel billModel = FormUtil.toModel(BillModel.class, req);
            billModel.setListResult(iBillService.findAllByUserId(Integer.parseInt(user_id), true));
            req.setAttribute("listBillModel", billModel);

            BillModel billModelNotConfirmed = FormUtil.toModel(BillModel.class, req);
            billModelNotConfirmed.setListResult(iBillService.findAllByUserId(Integer.parseInt(user_id), false));
            req.setAttribute("notConfirmed", billModelNotConfirmed);

            view = "/views/web/account/receipt.jsp";
        } else {
            view = "/views/web/registration/registration.jsp";
        }

        CategoryModel categoryModel = FormUtil.toModel(CategoryModel.class, req);
        categoryModel.setListResult(iCategoryService.findAll());
        req.setAttribute("categories", categoryModel);

        MessageUtil.showMessage(req);
        RequestDispatcher rd = req.getRequestDispatcher(view);
        rd.forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

    }
}
