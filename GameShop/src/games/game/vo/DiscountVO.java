package games.game.vo;

public class DiscountVO {
    private String disId;
    private String gameId;
    private String disStart;
    private String disEnd;
    private int gamePrice;

    public DiscountVO() {
    }

    public String getDisId() {
        return this.disId;
    }

    public void setDisId(String disId) {
        this.disId = disId;
    }

    public String getGameId() {
        return this.gameId;
    }

    public void setGameId(String gameId) {
        this.gameId = gameId;
    }

    public String getDisStart() {
        return this.disStart;
    }

    public void setDisStart(String disStart) {
        this.disStart = disStart;
    }

    public String getDisEnd() {
        return this.disEnd;
    }

    public void setDisEnd(String disEnd) {
        this.disEnd = disEnd;
    }

    public int getGamePrice() {
        return this.gamePrice;
    }

    public void setGamePrice(int gamePrice) {
        this.gamePrice = gamePrice;
    }
}
