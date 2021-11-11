package com.penalty.service.impl;

import com.penalty.dao.ICategoryDAO;
import com.penalty.model.CategoryModel;
import com.penalty.service.ICategoryService;

import javax.inject.Inject;
import java.util.List;

public class CategoryService implements ICategoryService {
    @Inject
    private ICategoryDAO iCategoryDAO;

    @Override
    public List<CategoryModel> findAll() {
        return iCategoryDAO.findAll();
    }

    @Override
    public CategoryModel findOne(int category_id) {
        return iCategoryDAO.findOne(category_id);
    }

    @Override
    public List<CategoryModel> findAllLimit4() {
        return iCategoryDAO.findAllLimit4();
    }
}
