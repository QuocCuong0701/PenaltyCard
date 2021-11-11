package com.penalty.model;

public class BillModel extends AbstractModel<BillModel> {
    private int bill_id;
    private int user_id;
    private String full_name;
    private String address;
    private String email;
    private String phone;
    private double total;
    private String note;
    private boolean confirmed;

    public BillModel() {
    }

    public BillModel(int user_id, String full_name, String address, String email, String phone, double total, String note) {
        this.user_id = user_id;
        this.full_name = full_name;
        this.address = address;
        this.email = email;
        this.phone = phone;
        this.total = total;
        this.note = note;
    }
    public BillModel( String full_name, String address, String email, String phone, double total, String note) {
        this.full_name = full_name;
        this.address = address;
        this.email = email;
        this.phone = phone;
        this.total = total;
        this.note = note;
    }

    public String getFull_name() {
        return full_name;
    }

    public void setFull_name(String full_name) {
        this.full_name = full_name;
    }

    public String getNote() {
        return note;
    }

    public void setNote(String note) {
        this.note = note;
    }

    public boolean isConfirmed() {
        return confirmed;
    }

    public void setConfirmed(boolean confirmed) {
        this.confirmed = confirmed;
    }

    public int getBill_id() {
        return bill_id;
    }

    public void setBill_id(int bill_id) {
        this.bill_id = bill_id;
    }

    public int getUser_id() {
        return user_id;
    }

    public void setUser_id(int user_id) {
        this.user_id = user_id;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public double getTotal() {
        return total;
    }

    public void setTotal(double total) {
        this.total = total;
    }
}
