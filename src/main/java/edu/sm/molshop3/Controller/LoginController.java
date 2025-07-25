package edu.sm.molshop3.Controller;

import jakarta.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
public class LoginController {

    @GetMapping("/login")
    public String loginPage() {
        return "login"; // login.jsp 경로 포워드
    }

    @PostMapping("/loginimpl")
    public String loginImpl(@RequestParam String id,
                            @RequestParam String pw,
                            HttpSession session,
                            Model model) {
        if(id.equals("admin") && pw.equals("1234")) {
            session.setAttribute("loginCust", id);
            return "redirect:/";
        } else {
            model.addAttribute("msg", "아이디 또는 비밀번호가 틀른 것입니다.");
            return "login";
        }
    }
}