package com.penalty.mapper;

import com.penalty.model.CauThu;

import java.sql.ResultSet;
import java.sql.SQLException;

public class CauThuMapper implements RowMapper<CauThu> {
    @Override
    public CauThu mapRow(ResultSet rs) {
        try {
            CauThu cauThu = new CauThu();
            cauThu.setId(rs.getInt("id"));
            cauThu.setDoiBongId(rs.getInt("doi_bong_id"));
            cauThu.setMaCauThu(rs.getString("ma_cau_thu"));
            cauThu.setTenCauThu(rs.getString("ten_cau_thu"));
            cauThu.setNamSinh(rs.getInt("nam_sinh"));
            cauThu.setViTri(rs.getString("vi_tri"));
            cauThu.setChanThuan(rs.getString("chan_thuan"));
            cauThu.setChieuCao(rs.getInt("chieu_cao"));
            cauThu.setCanNang(rs.getInt("can_nang"));
            cauThu.setDacDiem(rs.getString("dac_diem"));
            return cauThu;
        } catch (SQLException e) {
            return null;
        }
    }
}
