package org.example.chuchuping2.dao;

import org.example.chuchuping2.mapper.CharacterMapper;
import org.example.chuchuping2.vo.CharacterVO;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class CharacterDAO {

    @Autowired
    private CharacterMapper characterMapper;

    // 모든 캐릭터 불러오기, 게시물 생성 화면에 필요함.
    public List<CharacterVO> selectAllCharacters() {
        return characterMapper.selectAllCharacters();
    }
}