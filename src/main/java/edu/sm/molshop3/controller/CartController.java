package edu.sm.molshop3.controller;

import edu.sm.molshop3.dto.Cart;
import edu.sm.molshop3.dto.Cust;
import edu.sm.molshop3.service.CartService;
import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
@RequestMapping("/cart")
@RequiredArgsConstructor
public class CartController {

    final CartService cartService;
    String dir = "cart/"; // views/cart/cart.jsp

    @GetMapping("")
    public String cartPage(Model model, HttpSession session) throws Exception {
        Cust cust = (Cust) session.getAttribute("logincust");
        if (cust == null) return "redirect:/login";

        String custId = cust.getCustId();
        List<Cart> carts = cartService.findByCustId(custId);

        // ✅ 총합 계산
        int total = carts.stream()
                .mapToInt(c -> c.getProductPrice() * c.getProductQt())
                .sum();

        model.addAttribute("carts", carts);
        model.addAttribute("total", total); // 💰 총합 JSP로 전달
        return dir + "cart";
    }

    @PostMapping("/update")
    public String updateQuantity(@RequestParam("cartId") int cartId,
                                 @RequestParam("quantity") int quantity,
                                 HttpSession session) throws Exception {
        if (quantity <= 0) return "redirect:/cart";
        cartService.updateQuantity(cartId, quantity);
        return "redirect:/cart";
    }

    @PostMapping("/delete")
    public String deleteItem(@RequestParam("cartId") int cartId) throws Exception {
        cartService.delete(cartId);
        return "redirect:/cart";
    }

    @PostMapping("/add")
    public String addToCart(@ModelAttribute Cart cart, HttpSession session) throws Exception {
        Cust cust = (Cust) session.getAttribute("logincust");
        if (cust == null) return "redirect:/login";

        if (cart.getProductQt() <= 0) return "redirect:/cart";

        cart.setCustId(cust.getCustId());

        System.out.println("장바구니 추가된 productId: " + cart.getProductId());

        cartService.register(cart);

        return "redirect:/product/see?productId=" + cart.getProductId();
    }
}
