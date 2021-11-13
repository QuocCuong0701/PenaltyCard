package com.penalty.mapper;

import com.penalty.model.VongDau;

import java.sql.ResultSet;
import java.sql.SQLException;

public class VongDauMapper implements RowMapper<VongDau> {
    @Override
    public VongDau mapRow(ResultSet rs) {
        try {
            VongDau vongDau = new VongDau();
            vongDau.setId(rs.getInt("id"));
            vongDau.setGiaiDauId(rs.getInt("giai_dau_id"));
            vongDau.setMaVongDau(rs.getString("ma_vong_dau"));
            vongDau.setTenVongDau(rs.getString("ten_vong_dau"));
            return vongDau;
        } catch (SQLException e) {
            return null;
        }
    }
}
