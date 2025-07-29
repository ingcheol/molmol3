package edu.sm.molshop3.controller;

import edu.sm.molshop3.dto.Product;
import edu.sm.molshop3.service.ProductService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
@RequiredArgsConstructor
public class ProductController {

    private final ProductService productService;

    // 예: /product?id=3
    @GetMapping("/product")
    public String productPage(@RequestParam(required = false) Integer id, Model model) {
        if (id == null) {
            return "redirect:/"; // 또는 오류 페이지
        }

        try {
            Product p = productService.get(id);
            model.addAttribute("product", p);
            return "product";
        } catch (Exception e) {
            // 예외 처리 (예: 존재하지 않는 상품 ID)
            return "redirect:/error";
        }
    }

}