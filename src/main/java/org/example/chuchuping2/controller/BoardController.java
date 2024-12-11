package org.example.chuchuping2.controller;

import org.example.chuchuping2.service.BoardService;
import org.example.chuchuping2.service.CharacterService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
//@RequestMapping("/")
public class BoardController {

    @Autowired
    private BoardService boardService;

    @Autowired
    private CharacterService characterService;

    // 메인페이지, 모든 게시물들 가져옴.
    @GetMapping("/create")
    public String add() {
        return "board_create";
    }

//    @GetMapping
//    public String addd() {
//        return "board_create";
//    }

}