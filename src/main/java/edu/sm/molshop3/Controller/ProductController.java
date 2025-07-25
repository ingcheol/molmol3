package edu.sm.molshop3.Controller;

import edu.sm.molshop3.Service.ProductService;
import edu.sm.molshop3.dto.ProductDto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class ProductController {

    @Autowired
    ProductService productService;

    @GetMapping("/product")
    public String productPage(@RequestParam(required = false) String id, Model model) {
        if (id == null) {
            return "redirect:/"; // 또는 error.jsp
        }

        ProductDto p = productService.getProductById(id);
        model.addAttribute("product", p);
        return "product";
    }
}
