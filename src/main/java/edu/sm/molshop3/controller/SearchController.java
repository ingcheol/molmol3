package edu.sm.molshop3.controller;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class SearchController {
    @GetMapping("/search")
    public String search(@RequestParam("s") String keyword) {
        keyword = keyword.trim().toLowerCase();

        // 예: 검색어에 "instagram" 또는 "인스타"가 들어가면 인스타 페이지로 이동
        if (keyword.contains("instagram") || keyword.contains("인스타") || keyword.contains("스타")) {
            return "redirect:/blog/star";
        }

        // 예: 검색어에 "후기"가 들어가면 후기 페이지로 이동
        if (keyword.contains("후기") || keyword.contains("review") || keyword.contains("리뷰")) {
            return "redirect:/blog/review";
        }

        // 예: 검색어에 "스타일"이 들어가면 스타일 팁 페이지로 이동
        if (keyword.contains("스타일") || keyword.contains("tip") || keyword.contains("코디")) {
            return "redirect:/blog/tip";
        }

        // 예: "영상"이 포함된 경우 스타일 영상 페이지로 이동
        if (keyword.contains("영상") || keyword.contains("video") || keyword.contains("유튜브") || keyword.contains("비디오")) {
            return "redirect:/blog/video";
        }

        if (keyword.contains("베스트") || keyword.contains("best") || keyword.contains("베스트 착장") || keyword.contains("베스트착장")) {
            return "redirect:/home/best";
        }

        if (keyword.contains("new") || keyword.contains("신상") || keyword.contains("신상 착장") || keyword.contains("신상착장")) {
            return "redirect:/home/new";
        }

        if (keyword.contains("cart") || keyword.contains("장바구니")) {
            return "redirect:/cart";
        }

        if (keyword.contains("리뷰") || keyword.contains("리뷰 작성") || keyword.contains("리뷰작성") || keyword.contains("review")) {
            return "redirect:/pages/review";
        }

        if (keyword.contains("로그인") || keyword.contains("회원가입") || keyword.contains("login")) {
            return "redirect:/login";
        }

        // 검색어가 안 맞으면 기본 페이지나 검색 결과 없음 페이지
        return "redirect:/notfound";
    }

    @GetMapping("/notfound")
    public String notfound() {
        return "notfound";  // /views/notfound.jsp
    }

}