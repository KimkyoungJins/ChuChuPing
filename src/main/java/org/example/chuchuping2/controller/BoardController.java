package org.example.chuchuping2.controller;

import org.example.chuchuping2.service.BoardService;
import org.example.chuchuping2.service.CharacterService;
import org.example.chuchuping2.vo.BoardVO;
import org.example.chuchuping2.vo.CharacterVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpSession;
import java.util.List;

// CRUD 기능 추가하기
@Controller
public class BoardController {

    @Autowired
    private BoardService boardService;

    @Autowired
    private CharacterService characterService;

    // 메인 페이지, 게시판을 가져온다.
    // 게시판을 가져올 뿐안 아니라 캐릭터들을 보여주기도 해야한다.
    @GetMapping("/boards")
    public String boardList(Model model) {
        List<BoardVO> boards = boardService.getAllBoards();
        model.addAttribute("boardList", boards); // 변경된 부분
        return "board_list";
    }



    // 게시물을 생성하는 창에서 캐릭터 데이터를 불러오는 역할을 한다.
    @GetMapping("/createBoard")
    public String createBoardForm(Model model, HttpSession httpSession) {

        // 로그인 확인
        Long userId = (Long) httpSession.getAttribute("userId");
        if (userId == null) {
            return "redirect:/login";
        }


        List<CharacterVO> characters = characterService.getAllCharacters();
        model.addAttribute("characters", characters);
        return "board_create";
    }

    // 게시물 생성 처리
    // 게시물을 생성하면 처리하는 로직
    @PostMapping("/submitBoard")
    public String createBoard(

            // 사용자가 입력을 하면, 제목, 내용, 캐릭터 아이디, 내용을 입력한 유저의 아이디를 입력 받는다.
            // 파라미터로 받음.
            // @RuquestParam을 통하여서 유저로 부터 데이터를 전송 받는다.
            @RequestParam String title,
            @RequestParam String content,
            @RequestParam Long character_id,
            HttpSession httpSession
    ) {

        // 로그인 확인
        Long userId = (Long) httpSession.getAttribute("userId");
        if (userId == null) {
            return "redirect:/login";
        }

        boardService.createBoard(title, content, userId, character_id);
        return "redirect:/boards"; // 게시물 목록 페이지로 리다이렉트
    }




}