package members.review.vo;

public class MyReviewVO {
    private String revId;
    private String gameId;
    private String memId;
    private String memName;
    private String gameName;
    private String gameImg;
    private String revTitle;
    private String revCont;
    private String revDate;
    private int revGrade;

    public MyReviewVO() {
		super();
	}

	public MyReviewVO(String revId, String gameId, String gameName, String gameImg, String revTitle, String revCont, String revDate, int revGrade) {
        this.revId = revId;
        this.gameId = gameId;
        this.gameName = gameName;
        this.gameImg = gameImg;
        this.revTitle = revTitle;
        this.revCont = revCont;
        this.revDate = revDate;
        this.revGrade = revGrade;
    }
	

	

    public MyReviewVO(String revId, String gameId, String memId, String memName, String gameName, String gameImg,
			String revTitle, String revCont, String revDate, int revGrade) {
		this.revId = revId;
		this.gameId = gameId;
		this.memId = memId;
		this.memName = memName;
		this.gameName = gameName;
		this.gameImg = gameImg;
		this.revTitle = revTitle;
		this.revCont = revCont;
		this.revDate = revDate;
		this.revGrade = revGrade;
	}

	public String getRevId() {
        return this.revId;
    }

    public void setRevId(String revId) {
        this.revId = revId;
    }

    public String getGameId() {
        return this.gameId;
    }

    public void setGameId(String gameId) {
        this.gameId = gameId;
    }

    public String getMemId() {
        return this.memId;
    }

    public void setMemId(String memId) {
        this.memId = memId;
    }

    public String getGameName() {
        return this.gameName;
    }

    public void setGameName(String gameName) {
        this.gameName = gameName;
    }

    public String getGameImg() {
        return this.gameImg;
    }

    public void setGameImg(String gameImg) {
        this.gameImg = gameImg;
    }

    public String getRevTitle() {
        return this.revTitle;
    }

    public void setRevTitle(String revTitle) {
        this.revTitle = revTitle;
    }

    public String getRevCont() {
        return this.revCont;
    }

    public void setRevCont(String revCont) {
        this.revCont = revCont;
    }

    public String getRevDate() {
        return this.revDate;
    }

    public void setRevDate(String revDate) {
        this.revDate = revDate;
    }

    public int getRevGrade() {
        return this.revGrade;
    }

    public void setRevGrade(int revGrade) {
        this.revGrade = revGrade;
    }

	public String getMemName() {
		return memName;
	}

	public void setMemName(String memName) {
		this.memName = memName;
	}
    
    
}
