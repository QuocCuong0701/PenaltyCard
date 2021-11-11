package com.penalty.controller.web;

import com.penalty.model.BillDetailModel;
import com.penalty.model.BillModel;
import com.penalty.model.CategoryModel;
import com.penalty.service.IBillDetailService;
import com.penalty.service.IBillService;
import com.penalty.service.ICategoryService;
import com.penalty.service.IProductService;

import javax.inject.Inject;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet(urlPatterns = {"/checkout", "/checkout/order-received"})
public class CheckoutController extends HttpServlet {
    @Inject
    private IProductService iProductService;

    @Inject
    private ICategoryService iCategoryService;

    @Inject
    private IBillService iBillService;

    @Inject
    private IBillDetailService iBillDetailService;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession httpSession = req.getSession();
        String view = "";
        BillModel billModel;

        if (req.getRequestURI().endsWith("checkout")) {
            view = "/views/web/checkout/checkout.jsp";
        } else if (req.getRequestURI().endsWith("order-received")) {
            String bill_id = req.getParameter("bill_id");

            billModel = iBillService.findOne(Integer.parseInt(bill_id));

            BillDetailModel billDetailModel = new BillDetailModel();
            billDetailModel.setListResult(iBillDetailService.findBillDetailByBillId(Integer.parseInt(bill_id)));
            for (BillDetailModel bdm : billDetailModel.getListResult()) {
                iProductService.updateBuy(iProductService.findOneByProductId(bdm.getProduct_id()));
            }

            req.setAttribute("listBillDetail", billDetailModel);
            req.setAttribute("BillModel", billModel);
            view = "/views/web/checkout/orderReceived.jsp";
            httpSession.removeAttribute("model");
            httpSession.removeAttribute("totalQuantity");
            httpSession.removeAttribute("totalPrice");
        }

        CategoryModel categoryModel = new CategoryModel();
        categoryModel.setListResult(iCategoryService.findAll());
        req.setAttribute("categories", categoryModel);

        RequestDispatcher rd = req.getRequestDispatcher(view);
        rd.forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

    }
}
