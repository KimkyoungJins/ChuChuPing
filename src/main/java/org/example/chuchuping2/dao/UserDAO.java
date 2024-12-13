package org.example.chuchuping2.dao;


import org.example.chuchuping2.mapper.UserMapper;
import org.example.chuchuping2.vo.UserVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class UserDAO {

    @Autowired
    private UserMapper userMapper;

    public int insertUser(UserVO user) {
        return userMapper.insertUser(user);
    }

    public UserVO findByName(String name) {
        return userMapper.findByName(name);
    }
}