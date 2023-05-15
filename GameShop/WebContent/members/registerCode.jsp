<%@page import="members.member.vo.MemberVO"%>
<%@page import="games.game.vo.GameVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	// GameVO gameVO = (GameVO) request.getAttribute("gameVO");
MemberVO member = (MemberVO) session.getAttribute("loginMember");
String msg = (String) session.getAttribute("msg");
String gameId = (String) session.getAttribute("gameCodeId");
String gameImg = (String) session.getAttribute("gameCodeImg");
session.removeAttribute("msg");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>제품 코드 등록</title>
</head>
<link rel="stylesheet" href="../css/registerCode.css">
<header id="header-container-fluid">
	<jsp:include page="/main/header.jsp" />
</header>
<body style="background-color: #121212; height: 100vh">
	<div class="css-1ktypff">
		<div class="css-1n8met0">
			<div class="css-s45c7f">
				<div class="css-1sqqqs8">
					<div class="css-13rr5ha">
						<div class="css-1maza8v">
							<div class="css-r7crhi">
								<!-- 사용 버튼을 누르면 해당 게임 이미지를 불러올 div -->
								<div class="css-qxp7yl">
									<%
										if (msg != null) {
										if (msg.equals("ok")) {
									%>
									<a role="link" href="/detailGame.do?id=<%=gameId%>" style="position: absolute; z-index:1;">
										<img width="300" height="400" src="<%=gameImg%>" class="css-doi34z" data-image="">
									</a>
									<%
										}
									}
									%>
								</div>
								<!-- 이미지 영역 끝 -->
							</div>
							<!-- 코드 등록하는 사이드 영역 -->
							<aside class="css-8f26af" style="width: 500px;">
								<div class="css-1b54ppn">
									<h5 class="css-1ifcw8j">
										<span>제품 등록</span>
									</h5>
								</div>
								<span class="css-11ksoqt">
									<div class="css-8nuajj">
										<span data-component="Message">사용 가능한 제품 코드를 입력하세요.</span>
									</div>
								</span>
								<!-- 코드 번호를 입력해서 전송하는 form -->
								<form class="css-1adx308" action="/members/registerCode.do" method="post">
									<label class="css-1d3w5wq" for="code"><input type="text" autocomplete="off" spellcheck="false" name="code" id="code" value="" class="css-34tx6k" maxlength="23" placeholder="00000-00000-00000-00000" required><span class="css-1qwdmuy">제품 등록</span></label>
									<!-- 코드가 존재하지 않을 경우 출력되는 영역 -->
									<!-- <span class="css-zfka1r" data-component="Message">코드가 존재하지 않습니다.</span> -->
									<div class="css-rqw2hw">
										<button class="css-vjyya4" aria-disabled="true" type="submit">
											<span>사용</span>
										</button>
									</div>
								</form>
								<%
									if (msg != null) {
									if (msg.equals("ok")) {
								%>
								<h5 class="css-1ifcw8j">
									<br> <span>제품을 성공적으로 등록했습니다!</span>
								</h5>
								<%
									} else if (msg.equals("noGameCode")) {
								%>
								<h5 class="css-1ifcw8j">
									<br> <span>해당 게임의 코드가 올바르지 않습니다.</span>
								</h5>
								<%
									} else if (msg.equals("existGame")) {
								%>
								<h5 class="css-1ifcw8j">
									<br> <span>해당 게임에 대한 구매기록이 있어 사용이 불가능합니다.</span>
								</h5>
								<%
									} else if (msg.equals("codeUse")) {
								%>
								<h5 class="css-1ifcw8j">
									<br> <span>이미 사용된 코드입니다.</span>
								</h5>
								<%
									}
								}
								%>
							</aside>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>