package edu.sm.molshop3.controller;

import edu.sm.molshop3.dto.Product;
import edu.sm.molshop3.dto.ProductImage;
import edu.sm.molshop3.service.ProductImageService;
import edu.sm.molshop3.service.ProductService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

@Controller
@RequiredArgsConstructor
public class ProductController {

    private final ProductService productService;
    private final ProductImageService productImageService; // 이미지 서비스 주입

    @GetMapping("/product/see")
    public String see(@RequestParam(value = "productId", required = false) Integer productId, Model model) throws Exception {
        if (productId == null) {
            return "redirect:/";
        }

        Product p = productService.get(productId);

        // 대표 이미지 설정
        List<ProductImage> images = productImageService.getByProductId(productId);
        if (!images.isEmpty()) {
            p.setImage(images.get(0).getProductImgUrl()); // 대표 이미지 URL 세팅
            p.setImages(images); // 이미지 리스트도 필요하면
        }

        model.addAttribute("product", p);
        return "product/see";
    }
}
