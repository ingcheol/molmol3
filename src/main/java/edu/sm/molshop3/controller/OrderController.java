package edu.sm.molshop3.controller;

import edu.sm.molshop3.dto.Cart;
import edu.sm.molshop3.dto.Cust;
import edu.sm.molshop3.service.CartService;
import edu.sm.molshop3.service.OrderService;
import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
@RequiredArgsConstructor
public class OrderController {

    private final OrderService orderService;
    private final CartService cartService;

    // ✅ 결제 페이지 진입
    @GetMapping("/order/checkout")
    public String showCheckout(HttpSession session, Model model) throws Exception {
        Cust cust = (Cust) session.getAttribute("logincust");
        if (cust == null) {
            return "redirect:/login";
        }

        List<Cart> cartList = cartService.findByCustId(cust.getCustId());
        int totalAmount = cartList.stream()
                .mapToInt(c -> c.getProductPrice() * c.getProductQt())
                .sum();

        model.addAttribute("cartList", cartList);
        model.addAttribute("totalAmount", totalAmount);
        model.addAttribute("logincust", cust);

        return "/order/checkout";
    }

    // ✅ 결제 처리
    @PostMapping("/order/checkout")
    public String checkout(HttpSession session,
                           @RequestParam("paymentMethod") String paymentMethod) {
        Cust cust = (Cust) session.getAttribute("logincust");
        if (cust == null) {
            return "redirect:/login";
        }

        orderService.processOrder(cust.getCustId(), paymentMethod);
        return "redirect:/order/complete";
    }

    // ✅ 결제 완료
    @GetMapping("/order/complete")
    public String orderComplete() {
        return "/order/orderComplete";
    }
}
