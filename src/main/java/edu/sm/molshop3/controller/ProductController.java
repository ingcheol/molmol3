package edu.sm.molshop3.controller;

import edu.sm.molshop3.dto.Product;
import edu.sm.molshop3.dto.ProductImage;
import edu.sm.molshop3.dto.Review;
import edu.sm.molshop3.service.ProductImageService;
import edu.sm.molshop3.service.ProductService;
import edu.sm.molshop3.service.ReviewService;
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
    private final ProductImageService productImageService;
    private final ReviewService reviewService;

    @GetMapping("/product/see")
    public String see(@RequestParam(value = "productId", required = false) Integer productId, Model model) throws Exception {
        if (productId == null) {
            return "redirect:/";
        }

        Product p = productService.get(productId);
        List<ProductImage> images = productImageService.getByProductId(productId);
        if (!images.isEmpty()) {
            p.setImage(images.get(0).getProductImgUrl());
            p.setImages(images);
        }

        // 🔥 리뷰 추가
        List<Review> reviews = reviewService.getReviewsByProduct(productId);
        model.addAttribute("product", p);
        model.addAttribute("reviews", reviews);

        return "product/see";
    }
}
