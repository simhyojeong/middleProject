package members.member.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Properties;
import java.util.Random;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import members.member.service.IMemberService;
import members.member.service.MemberServiceImpl;
import members.member.vo.MemberVO;
import util.auth.SHA256;

@WebServlet("/members/auth.do")
public class AuthMailController extends HttpServlet {
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		String href = "http://localhost/members/";
		String code = SHA256.getEncrypt(req.getParameter("mem_mail"), "cos");

		String html = "<!DOCTYPE html>\r\n"
				+ "<html lang=\"ko\" style=\"margin: 0;padding: 0;box-sizing: border-box;font-family: &quot;hind&quot;, sans-serif;text-decoration: none;text-align: center;\">\r\n"
				+ "\r\n" + "\r\n"
				+ "<head style=\"margin: 0;padding: 0;box-sizing: border-box;font-family: &quot;hind&quot;, sans-serif;text-decoration: none;text-align: center;\">\r\n"
				+ "    <meta charset=\"utf-8\" style=\"margin: 0;padding: 0;box-sizing: border-box;font-family: &quot;hind&quot;, sans-serif;text-decoration: none;text-align: center;\">\r\n"
				+ "    <title style=\"margin: 0;padding: 0;box-sizing: border-box;font-family: &quot;hind&quot;, sans-serif;text-decoration: none;text-align: center;\"></title>\r\n"
				+ "    <meta name=\"viewport\" content=\"width=device-width, initial-scale=1\" style=\"margin: 0;padding: 0;box-sizing: border-box;font-family: &quot;hind&quot;, sans-serif;text-decoration: none;text-align: center;\">\r\n"
				+ "    \r\n"
				+ "    <script src=\"https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.min.js\" charset=\"utf-8\" style=\"margin: 0;padding: 0;box-sizing: border-box;font-family: &quot;hind&quot;, sans-serif;text-decoration: none;text-align: center;\"></script>\r\n"
				+ "</head>\r\n" + "\r\n"
				+ "<body style=\"margin: 0;padding: 0;box-sizing: border-box;font-family: &quot;hind&quot;, sans-serif;text-decoration: none;text-align: center;background: #121212;min-height: 100vh;display: flex;align-items: center;justify-content: center;\">\r\n"
				+ "<div style=\"width: 80vh;margin: 0;padding: 0;box-sizing: border-box;font-family: &quot;hind&quot;, sans-serif;text-decoration: none;text-align: center;background: #121212;min-height: 60vh;display: flex;align-items: center;justify-content: center;\">\r\n"
				+ "    <div class=\"login-form\" style=\"margin: 0;padding: 30px 60px;box-sizing: border-box;font-family: &quot;hind&quot;, sans-serif;text-decoration: none;text-align: center;width: 470px;background: #202020;\">\r\n"
				+ "\r\n"
				+ "        <form action=\"\" style=\"margin: 0;padding: 0;box-sizing: border-box;font-family: &quot;hind&quot;, sans-serif;text-decoration: none;text-align: center;\">\r\n"
				+ "            <div class=\"textbox\" style=\"margin: 0;padding: 0;box-sizing: border-box;font-family: &quot;hind&quot;, sans-serif;text-decoration: none;text-align: center;width: 100%;height: 50px;position: relative;margin-top: 15px;\">\r\n"
				+ "                <h3 style=\"margin: 0;padding: 0;box-sizing: border-box;font-family: &quot;hind&quot;, sans-serif;text-decoration: none;text-align: center;color: #f1f1f1;\">회원가입 인증 단계</h3>\r\n"
				+ "            </div>\r\n"
				+ "            <div value=\" \" class=\"login-btn\" disabled style=\"margin: 0;padding: 0;box-sizing: border-box;font-family: &quot;hind&quot;, sans-serif;text-decoration: none;text-align: center;width: 100%;height: 65px;margin-top: 30px;background: #191919;border: none;outline: none;text-transform: uppercase;font-weight: 700;color: #f1f1f1;transition: .3s linear;\">\r\n"
				+ "                <br>\r\n" + "                <a href='" + href + "gmailCheckAction.jsp?code=" + code
				+ "' style=\"margin:20px 0; padding: 0;box-sizing: border-box;font-family: &quot;hind&quot;, sans-serif;text-decoration: none;text-align: center;font-size: 16px;color: gold;\">클릭하여 인증을 완료해주세요</a>\r\n"
				+ "            </div>\r\n" + "        </form>\r\n"
				+ "        <div class=\"dont-have-account\" style=\"margin: 20px 0;padding: 0;box-sizing: border-box;font-family: &quot;hind&quot;, sans-serif;text-decoration: none;text-align: center;font-size: 16px;color: #f4f4f480;\">\r\n"
				+ "            수많은 게임들이 당신을 기다리고 있습니다!<br>\r\n"
				+ "            <a href=\"localhost/members/login.do\" style=\"margin: 0;padding: 0;box-sizing: border-box;font-family: &quot;hind&quot;, sans-serif;text-decoration: none;text-align: center;color: #f1f1f1;font-size: 12px;\">로그인하러 가기</a>\r\n"
				+ "        </div>\r\n" + "\r\n"
				+ "        <div style=\"font-size: 11px;color: #f4f4f4;background-color: #636363;line-height: 1.3em;padding: 10px 30px;margin-top: 30px;margin: 0;box-sizing: border-box;font-family: &quot;hind&quot;, sans-serif;text-decoration: none;text-align: center;\">\r\n"
				+ "            본 메일은 발신 전용이므로 답변으로 문의는 불가능합니다.<br>\r\n" + "            다른 궁금하신 사항은 웹사이트(\r\n"
				+ "            <a href=\"localhost/main.do\" target=\"_blank\" style=\"margin: 0;padding: 0;box-sizing: border-box;font-family: &quot;hind&quot;, sans-serif;text-decoration: none;text-align: center;color: gold;\">메인화면 상단</a>\r\n"
				+ "            )의 FAQ에서 확인 또는 Q&A에서 문의해 주세요.<br>Copyright 2022 All rights reserved.\r\n" + "        </div>\r\n"
				+ "</div></div></body>\r\n" + "</html>";
		
		
		IMemberService memService = MemberServiceImpl.getInstance();

