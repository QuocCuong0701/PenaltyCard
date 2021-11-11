package com.penalty.dao.impl;

import com.penalty.dao.IProductDAO;
import com.penalty.mapper.ProductMapper;
import com.penalty.model.ProductModel;
import com.penalty.paging.Pageble;
import org.apache.commons.lang.StringUtils;

import java.util.List;

public class ProductDAO extends AbstractDAO<ProductModel> implements IProductDAO {
    @Override
    public List<ProductModel> findByCategory(Pageble pageble, int category_id) {
        StringBuilder sql = new StringBuilder("SELECT * FROM product WHERE category_id = ?");
        if (pageble.getOffset() != null && pageble.getLimit() != null) {
            sql.append(" LIMIT " + pageble.getOffset() + ", " + pageble.getLimit() + "");
        }
        return query(sql.toString(), new ProductMapper(), category_id);
    }

    @Override
    public int save(ProductModel productModel) {
        StringBuilder sql = new StringBuilder("INSERT INTO product (product_name, product_image, ");
        sql.append("product_price, product_description, product_detail, created_date, category_id)");
        sql.append(" VALUES (?,?,?,?,?,?,?)");
        return insert(sql.toString(), productModel.getProduct_name(), productModel.getProduct_image(),
                productModel.getProduct_price(), productModel.getProduct_description(),
                productModel.getProduct_detail(), productModel.getCreated_date(), productModel.getCategory_id());
    }

    @Override
    public void update(ProductModel productModel) {
        StringBuilder sql = new StringBuilder("UPDATE product SET product_name = ?, ");
        sql.append("product_image = ?, product_price = ?, product_description = ?, ");
        sql.append("product_detail = ?, updated_date = ? , category_id = ? WHERE product_id = ?");
        update(sql.toString(), productModel.getProduct_name(), productModel.getProduct_image(),
                productModel.getProduct_price(), productModel.getProduct_description(),
                productModel.getProduct_detail(), productModel.getUpdated_date(), productModel.getCategory_id(), productModel.getProduct_id());
    }

    @Override
    public void updateView(ProductModel productModel) {
        String sql = "UPDATE product SET view = ? WHERE product_id = ?";
        update(sql, productModel.getView() + 1, productModel.getProduct_id());
    }

    @Override
    public void updateBuy(ProductModel productModel) {
        String sql = "UPDATE product SET buy = ? WHERE product_id = ?";
        update(sql, productModel.getBuy() + 1, productModel.getProduct_id());
    }

    @Override
    public void delete(int product_id) {
        String sql = "DELETE FROM product WHERE product_id = ?";
        update(sql, product_id);
    }

    @Override
    public ProductModel findOne(int product_id) {
        String sql = "SELECT * FROM product WHERE product_id = ?";
        List<ProductModel> productModels = query(sql, new ProductMapper(), product_id);
        return productModels.isEmpty() ? null : productModels.get(0);
    }

    @Override
    public List<ProductModel> findAll(Pageble pageble) {
        StringBuilder sql = new StringBuilder("SELECT * FROM product");
        if (pageble.getSorter() != null && StringUtils.isNotBlank(pageble.getSorter().getSortName()) && StringUtils.isNotBlank(pageble.getSorter().getSortBy())) {
            sql.append(" ORDER BY " + pageble.getSorter().getSortName() + " " + pageble.getSorter().getSortBy() + "");
        }
        if (pageble.getOffset() != null && pageble.getLimit() != null) {
            sql.append(" LIMIT " + pageble.getOffset() + ", " + pageble.getLimit() + "");
        }
        return query(sql.toString(), new ProductMapper());
    }

    @Override
    public List<ProductModel> findByCategoryAndName(Pageble pageble, String categoryName, String productName) {
        StringBuilder sql = new StringBuilder("SELECT * FROM product AS p JOIN category AS c ON p.category_id = c.category_id");
        sql.append(" WHERE p.product_name LIKE '%" + productName + "%' AND c.category_name LIKE '%" + categoryName + "%'");
        if (pageble.getSorter() != null && StringUtils.isNotBlank(pageble.getSorter().getSortName()) && StringUtils.isNotBlank(pageble.getSorter().getSortBy())) {
            sql.append(" ORDER BY " + pageble.getSorter().getSortName() + " " + pageble.getSorter().getSortBy() + "");
        }
        if (pageble.getOffset() != null && pageble.getLimit() != null) {
            sql.append(" LIMIT " + pageble.getOffset() + ", " + pageble.getLimit() + "");
        }
        return query(sql.toString(), new ProductMapper());
    }

    @Override
    public List<ProductModel> findAll() {
        String sql = "SELECT * FROM product";
        return query(sql, new ProductMapper());
    }

    @Override
    public List<ProductModel> twoLatestProduct(String sortBy, int limit) {
        String sql = "SELECT * FROM product ORDER BY " + sortBy + " desc LIMIT " + limit;
        return query(sql, new ProductMapper());
    }

    @Override
    public List<ProductModel> listProduct(int category, int limit) {
        String sql = "SELECT * FROM product WHERE category_id = " + category + " LIMIT " + limit;
        return query(sql, new ProductMapper());
    }

    @Override
    public int getTotalItem() {
        String sql = "SELECT count(*) FROM product";
        return count(sql);
    }

    @Override
    public ProductModel findOneByProductId(int product_id) {
        String sql = "SELECT * FROM product WHERE product_id = ?";
        List<ProductModel> productModels = query(sql, new ProductMapper(), product_id);
        return productModels.isEmpty() ? null : productModels.get(0);
    }
}
