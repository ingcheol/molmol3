package edu.sm.molshop3.repository;

import edu.sm.molshop3.dto.Review;
import lombok.RequiredArgsConstructor;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
@RequiredArgsConstructor
public class ReviewRepository {

    private final SqlSession sql;

    public List<Review> findByProductId(int productId) {
        // ⚠️ 정확한 경로로 호출해야 함
        return sql.selectList("edu.sm.molshop3.repository.ReviewRepository.findByProductId", productId);
    }

    public void insertReview(Review review) {
        sql.insert("edu.sm.molshop3.repository.ReviewRepository.insertReview", review);
    }
}
