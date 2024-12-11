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

    public List<CharacterVO> selectAllCharacters() {
        return characterMapper.selectAllCharacters();
    }
}