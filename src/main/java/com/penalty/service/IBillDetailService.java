package com.penalty.service;

import com.penalty.model.BillDetailModel;

import java.util.List;

public interface IBillDetailService {
    List<BillDetailModel> findBillDetailByBillId(int bill_id);
    List<BillDetailModel> findAll();
    BillDetailModel save(BillDetailModel billDetailModel);
    BillDetailModel findOne(int bill_detail_id);
}
