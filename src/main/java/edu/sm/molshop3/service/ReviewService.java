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

    public List<Review> getReviewsByProduct(int productId) {
        return reviewRepository.findByProductId(productId);
    }

    public void addReview(Review review) {
        reviewRepository.insertReview(review);
    }
}
