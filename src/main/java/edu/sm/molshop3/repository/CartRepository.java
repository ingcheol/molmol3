package edu.sm.molshop3.repository;

import edu.sm.molshop3.dto.Cart;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface CartRepository {
    void insert(Cart cart);
    void updateQuantity(int cartId, int quantity);
    void delete(int cartId);
    List<Cart> findByCustId(String custId);

    // 🔹 결제 완료 시 고객 장바구니 비우기
    void deleteByCustId(String custId);
}
