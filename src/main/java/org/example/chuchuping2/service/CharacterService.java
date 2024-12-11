package org.example.chuchuping2.service;

import org.example.chuchuping2.dao.CharacterDAO;
import org.example.chuchuping2.vo.CharacterVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;


@Service
public class CharacterService {

    @Autowired
    private CharacterDAO characterDAO;

    public List<CharacterVO> getAllCharacters() {
        return characterDAO.selectAllCharacters();
    }
}