package edu.sm.molshop3.service;

import edu.sm.molshop3.dto.Cart;
import edu.sm.molshop3.repository.CartRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class CartServiceImpl implements CartService {

    final CartRepository cartRepository;

    @Override
    public void register(Cart cart) throws Exception {
        cartRepository.insert(cart);
    }

    @Override
    public void updateQuantity(int cartId, int quantity) throws Exception {
        cartRepository.updateQuantity(cartId, quantity);
    }

    @Override
    public void delete(int cartId) throws Exception {
        cartRepository.delete(cartId);
    }

    @Override
    public List<Cart> findByCustId(String custId) throws Exception {
        return cartRepository.findByCustId(custId);
    }
}
