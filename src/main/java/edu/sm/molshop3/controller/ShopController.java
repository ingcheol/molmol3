package edu.sm.molshop3.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class ShopController {

    @GetMapping("/shop/top")
    public String top(Model model) {
        model.addAttribute("center", "shop/top");
        return "/shop/top";
    }

    @GetMapping("/shop/bottom")
    public String bottom(Model model) {
        model.addAttribute("center", "shop/bottom");
        return "/shop/bottom";
    }

    @GetMapping("/shop/hat")
    public String hat(Model model) {
        model.addAttribute("center", "shop/hat");
        return "/shop/hat";
    }

    @GetMapping("/shop/shoes")
    public String shoes(Model model) {
        model.addAttribute("center", "shop/shoes");
        return "/shop/shoes";
    }

    @GetMapping("/shop/bag")
    public String bag(Model model) {
        model.addAttribute("center", "shop/bag");
        return "/shop/bag";
    }

    @GetMapping("/shop/accessory")
    public String accessory(Model model) {
        model.addAttribute("center", "shop/accessory");
        return "/shop/accessory";
    }
}
