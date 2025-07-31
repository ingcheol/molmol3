package edu.sm.molshop3.service;

import edu.sm.molshop3.dto.Review;
import edu.sm.molshop3.repository.ReviewRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class ReviewService {

    final ReviewRepository reviewRepository;

    // 🔹 상품별 리뷰 조회
    public List<Review> getReviewsByProduct(int productId) {
        return reviewRepository.findByProductId(productId);
    }

    // 🔹 리뷰 등록
    public void addReview(Review review) {
        reviewRepository.insertReview(review);
    }

    // 🔹 리뷰 단건 조회 (삭제 권한 확인용)
    public Review get(int reviewId) {
        return reviewRepository.selectReview(reviewId);
    }

    // 🔹 리뷰 삭제
    public void remove(int reviewId) {
        reviewRepository.deleteReview(reviewId);
    }
}
