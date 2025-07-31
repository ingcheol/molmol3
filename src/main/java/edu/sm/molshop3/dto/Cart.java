package edu.sm.molshop3.dto;

import lombok.Data;

@Data
public class Cart {
    private int cartId;
    private int productQt;
    private String custId;
    private int productId;
    private String prevPage; //추가

    // 조인용
    private String productName;
    private int productPrice;
    private String image;  // ← 상품 이미지 경로
}