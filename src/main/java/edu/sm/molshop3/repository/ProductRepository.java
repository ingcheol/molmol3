package edu.sm.molshop3.repository;

import edu.sm.molshop3.dto.Product;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.List;

@Mapper
@Repository
public interface ProductRepository {
    void insert(Product product);
    void update(Product product);
    void delete(int productId);
    Product select(int productId);
    List<Product> selectAll();

    // 이미지 포함된 확장 쿼리
    Product selectWithImages(int productId);
    List<Product> selectAllWithImages();
}
