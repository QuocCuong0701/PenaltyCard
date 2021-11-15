package com.penalty.service;

import com.penalty.model.TranDauDoiBong;

import java.util.List;

public interface ITranDauDoiBongService {

    List<TranDauDoiBong> findAll();

    TranDauDoiBong findOne(int id);

    List<TranDauDoiBong> findOpponentByTranDauId(List<Integer> tranDauIds);
}
