package com.penalty.mapper;

import com.penalty.model.KetQua;

import java.sql.ResultSet;
import java.sql.SQLException;

public class KetQuaMapper implements RowMapper<KetQua> {
    @Override
    public KetQua mapRow(ResultSet rs) {
        try {
            KetQua ketQua = new KetQua();
            ketQua.setId(rs.getInt("id"));
            ketQua.setBanToChucId(rs.getInt("ban_to_chuc_id"));
            ketQua.setTranDauId(rs.getInt("tran_dau_id"));
            ketQua.setSoTheVang(rs.getInt("so_the_vang"));
            ketQua.setSoTheDo(rs.getInt("so_the_do"));
            ketQua.setSoBanThang(rs.getInt("so_ban_thang"));
            ketQua.setSoPhaPhamLoi(rs.getInt("so_pha_pham_loi"));
            return ketQua;
        } catch (SQLException e) {
            return null;
        }
    }
}
