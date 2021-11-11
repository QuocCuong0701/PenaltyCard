package com.penalty.mapper;

import com.penalty.model.BillModel;

import java.sql.ResultSet;
import java.sql.SQLException;

public class BillMapper implements RowMapper<BillModel> {
    @Override
    public BillModel mapRow(ResultSet rs) {
        try {
            BillModel billModel = new BillModel();
            billModel.setBill_id(rs.getInt("bill_id"));
            billModel.setUser_id(rs.getInt("user_id"));
            billModel.setFull_name(rs.getString("full_name"));
            billModel.setAddress(rs.getString("address"));
            billModel.setEmail(rs.getString("email"));
            billModel.setPhone(rs.getString("phone"));
            billModel.setTotal(rs.getDouble("total"));
            billModel.setNote(rs.getString("note"));
            billModel.setConfirmed(rs.getBoolean("confirmed"));
            billModel.setCreated_date(rs.getTimestamp("created_date"));
            billModel.setUpdated_date(rs.getTimestamp("updated_date"));

            return billModel;
        } catch (SQLException e) {
            return null;
        }
    }
}
