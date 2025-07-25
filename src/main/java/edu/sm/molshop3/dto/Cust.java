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
    private String cust_id;
    private String cust_name;
    private String cust_pwd;
    private String address;
    private String phone;
    private Timestamp reg_date;
    private Timestamp update_date;
}
