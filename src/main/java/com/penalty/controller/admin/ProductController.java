package com.penalty.controller.admin;

import com.penalty.constant.SystemConstant;
import com.penalty.model.KetQua;
import com.penalty.model.ThongKe;
import com.penalty.model.TranDauDoiBong;
import com.penalty.service.IKetQuaService;
import com.penalty.service.IProductService;
import com.penalty.service.IThongKeService;
import com.penalty.service.ITranDauDoiBongService;
import com.penalty.utils.FormUtil;

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
    private IThongKeService iThongKeService;
    @Inject
    private ITranDauDoiBongService iTranDauDoiBongService;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        TranDauDoiBong tranDauDoiBong = FormUtil.toModel(TranDauDoiBong.class, req);
        ThongKe thongKe = FormUtil.toModel(ThongKe.class, req);
        String view = "";
        if (tranDauDoiBong.getType().equals(SystemConstant.LIST)) {
            tranDauDoiBong.setListResult(iTranDauDoiBongService.findAll());
            view = "/views/admin/product/list.jsp";
            req.setAttribute(SystemConstant.MODEL, tranDauDoiBong);
        } else if (tranDauDoiBong.getType().equals(SystemConstant.EDIT)) {
            if (tranDauDoiBong.getId() != 0) {
                thongKe.setListResult(iThongKeService.findAllByDoiBongId(tranDauDoiBong.getId()));
            }
            view = "/views/admin/product/edit.jsp";
            req.setAttribute(SystemConstant.MODEL, thongKe);
        }

        RequestDispatcher rd = req.getRequestDispatcher(view);
        rd.forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doPost(req, resp);
    }
}
