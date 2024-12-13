package org.example.chuchuping2.controller;

import org.example.chuchuping2.service.UserService;
import org.example.chuchuping2.vo.UserVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpSession;

@Controller
public class LoginController {

    @Autowired
    private UserService userService;

    /**
     * 로그인 폼을 보여주는 메서드
     */
    @GetMapping("/login")
    public String loginForm() {
        return "login"; // login.jsp로 포워드
    }

    /**
     * 로그인 처리 메서드
     */
    @PostMapping("/login")
    public String login(@RequestParam String name,
                        @RequestParam String password,
                        HttpSession session,
                        Model model) {
        UserVO userVO = userService.login(name, password);
        if (userVO != null) {
            // 로그인 성공: 세션에 사용자 정보 저장
            session.setAttribute("userId", userVO.getId());
            session.setAttribute("userName", userVO.getName());
            return "redirect:/boards"; // 게시물 리스트 페이지로 이동
        } else {
            // 로그인 실패: 에러 메시지와 함께 로그인 폼으로 돌아감
            model.addAttribute("error", "아이디 또는 비밀번호가 올바르지 않습니다.");
            return "login";
        }
    }

    /**
     * 로그아웃 처리 메서드
     */
    @GetMapping("/logout")
    public String logout(HttpSession session) {
        session.invalidate(); // 세션 무효화
        return "redirect:/login";
    }
}