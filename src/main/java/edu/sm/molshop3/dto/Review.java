package edu.sm.molshop3.dto;
import java.sql.Timestamp;

import lombok.Data;

@Data
public class Review {
    private int reviewId;
    private Timestamp regDate;
    private int score;
    private String content;
    private String custId;
    private int orderId;
    private int productId;
}
