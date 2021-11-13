package com.penalty.dao.impl;

import com.penalty.dao.IKetQuaDAO;
import com.penalty.mapper.KetQuaMapper;
import com.penalty.model.KetQua;

import java.util.List;

public class KetQuaDAO extends AbstractDAO<KetQua> implements IKetQuaDAO {
    @Override
    public List<KetQua> findAll() {
        String sql = "SELECT * FROM ket_qua";
        return query(sql, new KetQuaMapper());
    }
}
