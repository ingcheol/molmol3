package edu.sm.molshop3.Controller;

import edu.sm.molshop3.Service.ProductService;
import edu.sm.molshop3.dto.ProductDto;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
@RequiredArgsConstructor
public class ProductController {

    private final ProductService productService;

    @GetMapping("/product")
    public String productPage(@RequestParam(required = false) String id, Model model) {
        if (id == null) {
            return "redirect:/"; // 또는 에러 페이지로
        }
        ProductDto p = productService.getProductById(id);
        model.addAttribute("product", p);
        return "product";
    }
}
