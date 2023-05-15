package members.member.controller;

import java.io.BufferedReader;
import java.io.DataOutputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.URL;
import javax.net.ssl.HttpsURLConnection;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import members.member.service.IMemberService;
import members.member.service.MemberServiceImpl;
import members.member.vo.MemberVO;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;

@WebServlet({ "/members/validation.do" })
public class CaptchaValidation extends HttpServlet {
	public CaptchaValidation() {
	}

	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String gRecaptchaResponse = req.getParameter("g-recaptcha-response");
		JSONObject json = this.getJSONResponse(gRecaptchaResponse);
		boolean isSuccess = (Boolean) json.get("success");

		req.setAttribute("gRecaptchaResponse", gRecaptchaResponse);
		req.setAttribute("isSuccess", isSuccess);
		req.setAttribute("json", json.toString());

		IMemberService memService = MemberServiceImpl.getInstance();
		HttpSession session = req.getSession();
		String memId = req.getParameter("login_id");
		String memPw = req.getParameter("login_pw");

		if (memId.equals("admin") && memPw.equals("1234")) {
			session.setAttribute("loginAdmin", memId);
			session.setMaxInactiveInterval(10000);
			resp.sendRedirect(req.getContextPath() + "/main.do");
		} else {
			MemberVO loginMember = new MemberVO(memId, memPw);
			MemberVO member = memService.loginMember(loginMember);
			HttpSession sessionMsg;

			if (member != null) {
				if (member.getMemAuth().equals("x")) {
					sessionMsg = req.getSession();
					sessionMsg.setAttribute("msg", "이메일 인증 완료 후 로그인이 가능합니다");
					resp.sendRedirect(req.getContextPath() + "/members/login.do");

				}else {
					session.setAttribute("loginMember", member);
					session.setMaxInactiveInterval(10000);
					resp.sendRedirect(req.getContextPath() + "/main.do");
				}
			} else {
				sessionMsg = req.getSession();
				sessionMsg.setAttribute("msg", "아이디 또는 비밀번호를 확인해주세요");
				resp.sendRedirect(req.getContextPath() + "/members/login.do");
			}
		}

	}

	private JSONObject getJSONResponse(String gRecaptchaResponse) {
		String url = "https://www.google.com/recaptcha/api/siteverify";
		String secretKey = "6LdANMgjAAAAALHDsCP1Fxl9kcodTUsL_hjLkaXw";
		String response = this.getResponse(url, secretKey, gRecaptchaResponse);
		JSONObject json = this.getJSONObject(response);
		return json;
	}

	private JSONObject getJSONObject(String jsonString) {
		JSONObject json = new JSONObject();

		try {
			JSONParser parser = new JSONParser();
			json = (JSONObject) parser.parse(jsonString);
			System.out.println("json: " + json.toJSONString());
		} catch (Exception var4) {
		}

		return json;
	}

	private String getResponse(String url, String secretKey, String gRecaptchaResponse) {
		String response = "";

		try {
			URL urlObject = new URL(url);
			HttpsURLConnection connection = (HttpsURLConnection) urlObject.openConnection();
			connection.setRequestMethod("POST");
			connection.setDoOutput(true);
			String param = "secret=" + secretKey + "&response=" + gRecaptchaResponse;
			DataOutputStream stream = new DataOutputStream(connection.getOutputStream());
			stream.writeBytes(param);
			stream.flush();
			stream.close();

			BufferedReader reader;
			String inputLine;
			for (reader = new BufferedReader(new InputStreamReader(
					connection.getInputStream())); (inputLine = reader.readLine()) != null; response = response
							+ inputLine) {
			}

			reader.close();
		} catch (Exception var11) {
		}

		return response;
	}
}
