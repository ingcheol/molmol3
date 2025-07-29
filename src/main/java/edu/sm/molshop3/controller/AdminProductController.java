package edu.sm.molshop3.controller;

import edu.sm.molshop3.dto.Product;
import edu.sm.molshop3.service.ProductService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;

@Controller
@RequiredArgsConstructor
@RequestMapping("/admin/product")
public class AdminProductController {

    private final ProductService productService;

    // ✅ 1. 상품 목록
    @GetMapping("/list")
    public String list(Model model) throws Exception {
        model.addAttribute("products", productService.get());
        return "product/list"; // 여기만 경로 변경
    }


    // ✅ 2. 상품 등록 폼
    @GetMapping("/add")
    public String addForm() {
        return "product/add";
    }

    // ✅ 3. 상품 등록 처리
    @PostMapping("/add")
    public String add(@ModelAttribute Product product,
                      @RequestParam("imageFile") MultipartFile imageFile) throws Exception {
        // 1. 파일 저장
        String fileName = imageFile.getOriginalFilename();
        Path path = Paths.get("C:/java/molshop3/img/", fileName);
        Files.write(path, imageFile.getBytes());

        // 2. 상품에 이미지 파일명 저장
        product.setImage(fileName);

        // 3. 등록
        productService.register(product);
        return "redirect:/admin/product/list";
    }


    // ✅ 4. 상품 수정 폼
    @GetMapping("/edit")
    public String editForm(@RequestParam("productId") int productId, Model model) throws Exception {
        model.addAttribute("product", productService.get(productId));
        return "product/edit";
    }

    // ✅ 5. 상품 수정 처리
    @PostMapping("/edit")
    public String edit(@ModelAttribute Product product) throws Exception {
        productService.modify(product);
        return "redirect:/product/list";
    }

    // ✅ 6. 상품 삭제
    @GetMapping("/delete")
    public String delete(@RequestParam("productId") int productId) throws Exception {
        productService.remove(productId);
        return "redirect:/product/list";
    }
}
