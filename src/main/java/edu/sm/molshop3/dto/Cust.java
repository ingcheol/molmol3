package edu.sm.molshop3.dto;

import lombok.*;
import java.util.Date;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class Cust {
    private String custId;
    private String custName;
    private String custPwd;
    private String address;
    private String custPhone;
    private String custEmail;       // 병합 추가
    private Date custRegdate;
    private Date custUpdate;
}