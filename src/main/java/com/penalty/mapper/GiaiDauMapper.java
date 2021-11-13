package com.penalty.mapper;

import com.penalty.model.GiaiDau;

import java.sql.ResultSet;
import java.sql.SQLException;

public class GiaiDauMapper implements RowMapper<GiaiDau> {
    @Override
    public GiaiDau mapRow(ResultSet rs) {
        try {
            GiaiDau giaiDau = new GiaiDau();
            giaiDau.setId(rs.getInt("id"));
            giaiDau.setMaGiaiDau(rs.getString("ma_giai_dau"));
            giaiDau.setTenGiaiDau(rs.getString("ten_giai_dau"));
            return giaiDau;
        } catch (SQLException e) {
            return null;
        }
    }
}
