package edu.sm.molshop3.service;

import edu.sm.molshop3.dto.ProductImage;
import edu.sm.molshop3.repository.ProductImageRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@RequiredArgsConstructor
public class ProductImageService {

    private final ProductImageRepository productImageRepository;

    // 이미지 등록
    @Transactional
    public void register(ProductImage image) {
        productImageRepository.insert(image);
    }

    // 상품 ID로 이미지 전체 조회
    public List<ProductImage> getByProductId(int productId) {
        return productImageRepository.selectByProductId(productId);
    }

    // 이미지 단건 삭제
    @Transactional
    public void remove(int productImgId) {
        productImageRepository.delete(productImgId);
    }

    // 상품 ID로 이미지 전체 삭제
    @Transactional
    public void removeByProductId(int productId) {
        productImageRepository.deleteByProductId(productId);
    }

}
