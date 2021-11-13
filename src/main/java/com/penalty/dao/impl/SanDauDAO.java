package com.penalty.dao.impl;

import com.penalty.dao.ISanDauDAO;
import com.penalty.mapper.SanDauMapper;
import com.penalty.model.SanDau;

import java.util.List;

public class SanDauDAO extends AbstractDAO<SanDau> implements ISanDauDAO {

    @Override
    public List<SanDau> findAll() {
        String sql = "SELECT * FROM san_dau";
        return query(sql, new SanDauMapper());
    }
}
