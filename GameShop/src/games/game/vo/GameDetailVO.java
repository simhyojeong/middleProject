package games.game.vo;

public class GameDetailVO {
    private String gameId;
    private String gameName;
    private String gamePrice;
    private String gameDate;
    private String gameDev;
    private String gameImg;
    private String gameVideo;
    private String ageGrade;
    private String detailName;
    private String cateName;
    private String pubName;

    public GameDetailVO() {
    }

    public String getGameId() {
        return this.gameId;
    }

    public void setGameId(String gameId) {
        this.gameId = gameId;
    }

    public String getGameName() {
        return this.gameName;
    }

    public void setGameName(String gameName) {
        this.gameName = gameName;
    }

    public String getGamePrice() {
        return this.gamePrice;
    }

    public void setGamePrice(String gamePrice) {
        this.gamePrice = gamePrice;
    }

    public String getGameDate() {
        return this.gameDate;
    }

    public void setGameDate(String gameDate) {
        this.gameDate = gameDate;
    }

    public String getGameDev() {
        return this.gameDev;
    }

    public void setGameDev(String gameDev) {
        this.gameDev = gameDev;
    }

    public String getGameImg() {
        return this.gameImg;
    }

    public void setGameImg(String gameImg) {
        this.gameImg = gameImg;
    }

    public String getGameVideo() {
        return this.gameVideo;
    }

    public void setGameVideo(String gameVideo) {
        this.gameVideo = gameVideo;
    }

    public String getAgeGrade() {
        return this.ageGrade;
    }

    public void setAgeGrade(String ageGrade) {
        this.ageGrade = ageGrade;
    }

    public String getDetailName() {
        return this.detailName;
    }

    public void setDetailName(String detailName) {
        this.detailName = detailName;
    }

    public String getCateName() {
        return this.cateName;
    }

    public void setCateName(String cateName) {
        this.cateName = cateName;
    }

    public String getPubName() {
        return this.pubName;
    }

    public void setPubName(String pubName) {
        this.pubName = pubName;
    }
}
