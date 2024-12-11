package org.example.chuchuping2.service;


import org.example.chuchuping2.dao.BoardDAO;
import org.example.chuchuping2.vo.BoardVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;

@Service
public class BoardService {

    @Autowired
    private BoardDAO boardDAO;


    // 보드를 만드는 로직이다.
    public void createBoard(String title, String content, Long userId, Long characterId) {
        BoardVO boardVO = new BoardVO();
        boardVO.setTitle(title);
        boardVO.setContent(content);
        boardVO.setUserId(userId);
        boardVO.setCharacterId(characterId);
        boardVO.setCreatedAt(new Date());
        boardVO.setUpdatedAt(new Date());
        boardVO.setViews(0);
        boardDAO.insertBoard(boardVO);
    }

}
