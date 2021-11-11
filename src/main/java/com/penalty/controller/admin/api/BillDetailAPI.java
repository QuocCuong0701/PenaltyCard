package com.penalty.controller.admin.api;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.penalty.model.BillDetailModel;
import com.penalty.service.IBillDetailService;
import com.penalty.utils.HttpUtil;

import javax.inject.Inject;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(urlPatterns = {"/api-admin-billDetail"})
public class BillDetailAPI extends HttpServlet {
    @Inject
    private IBillDetailService iBillDetailService;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        ObjectMapper mapper = new ObjectMapper();
        req.setCharacterEncoding("UTF-8");
        resp.setContentType("application/json");
        String billId = req.getParameter("bill_id");
        List<BillDetailModel> list = iBillDetailService.findBillDetailByBillId(Integer.parseInt(billId));
        mapper.writeValue(resp.getOutputStream(), list);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        ObjectMapper mapper = new ObjectMapper();
        req.setCharacterEncoding("UTF-8");
        resp.setContentType("application/json");
        BillDetailModel billDetailModel = HttpUtil.of(req.getReader()).toModel(BillDetailModel.class);
        iBillDetailService.save(billDetailModel);
        mapper.writeValue(resp.getOutputStream(), billDetailModel);
    }
}
