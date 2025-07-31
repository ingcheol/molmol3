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

    // 🔹 상품 ID로 리뷰 목록 조회
    public List<Review> findByProductId(int productId) {
        return sql.selectList("edu.sm.molshop3.repository.ReviewRepository.findByProductId", productId);
    }

    // 🔹 리뷰 등록
    public void insertReview(Review review) {
        sql.insert("edu.sm.molshop3.repository.ReviewRepository.insertReview", review);
    }

    // 🔹 리뷰 단건 조회 (삭제 권한 확인용)
    public Review selectReview(int reviewId) {
        return sql.selectOne("edu.sm.molshop3.repository.ReviewRepository.selectReview", reviewId);
    }

    // 🔹 리뷰 삭제
    public void deleteReview(int reviewId) {
        sql.delete("edu.sm.molshop3.repository.ReviewRepository.deleteReview", reviewId);
    }
}
