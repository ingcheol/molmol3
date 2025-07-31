package edu.sm.molshop3.service;

import edu.sm.molshop3.dto.Cart;

import java.util.List;

public interface CartService {
    void register(Cart cart) throws Exception;
    void updateQuantity(int cartId, int quantity) throws Exception;
    void delete(int cartId) throws Exception;
    List<Cart> findByCustId(String custId) throws Exception;
    void checkout(String custId) throws Exception;

    // 🔹 추가
    void addCart(String custId, int productId, int quantity) throws Exception;
}

