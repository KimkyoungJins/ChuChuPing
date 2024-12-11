package org.example.chuchuping2.vo;

// 캐릭터 테이블 구조
public class CharacterVO {


    private Long id;
    private String imageUrl;
    private String characterName;

    public CharacterVO(Long id, String imageUrl, String characterName) {
        this.id = id;
        this.imageUrl = imageUrl;
        this.characterName = characterName;
    }


    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getImageUrl() {
        return imageUrl;
    }

    public void setImageUrl(String imageUrl) {
        this.imageUrl = imageUrl;
    }

    public String getCharacterName() {
        return characterName;
    }

    public void setCharacterName(String characterName) {
        this.characterName = characterName;
    }
}
