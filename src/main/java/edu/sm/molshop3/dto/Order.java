package edu.sm.molshop3.dto;

import lombok.*;
import java.sql.Timestamp;
import java.util.List;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class Order {
    private int orderId;
    private Timestamp orderDate;
    private String custId;
    private List<OrderItem> orderItems;

}

