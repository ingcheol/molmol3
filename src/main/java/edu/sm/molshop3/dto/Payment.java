package edu.sm.molshop3.dto;

import lombok.*;
import java.sql.Timestamp;

@Getter
@Setter
@ToString
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class Payment {
    private int paymentId;
    private String paymentMethod;
    private String paymentStatus;
    private Timestamp paymentDate;
    private int orderId;
}
