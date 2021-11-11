package com.penalty.dao;

import com.penalty.model.CategoryModel;

import java.util.List;

public interface ICategoryDAO {
    List<CategoryModel> findAll();
    CategoryModel findOne(int category_id);
    List<CategoryModel> findAllLimit4();
}
