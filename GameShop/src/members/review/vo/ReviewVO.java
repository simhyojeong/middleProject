package members.review.vo;

public class ReviewVO {
	private String revId;
	private String memId;
	private String gameId;
	private String revTitle;
	private String revCont;
	private String revDate;
	private String revGrade;

	public ReviewVO(String memId, String gameId, String revTitle, String revCont, String revGrade) {
		super();
		this.memId = memId;
		this.gameId = gameId;
		this.revTitle = revTitle;
		this.revCont = revCont;
		this.revGrade = revGrade;
	}

	public ReviewVO(String revId, String memId, String gameId, String revTitle, String revCont, String revDate,
			String revGrade) {
		super();
		this.revId = revId;
		this.memId = memId;
		this.gameId = gameId;
		this.revTitle = revTitle;
		this.revCont = revCont;
		this.revDate = revDate;
		this.revGrade = revGrade;
	}

	public String getRevId() {
		return revId;
	}

	public void setRevId(String revId) {
		this.revId = revId;
	}

	public String getMemId() {
		return memId;
	}

	public void setMemId(String memId) {
		this.memId = memId;
	}

	public String getGameId() {
		return gameId;
	}

	public void setGameId(String gameId) {
		this.gameId = gameId;
	}

	public String getRevTitle() {
		return revTitle;
	}

	public void setRevTitle(String revTitle) {
		this.revTitle = revTitle;
	}

	public String getRevCont() {
		return revCont;
	}

	public void setRevCont(String revCont) {
		this.revCont = revCont;
	}

	public String getRevDate() {
		return revDate;
	}

	public void setRevDate(String revDate) {
		this.revDate = revDate;
	}

	public String getRevGrade() {
		return revGrade;
	}

	public void setRevGrade(String revGrade) {
		this.revGrade = revGrade;
	}

}
