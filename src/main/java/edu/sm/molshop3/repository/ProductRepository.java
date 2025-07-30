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
    List<Product> selectByCategory(String cateId);
    List<Product> selectAll();
    List<Product> selectAllWithImages();
    List<Product> selectBest();
    List<Product> selectNew();
}
