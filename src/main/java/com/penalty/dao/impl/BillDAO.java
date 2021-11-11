package com.penalty.dao.impl;

import com.penalty.dao.IBillDAO;
import com.penalty.mapper.BillMapper;
import com.penalty.model.BillModel;
import com.penalty.paging.Pageble;
import org.apache.commons.lang.StringUtils;

import java.sql.Timestamp;
import java.util.List;

public class BillDAO extends AbstractDAO<BillModel> implements IBillDAO {

    @Override
    public List<BillModel> findAll(Pageble pageble) {
        StringBuilder sql = new StringBuilder("SELECT * FROM bill");
        if (pageble.getSorter() != null && StringUtils.isNotBlank(pageble.getSorter().getSortName()) && StringUtils.isNotBlank(pageble.getSorter().getSortBy())) {
            sql.append(" ORDER BY " + pageble.getSorter().getSortName() + " " + pageble.getSorter().getSortBy() + "");
        }
        if (pageble.getOffset() != null && pageble.getLimit() != null) {
            sql.append(" LIMIT " + pageble.getOffset() + ", " + pageble.getLimit() + "");
        }
        return query(sql.toString(), new BillMapper());
    }

    @Override
    public List<BillModel> findAll() {
        String sql = "SELECT * FROM bill";
        return query(sql, new BillMapper());
    }

    @Override
    public int save(BillModel billModel) {
        StringBuilder sql = new StringBuilder("INSERT INTO bill");
        if (billModel.getUser_id() != 0) {
            sql.append("(user_id, full_name, address, email, phone, total, created_date, confirmed) VALUES (?,?,?,?,?,?,?,?)");
            return insert(sql.toString(), billModel.getUser_id(), billModel.getFull_name(), billModel.getAddress(),
                    billModel.getEmail(), billModel.getPhone(), billModel.getTotal(), billModel.getCreated_date(), 1);
        } else {
            sql.append("(full_name, address, email, phone, total, created_date, confirmed) VALUES (?,?,?,?,?,?,?)");
            return insert(sql.toString(), billModel.getFull_name(), billModel.getAddress(),
                    billModel.getEmail(), billModel.getPhone(), billModel.getTotal(), billModel.getCreated_date(), 1);
        }
    }

    @Override
    public void update(int bill_id) {
        String sql = "UPDATE bill SET confirmed = ? WHERE bill_id = ?";
        update(sql, 1, bill_id);
    }

    @Override
    public void delete(int bill_id) {
        String sql = "DELETE FROM bill WHERE bill_id = ?";
        update(sql, bill_id);
    }

    @Override
    public BillModel findOne(int bill_id) {
        String sql = "SELECT * FROM bill WHERE bill_id = ?";
        List<BillModel> billModels = query(sql, new BillMapper(), bill_id);
        return billModels.isEmpty() ? null : billModels.get(0);
    }

    @Override
    public BillModel findOneByIdAndDate(int user_id, Timestamp created_date) {
        String sql = "SELECT * FROM bill WHERE user_id = ? AND created_date = ?";
        List<BillModel> billModels = query(sql, new BillMapper(), user_id, created_date);
        return billModels.isEmpty() ? null : billModels.get(0);
    }

    @Override
    public BillModel findOneByDate(Timestamp created_date) {
        String sql = "SELECT * FROM bill WHERE created_date = ?";
        List<BillModel> billModels = query(sql, new BillMapper(), created_date);
        return billModels.isEmpty() ? null : billModels.get(0);
    }

    @Override
    public List<BillModel> findAllByUserId(int user_id, boolean confirmed) {
        String sql = "SELECT * FROM bill WHERE user_id = ? AND confirmed = ?";
        if (confirmed){
            return query(sql, new BillMapper(), user_id, 1);
        } else{
            return query(sql, new BillMapper(), user_id, 0);
        }
    }

    @Override
    public int getTotalItem() {
        String sql = "SELECT count(*) FROM bill";
        return count(sql);
    }
}
