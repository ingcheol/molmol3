package edu.sm.molshop3.service;

import edu.sm.molshop3.dto.Cart;
import edu.sm.molshop3.dto.Order;
import edu.sm.molshop3.dto.OrderItem;
import edu.sm.molshop3.dto.Payment;
import edu.sm.molshop3.repository.CartRepository;
import edu.sm.molshop3.repository.OrderItemRepository;
import edu.sm.molshop3.repository.OrderRepository;
import edu.sm.molshop3.repository.PaymentRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@RequiredArgsConstructor
public class OrderService {

    private final OrderRepository orderRepository;
    private final OrderItemRepository orderItemRepository;
    private final PaymentRepository paymentRepository;
    private final CartRepository cartRepository;

    @Transactional
    public void processOrder(String custId, String paymentMethod) {
        Order order = new Order();
        order.setCustId(custId);
        orderRepository.insert(order);

        List<Cart> carts = cartRepository.findByCustId(custId);
        for (Cart cart : carts) {
            OrderItem item = OrderItem.builder()
                    .orderId(order.getOrderId())
                    .productId(cart.getProductId())
                    .quantity(cart.getProductQt())
                    .price(cart.getProductPrice() * cart.getProductQt())
                    .build();

            orderItemRepository.delete(item);
            orderItemRepository.insert(item);
        }

        Payment payment = Payment.builder()
                .orderId(order.getOrderId())
                .paymentMethod(paymentMethod)
                .paymentStatus("완료")
                .build();
        paymentRepository.insert(payment);

        cartRepository.deleteByCustId(custId);
    }

    @Transactional
    public int placeOrder(Order order, List<Cart> cartList) {
        orderRepository.insert(order);
        for (Cart cart : cartList) {
            OrderItem item = OrderItem.builder()
                    .orderId(order.getOrderId())
                    .productId(cart.getProductId())
                    .quantity(cart.getProductQt())
                    .price(cart.getProductPrice() * cart.getProductQt())
                    .build();

            orderItemRepository.delete(item);
            orderItemRepository.insert(item);
        }
        return order.getOrderId();
    }

    // ▶ 리뷰 페이지용 주문 목록 제공
    public List<Order> getOrdersByCustId(String custId) {
        List<Order> orders = orderRepository.selectByCustId(custId);
        for (Order o : orders) {
            List<OrderItem> items = orderItemRepository.selectByOrderId(o.getOrderId());
            o.setOrderItems(items);
        }
        return orders;
    }
}
