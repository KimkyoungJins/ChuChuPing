package org.example.chuchuping2.mapper;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.example.chuchuping2.vo.UserVO;



public interface UserMapper {

    int insertUser(UserVO user);

    UserVO findByName(String name);
}