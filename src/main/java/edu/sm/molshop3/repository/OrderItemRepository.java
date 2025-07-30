package edu.sm.molshop3.repository;

import edu.sm.molshop3.dto.OrderItem;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface OrderItemRepository {
    void insert(OrderItem item); // 주문 상세 저장
    void delete(OrderItem item);
    List<OrderItem> selectByOrderId(int orderId);
}
