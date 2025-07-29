package edu.sm.molshop3.dto;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class ProductImage {
    private int productImgId;       // 이미지 PK
    private String productImgUrl;   // 이미지 파일명 또는 경로
    private int productId;          // 상품 ID (FK)
}