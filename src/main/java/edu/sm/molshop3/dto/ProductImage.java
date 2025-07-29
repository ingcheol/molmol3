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
public class Item {
    private String id;     // 구성품 ID
    private String name;   // 구성품 이름
    private String desc;   // 구성품 설명
    private int price;     // 구성품 가격
}
