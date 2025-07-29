package edu.sm.molshop3.controller;

import edu.sm.molshop3.dto.Product;
import edu.sm.molshop3.dto.ProductImage;
import edu.sm.molshop3.service.CategoryService;
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
import java.util.List;

@Controller
@RequiredArgsConstructor
@RequestMapping("/admin/product")
public class AdminProductController {

    private final ProductService productService;
    private final ProductImageService productImageService;
    private final CategoryService categoryService;


    @GetMapping("/add")
    public String addForm(Model model) throws Exception {
        model.addAttribute("categories", categoryService.get());
        return "product/add";
    }

    // ✅ 1. 상품 목록
    @GetMapping("/list")
    public String list(Model model) throws Exception {
        model.addAttribute("products", productService.get());
        return "product/list";
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
        Product product = productService.get(productId);
        model.addAttribute("product", product);
        model.addAttribute("categories", categoryService.getAll());

        return "product/edit";
    }



    // ✅ 5. 상품 수정 처리
    @PostMapping("/edit")
    public String edit(@ModelAttribute Product product,
                       @RequestParam(value = "imageFile", required = false) MultipartFile imageFile) throws Exception {

        boolean imageUpdated = false;

        if (imageFile != null && !imageFile.isEmpty()) {
            // 이미지 저장
            String fileName = imageFile.getOriginalFilename();
            Path path = Paths.get("src/main/resources/static/image/pdimage/", fileName);
            Files.createDirectories(path.getParent());
            Files.write(path, imageFile.getBytes());

            // 이미지 객체 생성 후 세팅
            ProductImage newImage = new ProductImage();
            newImage.setProductImgUrl("/image/pdimage/" + fileName);
            newImage.setProductId(product.getProductId());

            product.setImages(List.of(newImage));
            imageUpdated = true;
        }

        productService.modify(product, imageUpdated);  // 이미지 수정 여부 전달
        return "redirect:/admin/product/list";
    }



    // ✅ 6. 상품 삭제
    @PostMapping("/delete")
    public String delete(@RequestParam("productId") int productId) throws Exception {
        productService.remove(productId);
        return "redirect:/admin/product/list";
    }


}
