package org.example.chuchuping2.dao;

import org.example.chuchuping2.vo.BoardVO;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class BoardDAO {

    @Autowired
    private SqlSessionTemplate sqlSession;

    // board.xml에 정의된 namespace와 id를 사용
    private static final String NAMESPACE = "BoardMapper";

    public void insertBoard(BoardVO boardVO) {
        sqlSession.insert(NAMESPACE + ".insertBoard", boardVO);
    }
}