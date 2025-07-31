package edu.sm.molshop3.controller;

import edu.sm.molshop3.dto.Cust;
import edu.sm.molshop3.dto.Review;
import edu.sm.molshop3.service.CustService;
import edu.sm.molshop3.service.ReviewService;
import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
@RequiredArgsConstructor
public class ReviewController {

    private final ReviewService reviewService;

    @PostMapping("/reviews/add")
    public String addReview(Review review, HttpSession session) {
        Cust cust = (Cust) session.getAttribute("logincust");
        if (cust == null) return "redirect:/login";

        review.setCustId(cust.getCustId());
        reviewService.addReview(review);

        return "redirect:/product/see?productId=" + review.getProductId();
    }
}