		req.setCharacterEncoding("UTF-8");

		String memId = req.getParameter("mem_id");
		String memPw = req.getParameter("mem_pw");
		String memMail = req.getParameter("mem_mail");
		String memName = req.getParameter("mem_name");
		String memPh = req.getParameter("mem_ph");
		String memBirth = req.getParameter("mem_birth");

		MemberVO member = new MemberVO();
		member.setMemId(memId);
		member.setMemPw(memPw);
		member.setMemMail(memMail);
		member.setMemName(memName);
		member.setMemPh(memPh);
		member.setMemBirth(memBirth);

		memService.insertMember(member);

		HttpSession sessionMsg = req.getSession();
		sessionMsg.setAttribute("msg", "이메일을 확인하여 계정 인증을 완료해주세요");

		// 인증메일 보내기
		// 네이버일 경우 smtp.naver.com 을 입력합니다.
		// Google일 경우 smtp.gmail.com 을 입력합니다.
		String host = "smtp.gmail.com";
		final String username = "candijc123"; // 네이버 아이디를 입력해주세요. @nave.com은 입력하지 마시구요.
		final String password = "uegxrbqybqftbfwg"; // 네이버 이메일 비밀번호를 입력해주세요.
		int port = 465; // 포트번호 // 메일 내용
		String recipient = memMail; // 받는 사람의 메일주소를 입력해주세요.
		String subject = "BeansGameShop의 회원이 되신걸 진심으로 환영합니다!"; // 메일 제목 입력해주세요.
		String body = ""; // 메일 내용
																											// 입력해주세요.
		Properties props = System.getProperties(); // 정보를 담기 위한 객체 생성 // SMTP 서버 정보 설정
		props.put("mail.smtp.host", host);
		props.put("mail.smtp.port", port);
		props.put("mail.smtp.auth", "true");
		props.put("mail.smtp.ssl.enable", "true");
		props.put("mail.smtp.ssl.trust", host); // Session 생성

		Session session = Session.getDefaultInstance(props, new javax.mail.Authenticator() {

			protected javax.mail.PasswordAuthentication getPasswordAuthentication() {
				return new javax.mail.PasswordAuthentication(username, password);
			}
		});

		session.setDebug(true); // for debug
		try {
			Message mimeMessage = new MimeMessage(session); // MimeMessage 생성

			// 발신자 셋팅, 보내는 사람의 이메일주소를 한번 더 입력합니다. 이때는 이메일 풀 주소를 다 작성해주세요.
			mimeMessage.setFrom(new InternetAddress(username + "@gmail.com"));
			mimeMessage.setRecipient(Message.RecipientType.TO, new InternetAddress(recipient));
			mimeMessage.setSubject(subject); // 제목셋팅
			mimeMessage.setText(body); // 내용셋팅
			mimeMessage.setContent(html, "text/html; charset=utf-8");

			Transport.send(mimeMessage); // javax.mail.Transport.send() 이용
		} catch (AddressException e) {
			e.printStackTrace();
		} catch (MessagingException e) {
			e.printStackTrace();
		}

		resp.setContentType("text/html");
		resp.setCharacterEncoding("UTF-8");
		
		HttpSession sessionAuth = req.getSession();
		sessionAuth.setAttribute("authId", memId);
		sessionAuth.setAttribute("authMail", memMail);

		// req.getRequestDispatcher("/members/login.jsp").forward(req, resp);
		resp.sendRedirect(req.getContextPath() + "/members/login.do");
	}

}