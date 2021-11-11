package com.penalty.utils;

import com.penalty.model.BillDetailModel;
import com.penalty.model.BillModel;
import com.paypal.api.payments.*;
import com.paypal.base.rest.APIContext;
import com.paypal.base.rest.PayPalRESTException;

import java.util.ArrayList;
import java.util.List;

public class PaymentServices {
    private static final String CLIENT_ID = "AZJ_cgKgeyFTPwl_s5FnjbEQ80mwdhQv-Mu3eZZFKMlvg-a9DIGl7hC06K7nqKo1n-JY8-dA1FdXxMcZ";
    private static final String CLIENT_SECRET = "ECa0b_-5TmVKJkcAGhFb16IVvBG-zlfZCbtwkpYdvZp-Kq9Pg8Tzuh1ods5u4hQ1e-2JEQ_s3XZ7wYBL";
    private static final String MODE = "sandbox";
    private static final double USD_TO_VND = 23445.50;

    public String authorizePayment(BillModel orderDetail, BillDetailModel billDetailModel) throws PayPalRESTException {

        Payer payer = getPayerInformation();
        RedirectUrls redirectUrls = getRedirectURLs();
        List<Transaction> listTransaction = getTransactionInformation(orderDetail, billDetailModel);

        Payment requestPayment = new Payment();
        requestPayment.setTransactions(listTransaction);
        requestPayment.setRedirectUrls(redirectUrls);
        requestPayment.setPayer(payer);
        requestPayment.setIntent("authorize");

        APIContext apiContext = new APIContext(CLIENT_ID, CLIENT_SECRET, MODE);

        Payment approvedPayment = requestPayment.create(apiContext);

        return getApprovalLink(approvedPayment);

    }

    private Payer getPayerInformation() {
        Payer payer = new Payer();
        payer.setPaymentMethod("paypal");

        PayerInfo payerInfo = new PayerInfo();
        payerInfo.setFirstName("Jon")
                .setLastName("Snow")
                .setEmail("jon.snow@personal.com");

        payer.setPayerInfo(payerInfo);

        return payer;
    }

    private RedirectUrls getRedirectURLs() {
        RedirectUrls redirectUrls = new RedirectUrls();
        redirectUrls.setCancelUrl("http://localhost:8080/views/web/checkout/cancel.jsp");
        redirectUrls.setReturnUrl("http://localhost:8080/review_payment");

        return redirectUrls;
    }

    private List<Transaction> getTransactionInformation(BillModel orderDetail, BillDetailModel billDetailModel) {
        Details details = new Details();
        //details.setShipping("0");
        details.setSubtotal(String.valueOf(orderDetail.getTotal()));
        //details.setTax("0");

        Amount amount = new Amount();
        amount.setCurrency("USD");
        amount.setTotal(String.valueOf(orderDetail.getTotal()));
        amount.setDetails(details);

        Transaction transaction = new Transaction();
        transaction.setAmount(amount);
        transaction.setDescription("");

        ItemList itemList = new ItemList();
        List<Item> items = new ArrayList<>();

        Item item;
        for (BillDetailModel billDetail : billDetailModel.getListResult()) {
            item = new Item();
            item.setCurrency("USD");
            item.setName(billDetail.getProduct_name());
            item.setPrice(String.valueOf(billDetail.getProduct_price()));
            //item.setTax(orderDetail.getTax());
            item.setQuantity(String.valueOf(billDetail.getQuantity()));

            items.add(item);
        }

        itemList.setItems(items);
        transaction.setItemList(itemList);

        List<Transaction> listTransaction = new ArrayList<>();
        listTransaction.add(transaction);

        return listTransaction;
    }

    private String getApprovalLink(Payment approvedPayment) {
        List<Links> links = approvedPayment.getLinks();
        String approvalLink = null;

        for (Links link : links) {
            if (link.getRel().equalsIgnoreCase("approval_url")) {
                approvalLink = link.getHref();
                break;
            }
        }

        return approvalLink;
    }

    public Payment getPaymentDetails(String paymentId) throws PayPalRESTException {
        APIContext apiContext = new APIContext(CLIENT_ID, CLIENT_SECRET, MODE);
        return Payment.get(apiContext, paymentId);
    }

    public Payment executePayment(String paymentId, String payerId) throws PayPalRESTException {
        PaymentExecution paymentExecution = new PaymentExecution();
        paymentExecution.setPayerId(payerId);

        Payment payment = new Payment().setId(paymentId);

        APIContext apiContext = new APIContext(CLIENT_ID, CLIENT_SECRET, MODE);

        return payment.execute(apiContext, paymentExecution);
    }
}
