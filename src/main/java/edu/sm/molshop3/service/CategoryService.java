package edu.sm.molshop3.service;

import edu.sm.molshop3.dto.Category;
import edu.sm.molshop3.repository.CategoryRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class CategoryService {
    private final CategoryRepository categoryRepository;

    public List<Category> getAll() {
        return categoryRepository.selectAll();
    }
    public void register(Category category) {
        categoryRepository.insert(category);
    }
    public List<Category> get() {
        return categoryRepository.selectAll();  // 혹은 네가 실제로 사용하는 메서드
    }


}
