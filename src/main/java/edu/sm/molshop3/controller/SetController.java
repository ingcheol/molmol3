package edu.sm.molshop3.controller;

import edu.sm.molshop3.dto.Product;
import edu.sm.molshop3.service.ProductService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.Collections;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/set")
@RequiredArgsConstructor
public class SetController {

    private final ProductService productService;

    // 세트 하드코딩
    private static final Map<String, List<Integer>> SET_MAP = Map.of(
            "seulgi1", List.of(19, 20, 21, 22),
            "karina1", List.of(5, 6, 7),
            "winter1", List.of(34),
            "karina2", List.of(60, 3, 4, 46),
            "seulgi2", List.of(23, 24, 25, 26),
            "winter2", List.of(27, 28, 29, 30),
            "seulgi3", List.of(15, 16, 17, 18),
            "winter3", List.of(35, 36, 37)
    );


    @GetMapping("/getItems")
    public String getSetItems(@RequestParam("setId") String setId, Model model) throws Exception {
        List<Integer> productIds = SET_MAP.getOrDefault(setId, Collections.emptyList());
        List<Product> products = productService.getProductsByIds(productIds);

        model.addAttribute("products", products);
        return "product/setModalContent"; // 모달에 뿌릴 JSP
    }

}
