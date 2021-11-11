package com.penalty.dao.impl;

import com.penalty.dao.ICategoryDAO;
import com.penalty.mapper.CategoryMapper;
import com.penalty.model.CategoryModel;

import java.util.List;

public class CategoryDAO extends AbstractDAO<CategoryModel> implements ICategoryDAO {
    @Override
    public List<CategoryModel> findAll() {
        String sql = "SELECT * FROM category";
        return query(sql, new CategoryMapper());
    }

    @Override
    public CategoryModel findOne(int category_id) {
        String sql = "SELECT * FROM category WHERE category_id = ?";
        List<CategoryModel> category = query(sql, new CategoryMapper(), category_id);
        return category.isEmpty() ? null : category.get(0);
    }

    @Override
    public List<CategoryModel> findAllLimit4() {
        String sql = "SELECT * FROM category LIMIT 4";
        return query(sql, new CategoryMapper());
    }
}
