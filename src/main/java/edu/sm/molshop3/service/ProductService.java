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

    @Transactional
    public List<Product> getByCategory(String cateId) {
        List<Product> products = productRepository.selectByCategory(cateId);
        for (Product p : products) {
            List<ProductImage> imgs = productImageRepository.selectByProductId(p.getProductId());
            p.setImages(imgs);
            if (imgs != null && !imgs.isEmpty()) {
                p.setImage(imgs.get(0).getProductImgUrl());
            }
        }
        return products;
    }

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

    @Transactional
    public void modify(Product product, boolean imageUpdated) throws Exception {
        productRepository.update(product);

        if (imageUpdated && product.getImages() != null) {
            productImageRepository.deleteByProductId(product.getProductId());
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

    public List<Product> getBestProducts() {
        List<Product> products = productRepository.selectBest(); // 예: 가격순
        for (Product p : products) {
            List<ProductImage> imgs = productImageRepository.selectByProductId(p.getProductId());
            p.setImages(imgs);
            if (imgs != null && !imgs.isEmpty()) {
                p.setImage(imgs.get(0).getProductImgUrl());
            }
        }
        return products;
    }

    // 🔹 신상품 (등록일 기준 정렬)
    public List<Product> getNewProducts() {
        List<Product> products = productRepository.selectNew(); // 최신순으로 정렬된 전체 상품

        for (Product p : products) {
            List<ProductImage> imgs = productImageRepository.selectByProductId(p.getProductId());
            p.setImages(imgs);
            if (imgs != null && !imgs.isEmpty()) {
                p.setImage(imgs.get(0).getProductImgUrl());
            }
        }

        // 최신순 중 상위 6개만 반환
        return products.stream().limit(6).toList();
    }

}