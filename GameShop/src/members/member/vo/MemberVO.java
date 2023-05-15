package members.member.vo;

public class MemberVO {

	private String memId;
	private String memPw;
	private String memName;
	private String memPh;
	private String memMail;
	private String memBirth;
	private String memQuit;
	private String memAuth;

	public MemberVO() {
		super();
	}

	public MemberVO(String memId, String memPw, String memName, String memPh, String memMail, String memBirth,
			String memQuit, String memAuth) {
		super();
		this.memId = memId;
		this.memPw = memPw;
		this.memName = memName;
		this.memPh = memPh;
		this.memMail = memMail;
		this.memBirth = memBirth;
		this.memQuit = memQuit;
		this.memAuth = memAuth;
	}

	public MemberVO(String memId, String memPw) {
		super();
		this.memId = memId;
		this.memPw = memPw;
	}

	public MemberVO(String memId) {
		super();
		this.memId = memId;
	}

	public String getMemId() {
		return memId;
	}

	public void setMemId(String memId) {
		this.memId = memId;
	}

	public String getMemPw() {
		return memPw;
	}

	public void setMemPw(String memPw) {
		this.memPw = memPw;
	}

	public String getMemName() {
		return memName;
	}

	public void setMemName(String memName) {
		this.memName = memName;
	}

	public String getMemPh() {
		return memPh;
	}

	public void setMemPh(String memPh) {
		this.memPh = memPh;
	}

	public String getMemMail() {
		return memMail;
	}

	public void setMemMail(String memMail) {
		this.memMail = memMail;
	}

	public String getMemBirth() {
		return memBirth;
	}

	public void setMemBirth(String memBirth) {
		this.memBirth = memBirth;
	}

	public String getMemQuit() {
		return memQuit;
	}

	public void setMemQuit(String memQuit) {
		this.memQuit = memQuit;
	}

	public String getMemAuth() {
		return memAuth;
	}

	public void setMemAuth(String memAuth) {
		this.memAuth = memAuth;
	}
	
}
