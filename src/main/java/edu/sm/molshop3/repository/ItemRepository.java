package edu.sm.molshop3.repository;

import edu.sm.molshop3.dto.Item;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.List;

@Mapper
@Repository
public interface ItemRepository {
    List<Item> selectByProductId(int productId);
}
