package org.example.chuchuping2.vo;

public class UserVO {

    private Long id;
    private String name;
    private String password;


    public UserVO(Long id, String name, String password) {
        this.id = id;
        this.name = name;
        this.password = password;
    }

    public UserVO() {

    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }
}
