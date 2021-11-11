package com.penalty.service.impl;

import com.penalty.dao.IBillDAO;
import com.penalty.model.BillModel;
import com.penalty.paging.Pageble;
import com.penalty.service.IBillService;

import javax.inject.Inject;
import java.sql.Timestamp;
import java.util.List;

public class BillService implements IBillService {
    @Inject
    private IBillDAO iBillDAO;

    @Override
    public List<BillModel> findAll(Pageble pageble) {
        return iBillDAO.findAll(pageble);
    }

    @Override
    public List<BillModel> findAll() {
        return iBillDAO.findAll();
    }

    @Override
    public BillModel save(BillModel billModel) {
        int bill_id = iBillDAO.save(billModel);
        return iBillDAO.findOne(bill_id);
    }

    @Override
    public BillModel update(int bill_id) {
        iBillDAO.update(bill_id);
        return iBillDAO.findOne(bill_id);
    }

    @Override
    public void delete(int[] ids) {
        for (int id : ids) {
            iBillDAO.delete(id);
        }
    }

    @Override
    public BillModel findOne(int bill_id) {
        BillModel billModel = iBillDAO.findOne(bill_id);
        return billModel;
    }

    @Override
    public BillModel findOneByIdAndDate(int user_id, Timestamp date) {
        return iBillDAO.findOneByIdAndDate(user_id, date);
    }

    @Override
    public BillModel findOneByDate(Timestamp created_date) {
        return iBillDAO.findOneByDate(created_date);
    }

    @Override
    public List<BillModel> findAllByUserId(int user_id, boolean confirmed) {
        return iBillDAO.findAllByUserId(user_id, confirmed);
    }

    @Override
    public int getTotalItem() {
        return iBillDAO.getTotalItem();
    }
}
