package com.penalty.dao;

import com.penalty.model.ThongKe;

import java.util.List;

public interface IThongKeDAO extends GenericDAO {

    List<ThongKe> findAllPenaltyCardsByDoiBongId(int doiBongId);

}
