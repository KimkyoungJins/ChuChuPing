package org.example.chuchuping2.mapper;

import org.example.chuchuping2.vo.BoardVO;

import java.util.List;

public interface BoardMapper {
    List<BoardVO> selectBoardList();
    int insertBoard(BoardVO boardVO);
    int deleteBoard(int boardId);
}