package com.penalty.dao;

import com.penalty.model.SanDau;

import java.util.List;

public interface ISanDauDAO extends GenericDAO<SanDau> {

    List<SanDau> findAll();
}
