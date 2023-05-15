<%@page import="members.member.vo.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	MemberVO vo = (MemberVO) session.getAttribute("loginMember");
	String admin = (String) session.getAttribute("loginAdmin");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="../js/jquery-3.6.0.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet">
<link rel="stylesheet" href="../css/header.css">
</head>
<body>
	<div class="css-15wd2r3">
		<div class="css-1ywt3m9">
			<header id="egh" class="epic_games   init  " data-version="7.4.1"
				data-component="EpicGamesNav">
				<nav id="nav" class="   desktop ">
					<div>
						<div id="propNav">
							<div id="egLogo" class="egLogo cursor-pointer"
								data-component="EpicGamesToggle">
								<a href="/main.do" role="button"
									class="shieldLogo focusable text-color bg-color text-color-border-after" onfocus="blur()"></a>
							</div>
							<a role="button" aria-label="Logo home button" id="propLogo"
								class="propLogo focusable  " data-component="PropertyLogo" onfocus="blur()"></a>
							<div role="button" tabindex="0" id="navLine" class="nav-line   "
								data-component="DividerLine">
								<span class="lines text-color-bg text-color-before-after"></span>
							</div>
							<div class="sitenav-wrap bg-color   kb-focus"
								data-component="SiteNav">
								<ul id="siteNav" role="menubar" style="height: 3.7em;"
									class="siteNav bg-color">
									<li role="none" id="sitenav-link-0"
										class=" active text-color-active accent-bg-color-before"
										data-index="0" data-component="SiteNav">
										<a href="/main.do" role="menuitem" 
										class="focusable text-color-nonactive text-color-hover " onfocus="blur()"
										rel=""><p>스토어</p></a></li>
									<li role="none" id="sitenav-link-1"
										class=" accent-bg-color-before" data-index="1"
										data-component="SiteNav"><a href="/notice/list.do"
										role="menuitem"
										class="focusable text-color-nonactive text-color-hover " onfocus="blur()"
										rel="noopener noreferrer"><p>공지사항</p></a></li>
									<li role="none" id="sitenav-link-2"
										class=" accent-bg-color-before" data-index="2"
										data-component="SiteNav"><a href="/faq/listFaq.do"
										role="menuitem"
										class="focusable text-color-nonactive text-color-hover " onfocus="blur()"
										rel="noopener noreferrer"><p>자주묻는질문</p></a></li>
								</ul>
							</div>
						</div>
						<div id="rightNav" role="menubar"
							class="right-col  bg-color undefined" data-component="RightNav">
							<div class="rightNav bg-color">
								<div></div>
								<div id="user" class="signed-in loggedIn bg-color dropdown  "
									data-component="SignedIn">
									<%
										if (vo != null) {
									%>
									<a role="menuitem" tabindex="0"
										class="focusable is-logged-in text-color-hover" onfocus="blur()"><i
										class="eg-header-icon-user"></i><span
										class="sign-text item-label display-name text-color"><%=vo.getMemName()%></span></a>
									<ul role="menu" class="bg-color ul-left">
										<li class="" role="none" data-component="SignedIn"><a
											class="text-color-hover text-color-nonactive" onfocus="blur()"
											href="../members/updateMember.do"
											id="dropdown-link-update" data-index="1"><span>마이페이지</span> </a></li>
										<li class="" role="none" data-component="SignedIn"><a
											class="text-color-hover text-color-nonactive" onfocus="blur()"
											href="/members/registerCode.do" role="menuitem"
											id="dropdown-link-coupons" data-index="3"><span>코드 등록</span></a></li>
										<li class="" role="none" data-component="SignedIn"><a
											class="text-color-hover text-color-nonactive" onfocus="blur()"
											href="/question/list.do" role="menuitem" 
											id="dropdown-link-redeem" data-index="2"><span>Q&A</span></a></li>
										<li role="none" class=""><a
											class="text-color-hover text-color-nonactive" onfocus="blur()"
											href="/members/logout.do" role="menuitem" id="log-out"><span>로그아웃</span></a></li>
									</ul>
									<%
										} else if (admin != null) {
									%>
									<a role="menuitem" tabindex="0"
										class="focusable is-logged-in text-color-hover"  onfocus="blur()"><i
										class="eg-header-icon-user"></i><span
										class="sign-text item-label display-name text-color">admin</span></a>
									<ul role="menu" class="bg-color ul-left">
										<li class="" role="none" data-component="SignedIn"><a
											class="text-color-hover text-color-nonactive"  onfocus="blur()"
											href="/GameListAdmin.do" role="menuitem"
											id="dropdown-link-achievements" data-index="1"><span>관리자 페이지</span></a></li>
										<li class="" role="none" data-component="SignedIn"><a
											class="text-color-hover text-color-nonactive"  onfocus="blur()"
											href="/adminQuestion/list.do" role="menuitem"
											id="dropdown-link-coupons" data-index="3"><span>Q&A 답변</span></a></li>
										<li class="" role="none" data-component="SignedIn"><a
											class="text-color-hover text-color-nonactive"  onfocus="blur()"
											href="/faq/AdminFaq.do" role="menuitem"
											id="dropdown-link-coupons" data-index="3"><span>FAQ 수정</span></a></li>
										<li role="none" class=""><a
											class="text-color-hover text-color-nonactive"  onfocus="blur()"
											href="/members/logout.do" role="menuitem" id="log-out"><span>로그아웃</span></a></li>
									</ul>
									<%
										} else {
									%>
									<a role="menuitem" tabindex="0" href="/members/login.do"
										class="focusable is-logged-in text-color-hover" onfocus="blur()"><i
										class="eg-header-icon-user"></i><span
										class="sign-text item-label display-name text-color">로그인</span></a>
									<%
										}
									%>
								</div>
							</div>
						</div>
					</div>
				</nav>
			</header>
		</div>
	</div>
</body>
</html>