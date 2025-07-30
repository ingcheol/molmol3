
// ✅ ProductController.java - /shop 관련 매핑 모두 제거 (중복 방지)
package edu.sm.molshop3.controller;

import edu.sm.molshop3.service.ProductService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;

@Controller
@RequiredArgsConstructor
public class ProductController {

    private final ProductService productService;

    // ※ /shop 경로 관련 매핑은 ShopController에서 전담하므로 여기선 제외합니다.
    // 상품 상세, 등록 등은 여기에 구현해도 됨

}
