package edu.sm.molshop3.dto;

import lombok.*;
import java.sql.Timestamp;

@AllArgsConstructor
@NoArgsConstructor
@ToString
@Getter
@Setter
@Builder
public class Cust {
    private String custPhone;
    private String custId;
    private String custPwd;
    private String custName;
    private String address;
    private Timestamp custRegdate;
    private Timestamp custUpdate;
}
