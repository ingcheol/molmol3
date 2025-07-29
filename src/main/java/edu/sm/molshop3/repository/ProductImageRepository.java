package edu.sm.molshop3.repository;

import edu.sm.molshop3.dto.ProductImage;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.List;

@Mapper
@Repository
public interface ProductImageRepository {
    void insert(ProductImage image);
    List<ProductImage> selectByProductId(int productId);
    void delete(int productImgId);
    void deleteByProductId(int productId);
}
