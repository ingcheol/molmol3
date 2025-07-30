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

    /**
     * 🧾 결제 전체 처리 흐름 (사용 안 할 수도 있음)
     */
    @Transactional
    public void processOrder(String custId, String paymentMethod) {
        Order order = new Order();
        order.setCustId(custId);
        orderRepository.insert(order); // order_id 생성

        List<Cart> carts = cartRepository.findByCustId(custId);
        for (Cart cart : carts) {
            OrderItem orderItem = new OrderItem();
            orderItem.setOrderId(order.getOrderId());
            orderItem.setProductId(cart.getProductId());
            orderItem.setQuantity(cart.getProductQt());
            orderItem.setPrice(cart.getProductPrice() * cart.getProductQt());

            // 💥 중복 방지용 delete 추가
            orderItemRepository.delete(orderItem);

            orderItemRepository.insert(orderItem);
        }

        Payment payment = new Payment();
        payment.setOrderId(order.getOrderId());
        payment.setPaymentMethod(paymentMethod);
        payment.setPaymentStatus("완료");
        paymentRepository.insert(payment);

        cartRepository.deleteByCustId(custId); // 장바구니 비우기
    }

    @Transactional
    public int placeOrder(Order order, List<Cart> cartList) {
        orderRepository.insert(order); // orderId 자동 생성됨

        for (Cart cart : cartList) {
            OrderItem item = new OrderItem();
            item.setOrderId(order.getOrderId());
            item.setProductId(cart.getProductId());
            item.setQuantity(cart.getProductQt());
            item.setPrice(cart.getProductPrice() * cart.getProductQt());

            // 💥 중복 방지용 delete 추가
            orderItemRepository.delete(item);

            orderItemRepository.insert(item);
        }

        return order.getOrderId();
    }
    public List<Order> getOrdersByCustId(String custId) {
        List<Order> orders = orderRepository.selectByCustId(custId); // 주문 목록 가져오기

        for (Order order : orders) {
            List<OrderItem> orderItems = orderItemRepository.selectByOrderId(order.getOrderId());
            order.setOrderItems(orderItems); // 주문에 해당하는 아이템 리스트 세팅
        }

        return orders;
    }


}
