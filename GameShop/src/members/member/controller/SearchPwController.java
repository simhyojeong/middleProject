package members.member.controller;

import java.io.IOException;
import java.util.Properties;
import java.util.Random;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import members.member.service.IMemberService;
import members.member.service.MemberServiceImpl;
import members.member.vo.MemberVO;

@WebServlet("/members/searchPw.do")
public class SearchPwController extends HttpServlet {

	Random rd = new Random();
	private int num = rd.nextInt(999999); // 랜덤 난수

	private String html = "<!DOCTYPE html>\r\n"
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
			+ "                <h3 style=\"margin: 0;padding: 0;box-sizing: border-box;font-family: &quot;hind&quot;, sans-serif;text-decoration: none;text-align: center;color: #f1f1f1;\"><p><span style='font-size:16px'>Beans Games Store</span><br/>임시 비밀번호 발급</p></h3>\r\n"
			+ "            </div>\r\n" + "            <input type=\"submit\" value=\"" + num
			+ "\" class=\"login-btn\" disabled style=\"margin: 0;padding: 0;box-sizing: border-box;font-family: &quot;hind&quot;, sans-serif;text-decoration: none;text-align: center;width: 100%;height: 50px;margin-top: 30px;background: #191919;border: none;outline: none;text-transform: uppercase;font-weight: 700;color: #f1f1f1;transition: .3s linear;\">\r\n"
			+ "        </form>\r\n" + "\r\n"
			+ "        <div class=\"dont-have-account\" style=\"margin: 20px 0;padding: 0;box-sizing: border-box;font-family: &quot;hind&quot;, sans-serif;text-decoration: none;text-align: center;font-size: 16px;color: #f4f4f480;\">\r\n"
			+ "            위의 번호로 비밀번호가 설정되었습니다.<br style=\"margin: 0;padding: 0;box-sizing: border-box;font-family: &quot;hind&quot;, sans-serif;text-decoration: none;text-align: center;\">\r\n"
			+ "            <a href=\"http://localhost/members/login.do\" style=\"margin: 0;padding: 0;box-sizing: border-box;font-family: &quot;hind&quot;, sans-serif;text-decoration: none;text-align: center;color: #f1f1f1;font-size: 12px;\">로그인하러 가기</a>\r\n"
			+ "        </div>\r\n" + "\r\n"
			+ "        <div style=\"font-size: 11px;color: #f4f4f4;background-color: #636363;line-height: 1.3em;padding: 10px 30px;margin-top: 30px;margin: 0;box-sizing: border-box;font-family: &quot;hind&quot;, sans-serif;text-decoration: none;text-align: center;\">\r\n"
			+ "            본 메일은 발신 전용이므로 답변으로 문의는 불가능합니다.<br style=\"margin: 0;padding: 0;box-sizing: border-box;font-family: &quot;hind&quot;, sans-serif;text-decoration: none;text-align: center;\">\r\n"
			+ "            다른 궁금하신 사항은 웹사이트(\r\n"
			+ "            <a href=\"localhost/main.do\" target=\"_blank\" style=\"margin: 0;padding: 0;box-sizing: border-box;font-family: &quot;hind&quot;, sans-serif;text-decoration: none;text-align: center;color: gold;\">메인화면 상단</a>\r\n"
			+ "            )의 FAQ에서 확인 또는 Q&A에서 문의해 주세요.<br style=\"margin: 0;padding: 0;box-sizing: border-box;font-family: &quot;hind&quot;, sans-serif;text-decoration: none;text-align: center;\"><br style=\"margin: 0;padding: 0;box-sizing: border-box;font-family: &quot;hind&quot;, sans-serif;text-decoration: none;text-align: center;\">Copyright 2022 All rights reserved.\r\n"
			+ "        </div>\r\n" + "</div></div></body>\r\n" + "</html>";

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		IMemberService mService = MemberServiceImpl.getInstance();

		String memId = req.getParameter("memId");
		String memMail = req.getParameter("memMail");
		String memPh = req.getParameter("memPh");
		MemberVO mv = new MemberVO();

		mv.setMemId(memId);
		mv.setMemMail(memMail);
		mv.setMemPh(memPh);

		String memPw = mService.searchPw(mv);

		// 해당 이름과 핸드폰번호를 가진 회원이 존재하는지 확인
		if (memPw != null) {
			
			String memName = mService.getMember(memId).getMemName();
			
			mv.setMemName(memName);
			mv.setMemPw(Integer.toString(num));

			mService.updatePw(mv);

			// 네이버일 경우 smtp.naver.com 을 입력합니다.
			// Google일 경우 smtp.gmail.com 을 입력합니다.
			String host = "smtp.gmail.com";
			final String username = "candijc123"; // 네이버 아이디를 입력해주세요. @nave.com은 입력하지 마시구요.
			final String password = "uegxrbqybqftbfwg"; // 네이버 이메일 비밀번호를 입력해주세요.
			int port = 465; // 포트번호 // 메일 내용
			String recipient = memMail; // 받는 사람의 메일주소를 입력해주세요.
			String subject = "BeansGameShop 임시비밀번호 발급"; // 메일 제목 입력해주세요.
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

			HttpSession msgSession = req.getSession();
			msgSession.setAttribute("msg", "임시비밀번호를 메일로 전송하였습니다. 확인해주십시오.");
			resp.sendRedirect(req.getContextPath() + "/members/searchId.do");

		} else {
			HttpSession msgSession = req.getSession();
			msgSession.setAttribute("msg", "해당 정보의 회원이 존재하지 않습니다.");
			resp.sendRedirect(req.getContextPath() + "/members/searchId.do");
		}
	}

}