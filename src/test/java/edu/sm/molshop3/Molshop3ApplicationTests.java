package edu.sm.molshop3;

import org.junit.jupiter.api.Test;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.test.context.SpringBootTest;

@SpringBootTest
@MapperScan(basePackages = "edu.sm.molshop3.repository")
class Molshop3ApplicationTests {

    @Test
    void contextLoads() {
    }

}
