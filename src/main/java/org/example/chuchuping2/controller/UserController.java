package org.example.chuchuping2.controller;

import org.example.chuchuping2.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class UserController {

    @Autowired
    private UserService userService;

    @GetMapping("/register")
    public String registerForm() {
        return "register"; // register.jsp로 이동
    }

    @PostMapping("/register")
    public String registerUser(@RequestParam String name,
                               @RequestParam String password,
                               Model model) {
        try {
            userService.registerUser(name, password);
            return "redirect:/login"; // 회원가입 성공 시 로그인 페이지로 리다이렉트
        } catch (RuntimeException e) {
            model.addAttribute("error", e.getMessage());
            return "register"; // 회원가입 폼으로 다시 이동
        }
    }
}