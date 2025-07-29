package edu.sm.molshop3.service;

import edu.sm.molshop3.dto.Product;
import edu.sm.molshop3.repository.ProductRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@RequiredArgsConstructor
public class ProductService {

    private final ProductRepository productRepository;

    @Transactional
    public void register(Product product) {
        productRepository.insert(product);
    }

    @Transactional
    public void modify(Product product) throws Exception {
        productRepository.update(product);
    }

    @Transactional
    public void remove(int productId) {
        productRepository.delete(productId);
    }

    public Product get(int productId) {
        return productRepository.select(productId);
    }

    public List<Product> get() {
        return productRepository.selectAll();
    }
}
