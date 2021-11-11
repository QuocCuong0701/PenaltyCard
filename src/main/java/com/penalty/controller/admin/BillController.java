package com.penalty.controller.admin;

import com.penalty.constant.SystemConstant;
import com.penalty.model.BillModel;
import com.penalty.service.IBillDetailService;
import com.penalty.service.IBillService;
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

@WebServlet(urlPatterns = {"/admin-bill"})
public class BillController extends HttpServlet {
    @Inject
    private IBillService iBillService;
    @Inject
    private IBillDetailService iBillDetailService;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        BillModel billModel = FormUtil.toModel(BillModel.class, req);
        String view = "";
        if (billModel.getType().equals(SystemConstant.LIST)) {
            billModel.setListResult(iBillService.findAll());
            view = "/views/admin/bill/list.jsp";
        } else if (billModel.getType().equals(SystemConstant.EDIT)) {
            view = "/views/admin/bill/edit.jsp";
        }
        MessageUtil.showMessage(req);
        req.setAttribute(SystemConstant.MODEL, billModel);
        RequestDispatcher rd = req.getRequestDispatcher(view);
        rd.forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doPost(req, resp);
    }

    @Override
    protected void doPut(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doPut(req, resp);
    }

    @Override
    protected void doDelete(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doDelete(req, resp);
    }
}
