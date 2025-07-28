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
    public String loginPage() {
        return "login";
    }

    @PostMapping("/loginimpl")
    public String loginimpl(@RequestParam("id") String id,
                            @RequestParam("pwd") String pwd,
                            HttpSession session,
                            Model model) throws Exception {
        Cust dbCust = custService.get(id);

        if (dbCust != null && dbCust.getCustPwd().equals(pwd)) {
            session.setAttribute("logincust", dbCust);
            return "redirect:/";
        } else {
            model.addAttribute("loginstate", "fail");
            return "login";
        }
    }

    @PostMapping("/registerimpl")
    public String registerImpl(@RequestParam("custId") String custId,
                               @RequestParam("custPwd") String custPwd,
                               @RequestParam("custName") String custName,
                               @RequestParam("custPhone") String custPhone,
                               @RequestParam("custEmail") String custEmail,
                               @RequestParam("address") String address,
                               Model model) {
        Cust cust = Cust.builder()
                .custId(custId)
                .custPwd(custPwd)
                .custName(custName)
                .custPhone(custPhone)
                .custEmail(custEmail)
                .address(address)
                .build();

        try {
            custService.register(cust);
        } catch (Exception e) {
            log.error("회원가입 실패", e);
            model.addAttribute("msg", "회원가입 실패");
            return "login";
        }

        return "redirect:/login";
    }

    @GetMapping("/logout")
    public String logout(HttpSession session) {
        session.invalidate();
        return "redirect:/";
    }
}
