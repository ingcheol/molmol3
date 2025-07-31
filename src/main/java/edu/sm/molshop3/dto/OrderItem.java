package edu.sm.molshop3.dto;

import lombok.*;

@Getter
@Setter
@ToString
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class OrderItem {
    private int orderId;
    private int productId;
    private int quantity;
    private int price;
    private String productName;
    private String productImgUrl;

}
