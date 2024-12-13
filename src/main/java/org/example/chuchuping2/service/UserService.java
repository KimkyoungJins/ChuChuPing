package org.example.chuchuping2.service;

import com.sun.jna.platform.win32.Netapi32Util;
import org.example.chuchuping2.dao.UserDAO;
import org.example.chuchuping2.mapper.UserMapper;
import org.example.chuchuping2.vo.UserVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class UserService {
    @Autowired
    private UserMapper userMapper;

    @Autowired
    private UserDAO userDAO;

    public void registerUser(String name, String password) {
        // 유저 중복 확인
        UserVO existingUser = userDAO.findByName(name);
        if (existingUser != null) {
            throw new RuntimeException("이미 존재하는 사용자 이름입니다.");
        }

        // 회원가입 로직
        UserVO user = new UserVO();
        user.setName(name);
        user.setPassword(password);

        userDAO.insertUser(user);
    }

    public UserVO login(String name, String password) {
        UserVO user = userMapper.findByName(name);
        if (user != null && user.getPassword().equals(password)) {
            return user;
        }
        return null;
    }
}