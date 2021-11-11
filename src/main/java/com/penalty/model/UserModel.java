package com.penalty.model;

public class UserModel extends AbstractModel<UserModel> {
    private int user_id;
    private String user_name;
    private String user_full_name;
    private String user_email;
    private String user_pass;
    private boolean user_role;

    public int getUser_id() {
        return user_id;
    }

    public void setUser_id(int user_id) {
        this.user_id = user_id;
    }

    public String getUser_name() {
        return user_name;
    }

    public void setUser_name(String user_name) {
        this.user_name = user_name;
    }

    public String getUser_full_name() {
        return user_full_name;
    }

    public void setUser_full_name(String user_full_name) {
        this.user_full_name = user_full_name;
    }

    public boolean isUser_role() {
        return user_role;
    }

    public String getUser_email() {
        return user_email;
    }

    public void setUser_email(String user_email) {
        this.user_email = user_email;
    }

    public String getUser_pass() {
        return user_pass;
    }

    public void setUser_pass(String user_pass) {
        this.user_pass = user_pass;
    }

    public boolean getUser_role() {
        return user_role;
    }

    public void setUser_role(boolean user_role) {
        this.user_role = user_role;
    }
}
