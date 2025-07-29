package edu.sm.molshop3.repository;

import edu.sm.molshop3.dto.Category;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.List;

@Mapper
@Repository
public interface CategoryRepository {
    List<Category> selectAll();
    void insert(Category category);

}
