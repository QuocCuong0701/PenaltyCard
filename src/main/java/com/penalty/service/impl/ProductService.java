package com.penalty.service.impl;

import com.penalty.dao.IProductDAO;
import com.penalty.model.ProductModel;
import com.penalty.paging.Pageble;
import com.penalty.service.IProductService;

import javax.inject.Inject;
import java.util.List;

public class ProductService implements IProductService {

    @Inject
    private IProductDAO iProductDAO;

    @Override
    public List<ProductModel> findByCategory(Pageble pageble, int category_id) {
        return iProductDAO.findByCategory(pageble, category_id);
    }

    @Override
    public ProductModel save(ProductModel productModel) {
        int productId = iProductDAO.save(productModel);
        return iProductDAO.findOne(productId);
    }

    @Override
    public ProductModel update(ProductModel productModel) {
        return iProductDAO.findOne(productModel.getProduct_id());
    }

    @Override
    public void updateView(ProductModel productModel) {
        iProductDAO.updateView(productModel);
        iProductDAO.findOne(productModel.getProduct_id());
    }

    @Override
    public void updateBuy(ProductModel productModel) {
        iProductDAO.updateBuy(productModel);
    }

    @Override
    public void delete(int[] ids) {
        for (int id : ids) {
            iProductDAO.delete(id);
        }
    }

    @Override
    public ProductModel findOne(int product_id) {
        return iProductDAO.findOne(product_id);
    }

    @Override
    public List<ProductModel> findAll(Pageble pageble) {
        return iProductDAO.findAll(pageble);
    }

    @Override
    public List<ProductModel> findByCategoryAndName(Pageble pageble, String categoryName, String productName) {
        return iProductDAO.findByCategoryAndName(pageble, categoryName, productName);
    }

    @Override
    public List<ProductModel> findAll() {
        return iProductDAO.findAll();
    }

    @Override
    public List<ProductModel> twoLatestProduct(String sortBy, int limit) {
        return iProductDAO.twoLatestProduct(sortBy, limit);
    }

    @Override
    public List<ProductModel> listProduct(int category, int limit) {
        return iProductDAO.listProduct(category, limit);
    }

    @Override
    public int getTotalItem() {
        return iProductDAO.getTotalItem();
    }

    @Override
    public ProductModel findOneByProductId(int product_id) {
        return iProductDAO.findOneByProductId(product_id);
    }
}
