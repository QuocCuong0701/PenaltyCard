package com.penalty.service.impl;

import com.penalty.dao.ISanDauDAO;
import com.penalty.model.SanDau;
import com.penalty.service.ISanDauService;

import javax.inject.Inject;
import java.util.List;

public class SanDauService implements ISanDauService {

    @Inject
    private ISanDauDAO iSanDauDAO;

    @Override
    public List<SanDau> findAll() {
        return iSanDauDAO.findAll();
    }
}
