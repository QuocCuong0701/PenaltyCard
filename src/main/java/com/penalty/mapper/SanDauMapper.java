package com.penalty.mapper;

import com.penalty.model.SanDau;

import java.sql.ResultSet;
import java.sql.SQLException;

public class SanDauMapper implements RowMapper<SanDau> {
    @Override
    public SanDau mapRow(ResultSet rs) {
        try {
            SanDau sanDau = new SanDau();
            sanDau.setId(rs.getInt("id"));
            sanDau.setMaSan(rs.getString("ma_san"));
            sanDau.setTenSan(rs.getString("ten_san"));
            sanDau.setDiaChi(rs.getString("dia_chi"));
            return sanDau;
        } catch (SQLException e) {
            return null;
        }
    }
}
