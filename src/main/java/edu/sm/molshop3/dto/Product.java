package edu.sm.molshop3.dto;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

import java.sql.Timestamp;
import java.util.List;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class Product {
    private int productId;
    private String productName;
    private int productPrice;
    private String cateId;
    private String image; // ← 이게 있어야 함
    private String imageUrl;

    // 추가 필드
    private String cateName;                    // 카테고리명
    private Timestamp regDate;
    private Timestamp updateDate;

    private List<ProductImage> images;          // 이미지 리스트 (JOIN or 수동 삽입)
}
