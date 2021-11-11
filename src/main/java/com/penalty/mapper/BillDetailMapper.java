package com.penalty.mapper;

import com.penalty.model.BillDetailModel;

import java.sql.ResultSet;
import java.sql.SQLException;

public class BillDetailMapper implements RowMapper<BillDetailModel> {
    @Override
    public BillDetailModel mapRow(ResultSet rs) {
        try {
            BillDetailModel billDetailModel = new BillDetailModel();
            billDetailModel.setBill_detail_id(rs.getInt("bill_detail_id"));
            billDetailModel.setBill_id(rs.getInt("bill_id"));
            billDetailModel.setProduct_id(rs.getInt("product_id"));
            billDetailModel.setProduct_name(rs.getString("product_name"));
            billDetailModel.setProduct_image(rs.getString("product_image"));
            billDetailModel.setProduct_price(rs.getDouble("product_price"));
            billDetailModel.setQuantity(rs.getInt("quantity"));

            return billDetailModel;
        } catch (SQLException e) {
            return null;
        }
    }
}
