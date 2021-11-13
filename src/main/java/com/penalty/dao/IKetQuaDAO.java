package com.penalty.dao;

import com.penalty.model.KetQua;

import java.util.List;

public interface IKetQuaDAO extends GenericDAO<KetQua> {

    List<KetQua> findAll();
}
