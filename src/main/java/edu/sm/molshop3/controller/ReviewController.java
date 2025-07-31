package edu.sm.molshop3.controller;

import edu.sm.molshop3.dto.Cust;
import edu.sm.molshop3.dto.Review;
import edu.sm.molshop3.service.OrderService;
import edu.sm.molshop3.service.ReviewService;
import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
@RequiredArgsConstructor
public class ReviewController {

    private final ReviewService reviewService;
    private final OrderService orderService;  // 리뷰 목록에 주문 불러오기용

    // ▶ 리뷰 작성 페이지 진입 (주문 내역 전달)
    @GetMapping("/pages/review")
    public String showReviewPage(Model model, HttpSession session) {
        Cust cust = (Cust) session.getAttribute("logincust");
        if (cust == null) {
            return "redirect:/login";
        }

        List<edu.sm.molshop3.dto.Order> orderList = orderService.getOrdersByCustId(cust.getCustId());
        model.addAttribute("orderList", orderList);
        return "/pages/review";
    }

    // ✅ 리뷰 저장
    @PostMapping("/reviews/add")
    public String addReview(Review review, HttpSession session) {
        Cust cust = (Cust) session.getAttribute("logincust");
        if (cust == null) {
            return "redirect:/login";
        }

        review.setCustId(cust.getCustId());
        reviewService.addReview(review);
        return "redirect:/product/see?productId=" + review.getProductId();
    }
    @PostMapping("/review/delete")
    public String deleteReview(@RequestParam("reviewId") int reviewId,
                               @RequestParam("productId") int productId,
                               HttpSession session) throws Exception {
        Cust loginUser = (Cust) session.getAttribute("logincust");

        if (loginUser == null) {
            return "redirect:/login";
        }

        Review review = reviewService.get(reviewId);

        if (review != null &&
                (loginUser.getCustId().equals(review.getCustId()) ||
                        loginUser.getCustId().equals("admin"))) {
            reviewService.remove(reviewId);
        }

        return "redirect:/product/see?id=" + productId;
    }

}
