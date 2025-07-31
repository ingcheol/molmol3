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

    // ✅ 장바구니 페이지 보기
    @GetMapping("")
    public String cartPage(Model model, HttpSession session,
                           @ModelAttribute("prevPage") String prevPage) throws Exception {
        Cust cust = (Cust) session.getAttribute("logincust");
        if (cust == null) return "redirect:/login";

        String custId = cust.getCustId();
        List<Cart> carts = cartService.findByCustId(custId);

        int total = carts.stream()
                .mapToInt(c -> c.getProductPrice() * c.getProductQt())
                .sum();

        model.addAttribute("carts", carts);
        model.addAttribute("total", total);

        if (prevPage == null || prevPage.equals("null") || prevPage.isBlank()) {
            prevPage = "main";
        }
        model.addAttribute("prevPage", prevPage);

        return "cart/cart";
    }

    // ✅ 결제 완료 처리
    @PostMapping("/checkout")
    public String checkout(HttpSession session, Model model) throws Exception {
        Cust cust = (Cust) session.getAttribute("logincust");
        if (cust == null) return "redirect:/login";

        // 🧹 장바구니 비우는 로직이 필요하다면 여기에 추가 가능
        // cartService.clearCartByCustId(cust.getCustId());

        return "cart/orderComplete";  // ✅ JSP 경로에 맞게 수정
    }

    // ✅ 수량 변경
    @PostMapping("/update")
    public String updateQuantity(@RequestParam("cartId") int cartId,
                                 @RequestParam("quantity") int quantity,
                                 HttpSession session) throws Exception {
        if (quantity <= 0) return "redirect:/cart";
        cartService.updateQuantity(cartId, quantity);
        return "redirect:/cart";
    }

    // ✅ 항목 삭제
    @PostMapping("/delete")
    public String deleteItem(@RequestParam("cartId") int cartId) throws Exception {
        cartService.delete(cartId);
        return "redirect:/cart";
    }

    // ✅ 장바구니에 담기
    @PostMapping("/add")
    public String addToCart(@ModelAttribute Cart cart, HttpSession session) throws Exception {
        Cust cust = (Cust) session.getAttribute("logincust");
        if (cust == null) return "redirect:/login";

        if (cart.getProductQt() <= 0) return "redirect:/cart";

        cart.setCustId(cust.getCustId());
        cartService.register(cart);

        return "redirect:/cart?prevPage=" + cart.getPrevPage();
    }
    @PostMapping("/cart/add")
    public String addCart(@ModelAttribute Cart cart, HttpSession session) {
        // ... cart insert 로직
        return "redirect:/cart";
    }

    @PostMapping("/addSet")
    public String addSetToCart(
            @RequestParam("productIds") List<Integer> productIds,
            HttpSession session
    ) throws Exception {
        Cust cust = (Cust) session.getAttribute("logincust");
        if (cust == null) return "redirect:/login";
        for (Integer pid : productIds) {
            cartService.addCart(cust.getCustId(), pid, 1);
        }
        return "redirect:/cart";
    }
}
