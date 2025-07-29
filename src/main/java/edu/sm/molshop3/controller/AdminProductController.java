package edu.sm.molshop3.controller;

import edu.sm.molshop3.dto.Product;
import edu.sm.molshop3.dto.ProductImage;
import edu.sm.molshop3.service.ProductImageService;
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
    private final ProductImageService productImageService;

    // ✅ 1. 상품 목록
    @GetMapping("/list")
    public String list(Model model) throws Exception {
        model.addAttribute("products", productService.get());
        return "product/list";
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

        // 1. 상품 DB 저장
        productService.register(product);  // 등록 후 productId 자동 생성됨

        // 2. 이미지 저장
        String fileName = imageFile.getOriginalFilename();
        Path path = Paths.get("src/main/resources/static/image/pdimage/", fileName); // ✅ 수정된 저장 경로
        Files.createDirectories(path.getParent()); // 폴더 없으면 생성
        Files.write(path, imageFile.getBytes());

        // 3. 이미지 DB 등록
        ProductImage newImage = new ProductImage();
        newImage.setProductImgUrl("/image/pdimage/" + fileName);  // ✅ 웹 접근 경로
        newImage.setProductId(product.getProductId());
        productImageService.register(newImage);

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
    public String edit(@ModelAttribute Product product,
                       @RequestParam(value = "imageFile", required = false) MultipartFile imageFile) throws Exception {

        // 1. 상품 정보 업데이트
        productService.modify(product);

        // 2. 이미지 새로 업로드 시 처리
        if (imageFile != null && !imageFile.isEmpty()) {
            String fileName = imageFile.getOriginalFilename();
            Path path = Paths.get("src/main/resources/static/image/pdimage/", fileName); // ✅ 수정된 저장 경로
            Files.createDirectories(path.getParent()); // 폴더 없으면 생성
            Files.write(path, imageFile.getBytes());

            ProductImage newImage = new ProductImage();
            newImage.setProductImgUrl("/image/pdimage/" + fileName);  // ✅ 웹 접근 경로
            newImage.setProductId(product.getProductId());
            productImageService.register(newImage);
        }

        return "redirect:/admin/product/list";
    }

    // ✅ 6. 상품 삭제
    @GetMapping("/delete")
    public String delete(@RequestParam("productId") int productId) throws Exception {
        productService.remove(productId); // 연관 이미지도 같이 삭제
        return "redirect:/admin/product/list";
    }
}