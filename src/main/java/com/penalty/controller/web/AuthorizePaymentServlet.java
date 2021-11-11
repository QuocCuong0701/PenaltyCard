package com.penalty.controller.web;

import com.penalty.model.BillDetailModel;
import com.penalty.model.BillModel;
import com.penalty.service.IBillDetailService;
import com.penalty.service.IBillService;
import com.penalty.utils.PaymentServices;
import com.paypal.base.rest.PayPalRESTException;

import javax.inject.Inject;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.Timestamp;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

@WebServlet(urlPatterns = {"/authorize_payment"})
public class AuthorizePaymentServlet extends HttpServlet {
    @Inject
    private IBillService iBillService;
    @Inject
    private IBillDetailService iBillDetailService;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession httpSession = request.getSession();
        request.setCharacterEncoding("UTF-8");
        String user_id = request.getParameter("user_id");
        String full_name = request.getParameter("full_name");
        String user_name = request.getParameter("user_name");
        String user_full_name = request.getParameter("user_full_name");
        String user_email = request.getParameter("user_email");
        String address = request.getParameter("address");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String note = request.getParameter("note");
        String total = request.getParameter("total");
        String created_date = request.getParameter("created_date");
        String checkoutMethod = request.getParameter("checkoutMethod");

        String[] product_id = request.getParameterValues("product_id");
        String[] product_name = request.getParameterValues("product_name");
        String[] product_quantity = request.getParameterValues("product_quantity");
        String[] product_price = request.getParameterValues("product_price");

        long milisec = Long.parseLong(created_date);
        DateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        Timestamp ts = new Timestamp(milisec);

        BillModel billModel;
        assert false;
        if (!user_id.equals("")) {
            billModel = new BillModel(Integer.parseInt(user_id), user_full_name, full_name + ", " + address, user_email, phone, Double.parseDouble(total), note);
            billModel.setCreated_date(Timestamp.valueOf(df.format(ts)));
        } else {
            billModel = new BillModel(user_full_name, full_name + ", " + address, user_email, phone, Double.parseDouble(total), note);
            billModel.setCreated_date(Timestamp.valueOf(df.format(ts)));
        }

        if (checkoutMethod.equals("direct")) {
            BillDetailModel billDetailModel;
            List<BillDetailModel> billDetailModels = new ArrayList<>();
            for (int i = 0; i < product_name.length; i++) {
                billDetailModel = new BillDetailModel(Integer.parseInt(product_id[i]), product_name[i], Double.parseDouble(product_price[i]), Integer.parseInt(product_quantity[i]));
                billDetailModels.add(billDetailModel);
                billDetailModel.setListResult(billDetailModels);
            }
            BillModel saveBill = iBillService.save(billModel);
            for (BillDetailModel saveBilDetail : billDetailModels) {
                saveBilDetail.setBill_id(saveBill.getBill_id());
                iBillDetailService.save(saveBilDetail);
            }
            request.setAttribute("paymentMethod", checkoutMethod);
            request.setAttribute("BillModel", saveBill);
            request.setAttribute("listBillDetail", billDetailModels);

            String url = "/views/web/checkout/orderReceived.jsp";
            request.getRequestDispatcher(url).forward(request, response);
        }

        if (checkoutMethod.equals("paypal")) {
            BillDetailModel billDetailModel = null;
            List<BillDetailModel> billDetailModels = new ArrayList<>();
            for (int i = 0; i < product_name.length; i++) {
                billDetailModel = new BillDetailModel(product_name[i], Double.parseDouble(product_price[i]), Integer.parseInt(product_quantity[i]));
                billDetailModels.add(billDetailModel);
                billDetailModel.setListResult(billDetailModels);
            }
            try {
                PaymentServices paymentServices = new PaymentServices();
                String approvalLink = paymentServices.authorizePayment(billModel, billDetailModel);

                response.sendRedirect(approvalLink);

            } catch (PayPalRESTException ex) {
                request.setAttribute("errorMessage", ex.getMessage());
                ex.printStackTrace();
                request.getRequestDispatcher("/views/web/404/404.jsp").forward(request, response);
            }
        }
        httpSession.removeAttribute("model");
        httpSession.removeAttribute("totalQuantity");
        httpSession.removeAttribute("totalPrice");
    }
}
