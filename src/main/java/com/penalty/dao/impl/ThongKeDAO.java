package com.penalty.dao.impl;

import com.penalty.dao.IThongKeDAO;
import com.penalty.mapper.ThongKeMapper;
import com.penalty.model.ThongKe;

import java.util.List;

public class ThongKeDAO extends AbstractDAO implements IThongKeDAO {

    @Override
    public List<ThongKe> findAllPenaltyCardsByDoiBongId(int doiBongId) {
        String sql = "select db.ma_doi, db.ten_doi, sd.ten_san, tddb.so_the_vang, tddb.so_the_do, tddb.so_pha_pham_loi, vd.ten_vong_dau,td.gio,td.ngay " +
                " from doi_bong db join tran_dau_doi_bong tddb on db.id=tddb.doi_bong_id " +
                " join tran_dau td on td.id=tddb.tran_dau_id join san_dau sd on td.san_dau_id=sd.id " +
                " join vong_dau vd on td.vong_dau_id = vd.id" +
                " where db.id = ? ";
        return query(sql, new ThongKeMapper(), doiBongId);
    }
}
