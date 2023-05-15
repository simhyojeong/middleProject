<%@page import="java.util.List"%>
<%@page import="faq.vo.FaqVO" %>
<%@page import="members.member.vo.MemberVO"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
<%
MemberVO vo = (MemberVO) session.getAttribute("loginMember");
String admin = (String) session.getAttribute("loginAdmin");


	List<FaqVO> faqList = (List<FaqVO>)request.getAttribute("faqList");
	String msg = session.getAttribute("msg") == null ? "" :(String)session.getAttribute("msg");
	session.removeAttribute("msg"); //꺼내온 메세지 속성 제거하기
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="../css/faq.css" rel="stylesheet">
<link rel="stylesheet" href="../css/header.css">
<title>자주 묻는 질문</title>
</head>
<body>

				<header id="egh" class="epic_games   init  " data-version="7.4.1"
				data-component="EpicGamesNav">
				<nav id="nav" class="   desktop ">
					<div>
						<div id="propNav">
							<div id="egLogo" class="egLogo cursor-pointer"
								data-component="EpicGamesToggle">
								<a href="/main.do" role="button"  onfocus="blur()"
									class="shieldLogo focusable text-color bg-color text-color-border-after"></a>
							</div>
							<a role="button" aria-label="Logo home button" id="propLogo"  onfocus="blur()"
								class="propLogo focusable  " data-component="PropertyLogo"></a>
							<div role="button" tabindex="0" id="navLine" class="nav-line   "
								data-component="DividerLine">
								<span class="lines text-color-bg text-color-before-after"></span>
							</div>
							<div class="sitenav-wrap bg-color   kb-focus"
								data-component="SiteNav">
								<ul id="siteNav" role="menubar" style="height: 3.7em;"
									class="siteNav bg-color    ">
									<li role="none" id="sitenav-link-0"
										class=" accent-bg-color-before"
										data-index="0" data-component="SiteNav"><a
										href="/main.do" role="menuitem" 
										class="focusable text-color-nonactive text-color-hover " onfocus="blur()"
										rel=""><p>스토어</p></a></li>
									<li role="none" id="sitenav-link-1"
										class=" accent-bg-color-before" data-index="1"
										data-component="SiteNav"><a href="/notice/list.do"
										role="menuitem"
										class="focusable text-color-nonactive text-color-hover " onfocus="blur()"
										rel="noopener noreferrer"><p>공지사항</p></a></li>
									<li role="none" id="sitenav-link-2"
										class=" active text-color-active accent-bg-color-before" data-index="2"
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
									<a role="menuitem" tabindex="0" href="/members/login.do"  onfocus="blur()"
										class="focusable is-logged-in text-color-hover"><i
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
	<div class="main">
	<div class="column side"></div>
	<div class="column middle">
	
	<h3 class="titleh">자주 묻는 질문</h3>
	
	<%
		int faqSize = faqList.size();
		if(faqSize > 0) {
		for(int i=0; i< faqSize; i++) {
	%>
		<div class="faq_main">
		<div class="faq_title"><%=faqList.get(i).getFaqTitle()%></div>
		<div class="faq_cont"><%=faqList.get(i).getFaqCont()%></div>
		</div>
	<% 
			}
		} else { 
	%>		
		<p>자주 묻는 질문 내역이 존재하지 않습니다.</p>
	<%
		}
	%>
	</div>	
	<div class="column side"></div>
	<div class="column footer">
	<div class="top-content">
			<div class="socials">
				<img src="../images/icons8-facebook-32.png" alt="fb" class="social" /> <img src="../images/icons8-twitter-50.png" alt="twitter" class="social" /> <img src="../images/icons8-play-button-50.png" alt="yt" class="social" />
			</div>
			<div class="small-nav">
				<img src="../images/icons8-slide-up-50.png" />
			</div>
		</div>
		<div class="res-madeby">
			<div class="resources">
				<h3 class="small-title">Resources</h3>
				<div class="content">
					<ul class="resource-ctr">
						<li>Support-A-Creator</li>
						<li>Publish on Beans Games</li>
						<li>Careers</li>
					</ul>
					<ul class="resource-ctr">
						<li>Company</li>
						<li>Fan Art Policy</li>
						<li>UX Research</li>
					</ul>
					<ul class="resource-ctr">
						<li>Store EULA</li>
						<li>Online Services</li>
						<li>Community Rules</li>
					</ul>
				</div>
			</div>
			<div class="made-by">
				<h3 class="small-title">Made By Beans Games</h3>
				<div class="content">
					<ul class="madeby-ctr">
						<li>Shadow Complex</li>
						<li>Spyjinx</li>
						<li>Unreal tournament</li>
					</ul>
				</div>
			</div>
		</div>
		<div class="text-cont">© 2023, Beans Games, Inc. All rights reserved. Beans, Beans Games, the Beans Games logo, Fortnite, the Fortnite logo, Unreal, Unreal Engine, the Unreal Engine logo, Unreal Tournament, and the Unreal Tournament logo are trademarks or registered trademarks of Beans Games, Inc. in the United States of America and elsewhere. Other brands or product names are the trademarks of their respective owners. Non-US transactions through Beans Games International, S.à r.l.</div>
		<div class="down-content">
			<div class="left-cont">
				<li>Terms of Service</li>
				<li>Privacy Policy</li>
				<li>Store Refund Policy</li>
			</div>
			<div class="right-cont">
				<img src="../images/beans_logo.png"/>
			</div>
		</div>
		</div>
	</div>
</body>
</html>