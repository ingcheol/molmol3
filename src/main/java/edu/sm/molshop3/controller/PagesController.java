package edu.sm.molshop3.controller;

import edu.sm.molshop3.dto.Cust;
import edu.sm.molshop3.dto.Order;
import edu.sm.molshop3.service.OrderService;
import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import java.util.List;

@Controller
@RequiredArgsConstructor
public class PagesController {

    private final OrderService orderService;

    // ✅ 내 정보 페이지
    @GetMapping("/pages/information")
    public String showInformationPage(Model model, HttpSession session) {
        Cust cust = (Cust) session.getAttribute("logincust"); // 세션 키는 그대로 유지
        if (cust == null) {
            return "redirect:/login";
        }
        model.addAttribute("cust", cust);
        return "/pages/information";
    }


    // ✅ 주문 내역 페이지
    @GetMapping("/pages/orders")
    public String showOrderPage(Model model, HttpSession session) {
        Cust loginUser = (Cust) session.getAttribute("logincust");
        if (loginUser == null) {
            return "redirect:/login";
        }
        List<Order> orderList = orderService.getOrdersByCustId(loginUser.getCustId());
        model.addAttribute("orderList", orderList);
        return "/pages/orders";
    }
}
