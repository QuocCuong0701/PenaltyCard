package com.penalty.service;

import com.penalty.model.BillModel;
import com.penalty.paging.Pageble;

import java.sql.Timestamp;
import java.util.List;

public interface IBillService {
    List<BillModel> findAll(Pageble pageble);

    List<BillModel> findAll();

    BillModel save(BillModel billModel);

    BillModel update(int bill_id);

    void delete(int[] ids);

    BillModel findOne(int bill_id);

    BillModel findOneByIdAndDate(int user_id, Timestamp created_date);

    BillModel findOneByDate(Timestamp created_date);

    List<BillModel> findAllByUserId(int user_id, boolean confirmed);

    int getTotalItem();
}
