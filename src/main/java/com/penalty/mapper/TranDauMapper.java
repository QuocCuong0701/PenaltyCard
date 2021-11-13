package com.penalty.mapper;

import com.penalty.model.TranDau;

import java.sql.ResultSet;
import java.sql.SQLException;

public class TranDauMapper implements RowMapper<TranDau> {
    @Override
    public TranDau mapRow(ResultSet rs) {
        try {
            TranDau tranDau = new TranDau();
            tranDau.setId(rs.getInt("id"));
            tranDau.setVongDauId(rs.getInt("vong_dau_id"));
            tranDau.setSanDauId(rs.getInt("san_dau_id"));
            tranDau.setNgay(rs.getString("ngay"));
            tranDau.setGio(rs.getString("gio"));
            tranDau.setListIdTrongTai(rs.getString("danh_sach_trong_tai"));
            tranDau.setListIdDoiBong(rs.getString("danh_sach_doi_bong"));
            return tranDau;
        } catch (SQLException e) {
            return null;
        }
    }
}
