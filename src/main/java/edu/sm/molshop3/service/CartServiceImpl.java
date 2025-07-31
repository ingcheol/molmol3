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

    // 🔹 checkout 기능 구현
    @Override
    public void checkout(String custId) throws Exception {
        cartRepository.deleteByCustId(custId);
    }

    @Override
    public void addCart(String custId, int productId, int quantity) throws Exception {
        Cart cart = cartRepository.findByCustIdAndProductId(custId, productId);
        if (cart != null) {
            cartRepository.updateQuantity(cart.getCartId(), cart.getProductQt() + quantity);
        } else {
            Cart newCart = new Cart();
            newCart.setCustId(custId);
            newCart.setProductId(productId);
            newCart.setProductQt(quantity);
            cartRepository.insert(newCart);
        }
    }

}
