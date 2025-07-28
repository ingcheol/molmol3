package edu.sm.molshop3.service;

import edu.sm.molshop3.dto.ProductDto;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.Map;

@Service
public class ProductService {

    private static final Map<String, ProductDto> productMap = new HashMap<>();

    static {
        productMap.put("karina1", new ProductDto(
                "karina1",
                "카리나 공항패션 세트",
                "알렉산드라 리치 가디건 / 미우미우 팬츠 / 지방시 토트백",
                "ProductImage/product1.jpg",
                4700000
        ));
        productMap.put("karina2", new ProductDto(
                "karina2",
                "카리나 착장 2",
                "기모 맨투맨 / 데님 팬츠 / 에코백",
                "ProductImage/product2.jpg",
                1980000
        ));
        // 나머지 6개도 같은 방식으로 추가 가능
    }

    public ProductDto getProductById(String id) {
        return productMap.get(id);
    }
}
