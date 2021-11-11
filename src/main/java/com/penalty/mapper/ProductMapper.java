package com.penalty.mapper;

import com.penalty.model.ProductModel;

import java.sql.ResultSet;
import java.sql.SQLException;

public class ProductMapper implements RowMapper<ProductModel> {

    @Override
    public ProductModel mapRow(ResultSet rs) {
        try {
            ProductModel products = new ProductModel();
            products.setProduct_id(rs.getInt("product_id"));
            products.setProduct_name(rs.getString("product_name"));
            products.setProduct_image(rs.getString("product_image"));
            products.setProduct_price(rs.getDouble("product_price"));
            products.setProduct_description(rs.getString("product_description"));
            products.setProduct_detail(rs.getString("product_detail"));
            products.setView(rs.getInt("view"));
            products.setBuy(rs.getInt("buy"));
            products.setCategory_id(rs.getInt("category_id"));
            products.setCreated_date(rs.getTimestamp("created_date"));
            products.setUpdated_date(rs.getTimestamp("updated_date"));

            return products;
        } catch (SQLException e) {
            return null;
        }
    }
}
