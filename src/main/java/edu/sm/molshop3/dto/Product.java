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
    private int productId;         // 상품 ID (PK)
    private String productName;    // 상품명
    private int productPrice;      // 가격
    private String image;          // 이미지 파일명
    private String description;    // 설명
    private String cateId;         // 카테고리 ID (FK)

    // 추가 필드
    private String cateName;       // 조인을 통해 얻은 카테고리 이름 (뷰 용)
    private Timestamp regDate;     // 등록일
    private Timestamp updateDate;  // 수정일
}
