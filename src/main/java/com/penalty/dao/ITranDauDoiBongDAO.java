package com.penalty.dao;

import com.penalty.model.TranDauDoiBong;

import java.util.List;

public interface ITranDauDoiBongDAO extends GenericDAO<TranDauDoiBong> {

    List<TranDauDoiBong> findPenaltyCardsOfAllTeams();

    TranDauDoiBong findOne(int id);
}
