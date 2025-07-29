package edu.sm.molshop3.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class BlogController {

    @GetMapping("/blog/star")
    public String showStarPage() {
        return "blog/star"; // => /views/blog/star.jsp
    }

    @GetMapping("/blog/tip")
    public String showTipPage() {
        return "blog/tip";
    }

    @GetMapping("/blog/review")
    public String showReviewPage() {
        return "blog/review";
    }

    @GetMapping("/blog/video")
    public String showVideoPage() {
        return "blog/video";
    }
}
