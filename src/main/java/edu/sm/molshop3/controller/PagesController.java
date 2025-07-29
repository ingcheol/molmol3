package edu.sm.molshop3.controller;

import edu.sm.molshop3.dto.Cust;
import jakarta.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class PagesController {

    @GetMapping("/pages/information")
    public String showInformationPage(Model model, HttpSession session) {
        Cust cust = (Cust) session.getAttribute("logincust"); // 여기를 "loginCust" → "logincust"로 수정
        if (cust == null) {
            return "redirect:/login";
        }
        model.addAttribute("cust", cust);
        return "/pages/information";
    }



    @GetMapping("/pages/orders")
    public String showOrdersPage() {
        return "/pages/orders";
    }

    @GetMapping("/pages/review")
    public String showReviewPage() {
        return "/pages/review";
    }
}
