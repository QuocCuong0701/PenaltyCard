package com.penalty.model;

public class BillDetailModel extends AbstractModel<BillDetailModel> {
    private int bill_detail_id;
    private int bill_id;
    private int product_id;
    private String product_name;
    private String product_image;
    private double product_price;
    private int quantity;

    public BillDetailModel() {
    }

    public BillDetailModel(String product_name, double product_price, int quantity) {
        this.product_name = product_name;
        this.product_price = product_price;
        this.quantity = quantity;
    }

    public BillDetailModel(int product_id, String product_name, double product_price, int quantity) {
        this.product_id = product_id;
        this.product_name = product_name;
        this.product_price = product_price;
        this.quantity = quantity;
    }

    public int getBill_detail_id() {
        return bill_detail_id;
    }

    public void setBill_detail_id(int bill_detail_id) {
        this.bill_detail_id = bill_detail_id;
    }

    public int getBill_id() {
        return bill_id;
    }

    public void setBill_id(int bill_id) {
        this.bill_id = bill_id;
    }

    public int getProduct_id() {
        return product_id;
    }

    public void setProduct_id(int product_id) {
        this.product_id = product_id;
    }

    public String getProduct_name() {
        return product_name;
    }

    public void setProduct_name(String product_name) {
        this.product_name = product_name;
    }

    public String getProduct_image() {
        return product_image;
    }

    public void setProduct_image(String product_image) {
        this.product_image = product_image;
    }

    public double getProduct_price() {
        return product_price;
    }

    public void setProduct_price(double product_price) {
        this.product_price = product_price;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }
}
