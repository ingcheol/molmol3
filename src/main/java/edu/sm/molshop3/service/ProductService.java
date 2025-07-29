package edu.sm.molshop3.service;

import edu.sm.molshop3.dto.Product;
import edu.sm.molshop3.dto.ProductImage;
import edu.sm.molshop3.repository.ProductImageRepository;
import edu.sm.molshop3.repository.ProductRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@RequiredArgsConstructor
public class ProductService {

    private final ProductRepository productRepository;
    private final ProductImageRepository productImageRepository;

    // 🔹 상품 등록
    @Transactional
    public void register(Product product) {
        productRepository.insert(product);
        if (product.getImages() != null) {
            for (ProductImage img : product.getImages()) {
                img.setProductId(product.getProductId()); // FK 설정
                productImageRepository.insert(img);
            }
        }
    }

    // 🔹 상품 수정
    @Transactional
    public void modify(Product product) throws Exception {
        productRepository.update(product);

        // 기존 이미지 삭제 후 새로 삽입
        productImageRepository.deleteByProductId(product.getProductId());
        if (product.getImages() != null) {
            for (ProductImage img : product.getImages()) {
                img.setProductId(product.getProductId());
                productImageRepository.insert(img);
            }
        }
    }

    // 🔹 상품 삭제
    @Transactional
    public void remove(int productId) {
        productImageRepository.deleteByProductId(productId); // 이미지 먼저 삭제
        productRepository.delete(productId);                 // 상품 삭제
    }

    // 🔹 상품 단건 조회
    public Product get(int productId) {
        Product product = productRepository.select(productId);
        if (product != null) {
            List<ProductImage> images = productImageRepository.selectByProductId(productId);
            product.setImages(images);
        }
        return product;
    }

    public List<Product> get() {
        List<Product> products = productRepository.selectAll();
        for (Product p : products) {
            List<ProductImage> imgs = productImageRepository.selectByProductId(p.getProductId());
            p.setImages(imgs);  // 이미지 리스트 주입

            if (imgs != null && !imgs.isEmpty()) {
                p.setImage(imgs.get(0).getProductImgUrl());  // 대표 이미지 설정
            }
        }
        return products;
    }


}