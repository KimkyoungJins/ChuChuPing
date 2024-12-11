package org.example.chuchuping2.dao;

import org.example.chuchuping2.vo.CharacterVO;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class CharacterDAO {

    @Autowired
    private SqlSessionTemplate sqlSession;

    // mapper.xml을 위한 상수 정하기
    private static final String NAMESPACE = "CharacterMapper";

    // 데이터 베이스에서 케릭터 데이터들을 가져온다.
    public List<CharacterVO> selectAllCharacters() {
        return sqlSession.selectList(NAMESPACE + ".selectAllCharacters");
    }

}