package org.example.chuchuping2.dao;

import org.example.chuchuping2.mapper.BoardMapper;
import org.example.chuchuping2.vo.BoardVO;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class BoardDAO {

    @Autowired
    private BoardMapper boardMapper; // 보드 매퍼를 주입받음

    // mapper와 직접적인 통신을 이루어 낸다.
    public void insertBoard(BoardVO boardVO) {
        boardMapper.insertBoard(boardVO);
    }

    // 데이터베이스와 통신을 하여서 모든 보드 데이터를 끌고 와야 한다.
    public List<BoardVO> selectAllBoards() {
        return boardMapper.selectBoardList();
    }

    public BoardVO selectBoardById(Long boardId) {
        return boardMapper.selectBoardById(boardId);
    }


    public int deleteBoard(int boardId) {
        return boardMapper.deleteBoard(boardId);
    }

    public int updateBoard(BoardVO boardVO) {
        return boardMapper.updateBoard(boardVO);
    }

    public List<BoardVO> searchBoards(String query) {
        return boardMapper.searchBoards(query);
    }

    public void updateViewCount(Long boardId) {
        boardMapper.updateViewCount(boardId);
    }

}