package edu.sm.molshop3.dto;

import lombok.Data;

import java.sql.Date;

@Data
public class Review {
    private int reviewId;
    private Date regDate;
    private int score;
    private String content;
    private String custId;
    private int orderId;
    private int productId;
}
