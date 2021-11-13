package com.penalty.mapper;

import com.penalty.model.DoiBong;

import java.sql.ResultSet;
import java.sql.SQLException;

public class DoiBongMapper implements RowMapper<DoiBong> {
    @Override
    public DoiBong mapRow(ResultSet rs) {
        try {
            DoiBong doiBong = new DoiBong();
            doiBong.setId(rs.getInt("id"));
            doiBong.setMaDoi(rs.getString("ma_doi"));
            doiBong.setTenDoi(rs.getString("ten_doi"));
            doiBong.setTrangPhucTruyenThong(rs.getString("trang_phuc_truyen_thong"));
            doiBong.setMoTa(rs.getString("mo_ta"));
            return doiBong;
        } catch (SQLException e) {
            return null;
        }
    }
}
