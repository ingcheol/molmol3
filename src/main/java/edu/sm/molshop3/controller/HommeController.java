package edu.sm.molshop3.controller;

import edu.sm.molshop3.dto.Product;
import edu.sm.molshop3.service.ProductService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import java.util.List;

@Controller
@RequiredArgsConstructor
public class HommeController {

    private final ProductService productService;

    @GetMapping("/home/best")
    public String bestPage(Model model) {
        List<Product> list = productService.getBestProducts();  // 🔹 상품 리스트 받아오기
        model.addAttribute("plist", list);                      // 🔹 jsp로 넘기기
        model.addAttribute("center", "home/best");
        return "/home/best"; // 💡 또는 "home/best"도 가능 (사용 구조에 따라)
    }

    @GetMapping("/home/new")
    public String newPage(Model model) {
        model.addAttribute("plist", productService.getNewProducts());  // 신상 상품 6개
        model.addAttribute("center", "home/new");
        return "/home/new";  // 통합 레이아웃 사용하는 경우
    }


}
