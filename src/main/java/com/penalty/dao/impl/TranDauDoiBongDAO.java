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
                " from tran_dau_doi_bong tddb join doi_bong db on tddb.doi_bong_id = db.id group by db.id " +
                " order by so_the_do desc, so_the_vang desc, so_pha_pham_loi desc ";
        return query(sql, new TranDauDoiBongMapper());
    }

    @Override
    public TranDauDoiBong findOne(int id) {
        String sql = " select tddb.id, tddb.tran_dau_id, tddb.doi_bong_id, db.ma_doi, db.ten_doi, tddb.ghi_chu, " +
                " tddb.so_the_vang, tddb.so_the_do, tddb.so_pha_pham_loi " +
                " from tran_dau_doi_bong tddb join doi_bong db on tddb.doi_bong_id=db.id where db.id = ? " +
                " order by so_the_do desc, so_the_vang desc, so_pha_pham_loi desc ";
        List<TranDauDoiBong> tranDauDoiBongs = query(sql, new TranDauDoiBongMapper(), id);
        return tranDauDoiBongs.isEmpty() ? null : tranDauDoiBongs.get(0);
    }

    @Override
    public List<TranDauDoiBong> findOpponentByTranDauId(List<Integer> tranDauIds) {
        StringBuilder str = new StringBuilder();
        for (Integer id : tranDauIds) {
            str.append(id).append(",");
        }
        String ids = str.substring(0, str.length() - 1);
        String sql = " select tddb.id, tddb.tran_dau_id, tddb.doi_bong_id, db.ma_doi, db.ten_doi, tddb.ghi_chu," +
                " tddb.so_the_vang, tddb.so_the_do, tddb.so_pha_pham_loi " +
                " from tran_dau td join tran_dau_doi_bong tddb on td.id = tddb.tran_dau_id " +
                " join doi_bong db on db.id = tddb.doi_bong_id " +
                " where td.id in ( " + ids +" ) " +
                " order by so_the_do desc, so_the_vang desc, so_pha_pham_loi desc ";
        return query(sql, new TranDauDoiBongMapper(), ids);
    }
}
