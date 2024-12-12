package org.example.chuchuping2.vo;

import java.util.Date;

// 게시물 테이블 구조
public class BoardVO {

    private Long id;
    private String title;
    private String content;
    private Long userId;                // 작성한 유저의 아이디
    private Long characterId;           // 캐릭터 아이디
    private java.util.Date createdAt;   // 만든 시간
    private java.util.Date updatedAt;   // 업데이트 시간
    private Integer views;              // 조회수
    private String userName;            // 유저 이름
    private String characterImage;      // 캐릭터 이미지 URL


    public BoardVO(Long id, String title, String content, Long userId, Long characterId, Date createdAt, Date updatedAt, Integer views, String userName, String characterImage) {
        this.id = id;
        this.title = title;
        this.content = content;
        this.userId = userId;
        this.characterId = characterId;
        this.createdAt = createdAt;
        this.updatedAt = updatedAt;
        this.views = views;
        this.userName = userName;
        this.characterImage = characterImage;
    }

    public BoardVO() {

    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public Long getUserId() {
        return userId;
    }

    public void setUserId(Long userId) {
        this.userId = userId;
    }

    public Long getCharacterId() {
        return characterId;
    }

    public void setCharacterId(Long characterId) {
        this.characterId = characterId;
    }

    public Date getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(Date createdAt) {
        this.createdAt = createdAt;
    }

    public Date getUpdatedAt() {
        return updatedAt;
    }

    public void setUpdatedAt(Date updatedAt) {
        this.updatedAt = updatedAt;
    }

    public Integer getViews() {
        return views;
    }

    public void setViews(Integer views) {
        this.views = views;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getCharacterImage() {
        return characterImage;
    }

    public void setCharacterImage(String characterImage) {
        this.characterImage = characterImage;
    }
}