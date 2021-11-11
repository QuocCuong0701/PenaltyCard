package com.penalty.controller.admin.api;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.penalty.model.BillModel;
import com.penalty.service.IBillService;
import com.penalty.utils.HttpUtil;

import javax.inject.Inject;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(urlPatterns = {"/api-admin-bill"})
public class BillAPI extends HttpServlet {
    @Inject
    private IBillService iBillService;

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        ObjectMapper mapper = new ObjectMapper();
        req.setCharacterEncoding("UTF-8");
        resp.setContentType("application/json");
        BillModel billModel = HttpUtil.of(req.getReader()).toModel(BillModel.class);
        billModel = iBillService.save(billModel);
        mapper.writeValue(resp.getOutputStream(), billModel);
    }

    @Override
    protected void doPut(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        ObjectMapper mapper = new ObjectMapper();
        req.setCharacterEncoding("UTF-8");
        resp.setContentType("application/json");
        String billId = req.getParameter("bill_id");
        BillModel billModel;
        billModel = iBillService.update(Integer.parseInt(billId));
        mapper.writeValue(resp.getOutputStream(), billModel);
    }

    @Override
    protected void doDelete(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        ObjectMapper mapper = new ObjectMapper();
        req.setCharacterEncoding("UTF-8");
        resp.setContentType("application/json");
        BillModel billModel = HttpUtil.of(req.getReader()).toModel(BillModel.class);
        iBillService.delete(billModel.getIds());
        mapper.writeValue(resp.getOutputStream(), "{}");
    }
}
