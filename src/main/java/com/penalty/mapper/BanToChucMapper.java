package com.penalty.mapper;

import com.penalty.model.BanToChuc;

import java.sql.ResultSet;
import java.sql.SQLException;

public class BanToChucMapper implements RowMapper<BanToChuc> {
    @Override
    public BanToChuc mapRow(ResultSet rs) {
        try {
            BanToChuc btc = new BanToChuc();
            btc.setId(rs.getInt("id"));
            btc.setMaBanToChuc(rs.getString("ma_ban_to_chuc"));
            btc.setSoDienThoai(rs.getString("so_dien_thoai"));
            btc.setEmail(rs.getString("email"));
            return btc;
        } catch (SQLException e) {
            return null;
        }
    }
}
