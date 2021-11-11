package com.penalty.dao;

import com.penalty.model.ProductModel;
import com.penalty.paging.Pageble;

import java.util.List;

public interface IProductDAO extends GenericDAO<ProductModel> {
    List<ProductModel> findByCategory(Pageble pageble, int category_id);

    int save(ProductModel productModel);

    void update(ProductModel productModel);

    void updateView(ProductModel productModel);

    void updateBuy(ProductModel productModel);

    void delete(int product_id);

    ProductModel findOne(int product_id);

    List<ProductModel> findAll(Pageble pageble);

    List<ProductModel> findByCategoryAndName(Pageble pageble, String categoryName, String productName);

    List<ProductModel> findAll();

    List<ProductModel> twoLatestProduct(String sortBy, int limit);

    List<ProductModel> listProduct(int category, int limit);

    int getTotalItem();

    ProductModel findOneByProductId(int product_id);
}
