package org.example.chuchuping2.mapper;

import org.example.chuchuping2.vo.CharacterVO;
import java.util.List;

public interface CharacterMapper {
    List<CharacterVO> selectAllCharacters();
}