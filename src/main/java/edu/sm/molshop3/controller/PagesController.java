package edu.sm.molshop3.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class PagesController {

    @GetMapping("/pages/information")
    public String showInformationPage() {
        return "/pages/information"; // /views/pages/information.jsp
    }

    @GetMapping("/pages/orders")
    public String showOrdersPage() {
        return "/pages/orders"; // /views/pages/orders.jsp
    }

    @GetMapping("/pages/review")
    public String showReviewPage() {
        return "/pages/review"; // /views/pages/review.jsp
    }

}
