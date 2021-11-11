package com.penalty.controller.web;

import com.penalty.model.BillDetailModel;
import com.penalty.model.BillModel;
import com.penalty.service.IBillDetailService;
import com.penalty.service.IBillService;
import com.penalty.utils.PaymentServices;
import com.paypal.api.payments.*;
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

@WebServlet("/execute_payment")
public class ExecutePaymentServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    @Inject
    private IBillService iBillService;
    @Inject
    private IBillDetailService iBillDetailService;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String paymentId = request.getParameter("paymentId");
        String payerId = request.getParameter("PayerID");
        String user_id = request.getParameter("user_id");
        String created_date = request.getParameter("created_date");
        String[] product_id = request.getParameterValues("product_id");
        HttpSession httpSession = request.getSession();

        long milisec = Long.parseLong(created_date);
        DateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        Timestamp ts = new Timestamp(milisec);

        try {
            PaymentServices paymentServices = new PaymentServices();
            Payment payment = paymentServices.executePayment(paymentId, payerId);

            PayerInfo payerInfo = payment.getPayer().getPayerInfo();
            Transaction transaction = payment.getTransactions().get(0);

            ShippingAddress shippingAddress = transaction.getItemList().getShippingAddress();
            String address = shippingAddress.getLine1() + ", " + shippingAddress.getCity() + ", " + shippingAddress.getState() + ", " + shippingAddress.getCountryCode();

            BillModel billModel;
            assert false;
            if (!user_id.equals("")) {
                billModel = new BillModel(Integer.parseInt(user_id), payerInfo.getFirstName() + " " + payerInfo.getLastName(),
                        address, payerInfo.getEmail(), "0333385398", Double.parseDouble(transaction.getAmount().getTotal()), transaction.getDescription());
                billModel.setCreated_date(Timestamp.valueOf(df.format(ts)));
            } else {
                billModel = new BillModel(payerInfo.getFirstName() + " " + payerInfo.getLastName(), address, payerInfo.getEmail(),
                        "0333385398", Double.parseDouble(transaction.getAmount().getTotal()), transaction.getDescription());
                billModel.setCreated_date(Timestamp.valueOf(df.format(ts)));
            }

            BillDetailModel billDetailModel;
            List<BillDetailModel> billDetailModels = new ArrayList<>();
            List<Item> items = transaction.getItemList().getItems();
            for (int i = 0; i < items.size(); i++) {
                billDetailModel = new BillDetailModel(Integer.parseInt(product_id[i]), items.get(i).getName(), Double.parseDouble(items.get(i).getPrice()), Integer.parseInt(items.get(i).getQuantity()));
                billDetailModels.add(billDetailModel);
            }

            BillModel saveBill = iBillService.save(billModel);
            System.out.println(saveBill.getBill_id());
            for (BillDetailModel saveBilDetail : billDetailModels) {
                saveBilDetail.setBill_id(saveBill.getBill_id());
                iBillDetailService.save(saveBilDetail);
            }

            request.setAttribute("payer", payerInfo);
            request.setAttribute("transaction", transaction);
            request.setAttribute("BillModel", saveBill);

            httpSession.removeAttribute("model");
            httpSession.removeAttribute("totalQuantity");
            httpSession.removeAttribute("totalPrice");

            request.getRequestDispatcher("/views/web/checkout/orderReceived.jsp").forward(request, response);

        } catch (PayPalRESTException ex) {
            request.setAttribute("errorMessage", "HÓA ĐƠN ĐÃ ĐƯỢC THANH TOÁN.");
            ex.getMessage();
            ex.printStackTrace();
            request.getRequestDispatcher("/views/web/404/404.jsp").forward(request, response);
        }
    }
}
