package com.penalty.mapper;

import com.penalty.model.ThongKe;

import java.sql.ResultSet;
import java.sql.SQLException;

public class ThongKeMapper implements RowMapper<ThongKe> {
    @Override
    public ThongKe mapRow(ResultSet rs) {
        try {
            ThongKe thongKe = new ThongKe();
            thongKe.setMaDoi(rs.getString("ma_doi"));
            thongKe.setTenDoi(rs.getString("ten_doi"));
            thongKe.setTenSan(rs.getString("ten_san"));
            thongKe.setSoTheVang(rs.getInt("so_the_vang"));
            thongKe.setSoTheDo(rs.getInt("so_the_do"));
            thongKe.setSoPhaPhamLoi(rs.getInt("so_pha_pham_loi"));
            thongKe.setTenVongDau(rs.getString("ten_vong_dau"));
            thongKe.setNgay(rs.getString("ngay"));
            thongKe.setGio(rs.getString("gio"));
            return thongKe;
        } catch (SQLException e) {
            return null;
        }
    }
}
