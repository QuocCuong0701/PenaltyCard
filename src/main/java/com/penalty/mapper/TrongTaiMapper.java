package com.penalty.mapper;

import com.penalty.model.TrongTai;

import java.sql.ResultSet;
import java.sql.SQLException;

public class TrongTaiMapper implements RowMapper<TrongTai> {
    @Override
    public TrongTai mapRow(ResultSet rs) {
        try {
            TrongTai trongTai = new TrongTai();
            trongTai.setId(rs.getInt("id"));
            trongTai.setMaTrongTai(rs.getString("ma_trong_tai"));
            trongTai.setTenTrongTai(rs.getString("ten_trong_tai"));
            trongTai.setSoDienThoai(rs.getString("so_dien_thoai"));
            trongTai.setDiaChi(rs.getString("dia_chi"));
            return trongTai;
        } catch (SQLException e) {
            return null;
        }
    }
}
