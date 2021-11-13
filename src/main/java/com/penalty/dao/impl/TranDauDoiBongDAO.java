package com.penalty.dao.impl;

import com.penalty.dao.ITranDauDoiBongDAO;
import com.penalty.mapper.TranDauDoiBongMapper;
import com.penalty.model.TranDauDoiBong;

import java.util.List;

public class TranDauDoiBongDAO extends AbstractDAO<TranDauDoiBong> implements ITranDauDoiBongDAO {
    @Override
    public List<TranDauDoiBong> findPenaltyCardsOfAllTeams() {
        String sql = " select tddb.id, tddb.tran_dau_id, tddb.doi_bong_id, db.ma_doi, db.ten_doi, tddb.ghi_chu, " +
                " sum(tddb.so_the_vang) so_the_vang, sum(tddb.so_the_do) so_the_do, sum(tddb.so_pha_pham_loi) so_pha_pham_loi " +
                " from tran_dau_doi_bong tddb join doi_bong db on tddb.doi_bong_id = db.id group by db.id ";
        return query(sql, new TranDauDoiBongMapper());
    }

    @Override
    public TranDauDoiBong findOne(int id) {
        String sql = " select tddb.id, tddb.tran_dau_id, tddb.doi_bong_id, db.ma_doi, db.ten_doi, tddb.ghi_chu, " +
                " tddb.so_the_vang, tddb.so_the_do, tddb.so_pha_pham_loi " +
                " from tran_dau_doi_bong tddb join doi_bong db on tddb.doi_bong_id=db.id where db.id = ? ";
        List<TranDauDoiBong> tranDauDoiBongs = query(sql, new TranDauDoiBongMapper(), id);
        return tranDauDoiBongs.isEmpty() ? null : tranDauDoiBongs.get(0);
    }
}
