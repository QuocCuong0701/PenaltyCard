package com.penalty.service.impl;

import com.penalty.dao.ITranDauDoiBongDAO;
import com.penalty.model.TranDauDoiBong;
import com.penalty.service.ITranDauDoiBongService;

import javax.inject.Inject;
import java.util.List;

public class TranDauDoiBongService implements ITranDauDoiBongService {

    @Inject
    private ITranDauDoiBongDAO iTranDauDoiBongDAO;

    @Override
    public List<TranDauDoiBong> findAll() {
        return iTranDauDoiBongDAO.findPenaltyCardsOfAllTeams();
    }

    @Override
    public TranDauDoiBong findOne(int id) {
        return iTranDauDoiBongDAO.findOne(id);
    }

    @Override
    public List<TranDauDoiBong> findOpponentByTranDauId(List<Integer> tranDauIds) {
        List<TranDauDoiBong> listOpponents = iTranDauDoiBongDAO.findOpponentByTranDauId(tranDauIds);

        return listOpponents;
    }
}
