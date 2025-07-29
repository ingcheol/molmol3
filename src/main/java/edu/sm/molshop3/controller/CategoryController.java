package edu.sm.molshop3.controller;

import edu.sm.molshop3.dto.Category;
import edu.sm.molshop3.service.CategoryService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
@RequiredArgsConstructor
@RequestMapping("/admin/category")
public class CategoryController {

    private final CategoryService categoryService;


    // ✅ 카테고리 목록
    @GetMapping("/list")
    public String list(Model model) {
        model.addAttribute("categories", categoryService.getAll());
        return "category/list";
    }
}
