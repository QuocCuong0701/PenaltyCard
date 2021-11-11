package com.penalty.service;

import com.penalty.model.CartModel;

import java.util.List;

public interface ICartService {
    List<CartModel> findAll();
    CartModel save(CartModel cartModel);
    CartModel update(CartModel cartModel);
    void delete(int cart_id, int[] product_ids);
}
