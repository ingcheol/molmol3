package edu.sm.molshop3.controller;

import edu.sm.molshop3.dto.Cust;
import edu.sm.molshop3.service.CustService;
import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
@Slf4j
@RequiredArgsConstructor
public class LoginController {

    final CustService custService;

    @GetMapping("/login")
    public String loginPage(Model model) {
        return "login"; // → /WEB-INF/views/login.jsp
    }

    @PostMapping("/loginimpl")
    public String loginimpl(Model model,
                            @RequestParam("id") String id,
                            @RequestParam("pwd") String pwd,
                            HttpSession session) throws Exception {
        log.info("로그인 시도: ID={}, PWD={}", id, pwd);

        Cust dbCust = custService.get(id);

        if (dbCust != null && dbCust.getCustPwd().equals(pwd)) {
            session.setAttribute("logincust", dbCust);
            return "redirect:/";
        } else {
            model.addAttribute("loginstate", "fail");
            return "login";
        }
    }

    @GetMapping("/logout")
    public String logout(HttpSession session) {
        if (session != null) {
            session.invalidate();
        }
        return "redirect:/";
    }
}
