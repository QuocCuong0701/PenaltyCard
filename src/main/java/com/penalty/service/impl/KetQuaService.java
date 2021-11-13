package com.penalty.service.impl;

import com.penalty.dao.IKetQuaDAO;
import com.penalty.model.KetQua;
import com.penalty.service.IKetQuaService;

import javax.inject.Inject;
import java.util.List;

public class KetQuaService implements IKetQuaService {

    @Inject
    private IKetQuaDAO iKetQuaDAO;

    @Override
    public List<KetQua> findAll() {
        return iKetQuaDAO.findAll();
    }
}
