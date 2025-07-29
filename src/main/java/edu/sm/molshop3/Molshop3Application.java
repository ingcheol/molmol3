package edu.sm.molshop3;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
@MapperScan(basePackages = "edu.sm.molshop3.repository")
public class Molshop3Application {

    public static void main(String[] args) {
        SpringApplication.run(Molshop3Application.class, args);
    }

}