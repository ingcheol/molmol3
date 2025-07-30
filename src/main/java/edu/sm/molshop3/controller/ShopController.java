package edu.sm.molshop3.controller;

import edu.sm.molshop3.dto.Product;
import edu.sm.molshop3.service.ProductService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
@RequiredArgsConstructor
public class ShopController {

    private final ProductService productService;

    @GetMapping("/shop/top")
    public String top(Model model) {
        model.addAttribute("plist", productService.getByCategory("C001"));
        return "shop/top";
    }

    @GetMapping("/shop/bottom")
    public String bottom(Model model) {
        model.addAttribute("plist", productService.getByCategory("C002"));
        return "shop/bottom";
    }

    @GetMapping("/shop/hat")
    public String hat(Model model) {
        model.addAttribute("plist", productService.getByCategory("C003"));
        return "shop/hat";
    }

    @GetMapping("/shop/shoes")
    public String shoes(Model model) {
        model.addAttribute("plist", productService.getByCategory("C005"));
        return "shop/shoes";
    }

    @GetMapping("/shop/bag")
    public String bag(Model model) {
        model.addAttribute("plist", productService.getByCategory("C004"));
        return "shop/bag";
    }

    @GetMapping("/shop/accessory")
    public String accessory(Model model) {
        model.addAttribute("plist", productService.getByCategory("C006"));
        return "shop/accessory";
    }
}

