package org.example.chuchuping2.controller;

import org.example.chuchuping2.service.BoardService;
import org.example.chuchuping2.service.CharacterService;
import org.example.chuchuping2.vo.CharacterVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;


// CRUD 기능 추가하기
@Controller
public class BoardController {

    @Autowired
    private BoardService boardService;

    @Autowired
    private CharacterService characterService;

    @GetMapping("/createBoard")
    public String createBoardForm(Model model) {
        List<CharacterVO> characters = characterService.getAllCharacters();
        model.addAttribute("characters", characters);
        return "board_create";
    }

    // 게시물 생성 처리
    @PostMapping("/submitBoard")
    public String createBoard(
            @RequestParam String title,
            @RequestParam String content,
            @RequestParam Long character_id,
            @RequestParam Long userId // 실제로는 로그인된 유저 세션에서 가져옴
    ) {
        boardService.createBoard(title, content, userId, character_id);
        return "redirect:/boards"; // 게시물 목록 페이지로 리다이렉트
    }
}