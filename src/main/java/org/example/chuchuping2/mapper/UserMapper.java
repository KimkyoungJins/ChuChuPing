package org.example.chuchuping2.mapper;

import org.apache.ibatis.annotations.Select;
import org.example.chuchuping2.vo.UserVO;



// mapper.xml 안만들고 자바로 만들어봄
public interface UserMapper {
    @Select("SELECT id, name, password FROM user WHERE name = #{name}")
    UserVO findByName(String name);
}