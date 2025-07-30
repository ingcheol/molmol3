package edu.sm.molshop3.repository;

import edu.sm.molshop3.dto.Payment;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

@Mapper
public interface PaymentRepository {

    // 결제 등록
    void insert(Payment payment);

    // 결제 단건 조회 (payment_id 기준)
    Payment select(int paymentId);

    // 특정 주문의 결제 정보 조회
    Payment selectByOrderId(@Param("orderId") int orderId);
}
