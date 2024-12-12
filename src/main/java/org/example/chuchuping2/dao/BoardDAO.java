package org.example.chuchuping2.dao;

import org.example.chuchuping2.vo.BoardVO;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class BoardDAO {

    @Autowired
    private SqlSessionTemplate sqlSession;  // mybatis에서 직접적으로 제공하는 클래스

    // 이렇게 하면 좀 더 좋다고 하더라
    // 좀더 깔끔쓰
    private static final String NAMESPACE = "BoardMapper";

    // mapper와 직접적인 통신을 이루어 낸다.
    public void insertBoard(BoardVO boardVO) {
        sqlSession.insert(NAMESPACE + ".insertBoard", boardVO);
    }

}