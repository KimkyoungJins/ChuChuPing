package org.example.chuchuping2.service;

import com.sun.jna.platform.win32.Netapi32Util;
import org.example.chuchuping2.mapper.UserMapper;
import org.example.chuchuping2.vo.UserVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class UserService {
    @Autowired
    private UserMapper userMapper;

    /**
     * 로그인 메서드
     * @param name 사용자 이름
     * @param password 사용자 비밀번호
     * @return 로그인 성공 시 User 객체, 실패 시 null
     */
    public UserVO login(String name, String password) {
        UserVO user = userMapper.findByName(name);
        if (user != null && user.getPassword().equals(password)) {
            return user;
        }
        return null;
    }
}