package com.penalty.mapper;

import com.penalty.model.TranDauDoiBong;

import java.sql.ResultSet;
import java.sql.SQLException;

public class TranDauDoiBongMapper implements RowMapper<TranDauDoiBong> {
    @Override
    public TranDauDoiBong mapRow(ResultSet rs) {
        try {
            TranDauDoiBong tddb = new TranDauDoiBong();
            tddb.setId(rs.getInt("id"));
            tddb.setTranDauId(rs.getInt("tran_dau_id"));
            tddb.setDoiBongId(rs.getInt("doi_bong_id"));
            tddb.setGhiChu(rs.getString("ghi_chu"));
            tddb.setSoTheVang(rs.getInt("so_the_vang"));
            tddb.setSoTheDo(rs.getInt("so_the_do"));
            tddb.setSoPhaPhamLoi(rs.getInt("so_pha_pham_loi"));
            tddb.setMaDoi(rs.getString("ma_doi"));
            tddb.setTenDoi(rs.getString("ten_doi"));
            return tddb;
        } catch (SQLException e) {
            return null;
        }
    }
}
