package org.example.chuchuping2.service;


import org.example.chuchuping2.dao.BoardDAO;
import org.example.chuchuping2.vo.BoardVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;

@Service
public class BoardService {

    @Autowired
    private BoardDAO boardDAO;

    // 보드를 만드는 로직이다.
    // boardVO에서 set 로직을 사용한다.
    // 사용자로부터 데이터를 받아서 보드를 만드는 것이니까 set 로직을 사용한다.
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

    // DAO에서 보드를 가져오기 위해서
    public List<BoardVO> getAllBoards(){
        return boardDAO.selectAllBoards();
    }


    public BoardVO getBoardById(Long boardId) {
        return boardDAO.selectBoardById(boardId);
    }



    public void deleteBoard(int boardId) {
        boardDAO.deleteBoard(boardId);
    }

    public void updateBoard(Long boardId, String title, String content) {
        // 수정할 게시물 객체 생성
        BoardVO boardVO = boardDAO.selectBoardById(boardId);
        if (boardVO == null) {
            throw new RuntimeException("해당 게시물이 존재하지 않습니다.");
        }

        boardVO.setTitle(title);
        boardVO.setContent(content);
        boardVO.setUpdatedAt(new Date());

        boardDAO.updateBoard(boardVO);
    }


}
