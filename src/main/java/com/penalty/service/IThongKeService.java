package com.penalty.service;

import com.penalty.model.ThongKe;

import java.util.List;

public interface IThongKeService {

    List<ThongKe> findAllByDoiBongId(int doiBongId);

}
