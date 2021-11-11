package com.penalty.mapper;

import com.penalty.model.UserModel;

import java.sql.ResultSet;
import java.sql.SQLException;

public class UserMapper implements RowMapper<UserModel> {
    @Override
    public UserModel mapRow(ResultSet rs) {
        try {
            UserModel userModel=new UserModel();
            userModel.setUser_id(rs.getInt("user_id"));
            userModel.setUser_name(rs.getString("user_name"));
            userModel.setUser_full_name(rs.getString("user_full_name"));
            userModel.setUser_email(rs.getString("user_email"));
            userModel.setUser_pass(rs.getString("user_pass"));
            userModel.setUser_role(rs.getBoolean("user_role"));
            userModel.setCreated_date(rs.getTimestamp("created_date"));
            userModel.setUpdated_date(rs.getTimestamp("updated_date"));

            return userModel;
        } catch (SQLException e) {
            return null;
        }
    }
}
