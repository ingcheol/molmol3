package edu.sm.molshop3.repository;

import edu.sm.molshop3.dto.Order;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface OrderRepository {
    void insert(Order order); // 주문 저장
    Order select(int orderId); // 주문 1건
    List<Order> selectByCustId(String custId); // 회원의 주문 전체

}
