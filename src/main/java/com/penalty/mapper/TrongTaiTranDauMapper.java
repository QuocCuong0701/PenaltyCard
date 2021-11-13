package com.penalty.mapper;

import com.penalty.model.TrongTaiTranDau;

import java.sql.ResultSet;
import java.sql.SQLException;

public class TrongTaiTranDauMapper implements RowMapper<TrongTaiTranDau> {
    @Override
    public TrongTaiTranDau mapRow(ResultSet rs) {
        try {
            TrongTaiTranDau trongTaiTranDau = new TrongTaiTranDau();
            trongTaiTranDau.setId(rs.getInt("id"));
            trongTaiTranDau.setTranDauId(rs.getInt("tran_dau_id"));
            trongTaiTranDau.setTrongTaiId(rs.getInt("trong_tai_id"));
            trongTaiTranDau.setGhiChu(rs.getString("ghi_chu"));
            trongTaiTranDau.setSoTien(rs.getFloat("so_tien"));
            return trongTaiTranDau;
        } catch (SQLException e) {
            return null;
        }
    }
}
