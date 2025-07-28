package edu.sm.molshop3.service;

import edu.sm.molshop3.dto.Item;
import edu.sm.molshop3.dto.Product;
import edu.sm.molshop3.repository.ItemRepository;
import edu.sm.molshop3.repository.ProductRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@RequiredArgsConstructor
public class ProductService {

    private final ProductRepository productRepository;
    private final ItemRepository itemRepository;

    @Transactional
    public void register(Product product) {
        productRepository.insert(product);
        // 구성품 insert는 이후 필요 시 구현
    }

    @Transactional
    public void modify(Product product) {
        productRepository.update(product);
        // 구성품 수정 로직 필요 시 추가
    }

    @Transactional
    public void remove(int productId) {
        productRepository.delete(productId);
        // 구성품도 같이 지워지도록 DB에 ON DELETE CASCADE가 걸려있다면 따로 안 지워도 됨
    }

    public Product get(int productId) {
        Product product = productRepository.select(productId);
        if (product != null) {
            List<Item> items = itemRepository.selectByProductId(productId);
            product.setItems(items);
        }
        return product;
    }


    public List<Product> get() {
        return productRepository.selectAll();
    }
}
