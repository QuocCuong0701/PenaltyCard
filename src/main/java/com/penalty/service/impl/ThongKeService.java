package com.penalty.service.impl;

import com.penalty.dao.IThongKeDAO;
import com.penalty.model.ThongKe;
import com.penalty.service.IThongKeService;

import javax.inject.Inject;
import java.util.List;

public class ThongKeService implements IThongKeService {

    @Inject
    private IThongKeDAO iThongKeDAO;

    @Override
    public List<ThongKe> findAllByDoiBongId(int doiBongId) {
        return iThongKeDAO.findAllPenaltyCardsByDoiBongId(doiBongId);
    }
}
