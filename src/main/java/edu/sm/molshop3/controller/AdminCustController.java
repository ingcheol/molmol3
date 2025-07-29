package edu.sm.molshop3.controller;

import edu.sm.molshop3.dto.Cust;
import edu.sm.molshop3.service.CustService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
@RequiredArgsConstructor
@RequestMapping("/admin/cust")
public class AdminCustController {

    private final CustService custService;

    // ✅ 1. 고객 목록
    @GetMapping("/list")
    public String list(Model model) throws Exception {
        model.addAttribute("custs", custService.get());
        return "cust/list";
    }

    // ✅ 2. 고객 등록 폼
    @GetMapping("/add")
    public String addForm() {
        return "cust/add";
    }

    // ✅ 4. 고객 수정 폼
    @GetMapping("/edit")
    public String editForm(@RequestParam("custId") String custId, Model model) throws Exception {
        model.addAttribute("cust", custService.get(custId));
        return "cust/edit";
    }

    // ✅ 5. 고객 수정 처리
    @PostMapping("/edit")
    public String edit(@ModelAttribute Cust cust) throws Exception {
        custService.modify(cust);
        return "redirect:/admin/cust/list";
    }

    // ✅ 6. 고객 삭제
    @GetMapping("/delete")
    public String delete(@RequestParam("custId") String custId) throws Exception {
        custService.remove(custId);
        return "redirect:/admin/cust/list";
    }
}
