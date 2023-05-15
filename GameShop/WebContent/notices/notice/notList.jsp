<%@page import="members.member.vo.MemberVO"%>
<%@page import="notice.vo.NoticeVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	List<NoticeVO> notList = (List<NoticeVO>)request.getAttribute("notList");
	List<NoticeVO> list = (List<NoticeVO>)request.getAttribute("list");
	String admin = (String) session.getAttribute("loginAdmin");
	MemberVO vo = (MemberVO) session.getAttribute("loginMember");
	
	int notSize = notList.size();
	int currentPage = request.getParameter("page") == null ? 1 : Integer.parseInt(request.getParameter("page"));
	System.out.println("현재페이지" + currentPage);
	
	String msg = session.getAttribute("msg") == null ?
			"" : (String)session.getAttribute("msg");
	session.removeAttribute("msg");
%>
<!DOCTYPE html>
<html lang="ko">
<head>
<title>공지사항</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<link href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script> 
<link rel="stylesheet" href="../../css/header.css">
<style>
#boardContainer { /* 전체범위 크기,색*/
	background-color: rgb(12, 12, 12);
	height: 100vh;
}
#mainContainer {
	padding-left: 15%;
	padding-right: 15%;
}
#boradhead { /* 비회원,회원 테이블 헤드 파란색  */
	background-color: #0078f2;
}
#adminWrite { /* 관리자 테이블 글작성 버튼 헤드 배경색 */
	background-color: rgb(12, 12, 12);
}
#adminhead { /* 관리자 테이블 헤드 빨강 */
	background-color: #d32f2f;
}
#boardBody { /* 테이블 전체 배경색, 글씨 크기 */
 	background-color: rgb(12, 12, 12);
 	font-size: 1.6rem;
}
#boardHN, #boardHD, #boardHW { /* 헤더에 글씨색 중앙정렬 배경색 */
	color: #ffffff;
	background-color: #0078f2;
	text-align: center;
}
#boardHT { /* 헤더에 제목 글씨,배경 색만 */
	color: #ffffff;
	background-color: #0078f2;
	text-align: center;
}
#AboardHN, #AboardHD, #AboardHW { /* 관리자 헤더에 글씨색 중앙정렬 배경색 */
	color: #ffffff;
	background-color: #d32f2f;
	text-align: center;
}
#AboardHT { /* 관리자 헤더에 제목 글씨,배경 색만 */
	color: #ffffff;
	background-color: #d32f2f;
	text-align: center;
}
#boardTitle { /* 테이블 제목값 색 */
  	color: #ffffff;  
}
#adminTitle { /* 관리자 테이블 제목값 색 */
	color: #ffffff;
}
#pagenum { /* 페이징 번호prev,next 배경색, 테두리 안보이게 */
	background: rgb(12, 12, 12);
 	border:none; 
}
h1 {
	color: #ffffff;
}
#notId {
 width: 10%;
 color: #ffffff;
 text-align: center;
}
#notTitle {
 width: 53%;
 max-width: 0;
 overflow: hidden;
 text-overflow: ellipsis;
 white-space: nowrap;
}
#notWriter { 
  width: 12%;
  color: #ffffff; 
  text-align: center;
} 
#notDate {
 width: 25%;
 color: #ffffff;
 text-align: center;
}
.table-striped {
/* 	background-color: #F3F1FE; */
}
#pagelist{
     display: flex;  
     justify-content: center;   
}
</style>
</head>
<body id="boardContainer" class="sb-nav-fixed">
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
										class="  accent-bg-color-before"
										data-index="0" data-component="SiteNav">
										<a href="/main.do" role="menuitem" 
										class="focusable text-color-nonactive text-color-hover " onfocus="blur()"
										rel=""><p>스토어</p></a></li>
									<li role="none" id="sitenav-link-1"
										class=" active text-color-active accent-bg-color-before" data-index="1"
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
	<main id="mainContainer" class="mt-5 pt-5">
	<div class="container-fluid px-4">
		<h1 class="mt-4">공지사항</h1>
		<%
		if(admin == null){
		%>
		<div id="boardBody" class="card mb-4">
			<div class="card-body">
<!-- 				<table class="table table-hover table-striped"> -->
				<table class="table table-hover table-dark table-striped">
					<thead id="boradhead">
						<tr>
							<th id="boardHN">글번호</th>
							<th id="boardHT">제목</th>
							<th id="boardHW">작성자</th>
							<th id="boardHD">작성일</th>
						</tr>
					</thead>
					<tbody>
				
<%
// 					int count = (currentPage-1)*10 +1;
					int count = notSize - (currentPage-1)*10;
					if(list != null) {
					for(int i=0; i<list.size(); i++){
				%>
						<tr>
<%-- 							<td><%=qesList.get(i).getQesId() %></td> --%>
							<td id="notId"><%=count %></td>
							<td id="notTitle"><a id="boardTitle" href="/notice/detail.do?notId=<%=list.get(i).getNotId() %>"><%=list.get(i).getNotTitle() %></a></td>
							<td id="notWriter">admin</td>
							<td id="notDate"><%=list.get(i).getNotDate() %></td>
						</tr>
				<%
				count--;
			} //for end
					
		}else{
			
		}
    %>
    
					</tbody>
				</table>
			<!--페이지 영역 -->
            <div id="pagelist">
                  
               <ul class="pager">
                  <li class = "prev"><a id="pagenum" href="#" style="color: #0078f2">Prev</a></li>
               </ul>
               
               <!--pagination -->
               <ul class="pagination pager">
               <%
                  int sPage= (int)request.getAttribute("sPage");
                  int ePage= (int)request.getAttribute("ePage");
                  int cPage= (int)request.getAttribute("cPage");
                  
                  for(int i=sPage; i <=ePage; i++){
                     //선택된 페이지 번호 활성화 하기
                     if(i == cPage){
               %>
                  <li class="active"><a id="pagenum" href="#"><%=i %></a></li>
               <%
                     }else{
               %>
                  <li><a id="pagenum" href="#" style="color: #0078f2"><%=i %></a></li>
               <% 
                     }//if else end 
                  }//for end
               %>
               </ul>
            
               <ul class="pager">
                  <li class="next"><a id="pagenum" href="#" style="color: #0078f2">Next</a></li>
               </ul>
            </div>
            <!--페이지 영역 -->
			</div>
		</div>
		<%
		}else{
		%>
			<div id="adminWrite" class="card mb-4">
			<div class="card-header">
				<a class="btn btn-danger float-end" href="/notice/insert.do" style="background-color: #d32f2f"> <i class="fas fa-table me-1"></i>
					<i class="fas fa-edit"></i> 글 작성
				</a>
			</div>
			
			<div id="boardBody" class="card-body">
				<table class="table table-hover table-dark table-striped">
					<thead id="adminhead">
						<tr>
							<th id="AboardHN">글번호</th>
							<th id="AboardHT">제목</th>
							<th id="AboardHW">작성자</th>
							<th id="AboardHD">작성일</th>
						</tr>
					</thead>
					<tbody>
				
<%
					int count = notSize - (currentPage-1)*10;
					if(list != null) {
					for(int i=0; i<list.size(); i++){
				%>
						<tr>
							<td id="notId"><%=count %></td>
							<td id="notTitle"><a id="adminTitle" href="/notice/detail.do?notId=<%=list.get(i).getNotId() %>"><%=list.get(i).getNotTitle() %></a></td>
							<td id="notWriter">admin</td>
							<td id="notDate"><%=list.get(i).getNotDate() %></td>
						</tr>
				<%
				count--;
			} //for end
					
		}else{
			
		}
    %>
    
					</tbody>
				</table>
			<!--페이지 영역 -->
            <div id="pagelist">
                  
               <ul class="pager">
                  <li class = "prev"><a id="pagenum" href="#" style="color: #d32f2f">Prev</a></li>
               </ul>
               
               <!--pagination -->
               <ul class="pagination pager">
               <%
                  int sPage= (int)request.getAttribute("sPage");
                  int ePage= (int)request.getAttribute("ePage");
                  int cPage= (int)request.getAttribute("cPage");
                  
                  for(int i=sPage; i <=ePage; i++){
                     //선택된 페이지 번호 활성화 하기
                     if(i == cPage){
               %>
                  <li class="active"><a id="pagenum" href="#"><%=i %></a></li>
               <%
                     }else{
               %>
                  <li><a id="pagenum" href="#" style="color: #d32f2f"><%=i %></a></li>
               <% 
                     }//if else end 
                  }//for end
               %>
               </ul>
            
               <ul class="pager">
                  <li class="next"><a id="pagenum" href="#" style="color: #d32f2f">Next</a></li>
               </ul>
            </div>
            <!--페이지 영역 -->
			</div>
		</div>
		<%
			}
		%>
	</div>
	</main>
<script>
//페이지 번호 클릭 이벤트>> 다음으로 넘어가는 
$('.pagination li').on('click',function(){
//    alert($(this).text());
   location.href = "/notice/list.do?page=" + $(this).text();
// main이라는 페이지로 보내준다는것? 
});

//이전/다음 버튼 클릭 이벤트 
let currentPage = ""; 
$('.next').on('click',function(){
   //현재 페이지 == 전체 페이지 수 비교하고 같지 않을 때 
   //+1 한 현재페이지 정보를 Main(페이지처리)서블릿으로 전달 
   if(<%=request.getAttribute("cPage")%> ==  <%=request.getAttribute("ttPage")%>){
      currentPage = <%=request.getAttribute("cPage")%>;
   }else{
      //currentPage +1 ~~~~ > 서블릿으로 전달하기 
      currentPage = <%=request.getAttribute("cPage")%> +1;
   }
   location.href = "/notice/list.do?page=" + currentPage;   
});

$('.prev').on('click',function(){
   //현재페이지 ==1 과 비교하고,
   // 같지 않을 때 -1 한 현재페이지 정보를 Main(페이지처리) 서블릿으로 전달
   if(<%=request.getAttribute("cPage")%> ==  <%=request.getAttribute("sPage")%>){
      currentPage = <%=request.getAttribute("cPage")%>;
   }else{
      //currentPage +1 ~~~~ > 서블릿으로 전달하기 
      currentPage = <%=request.getAttribute("cPage")%> -1;
   }
   location.href = "/notice/list.do?page=" + currentPage;   
});
</script>

	<footer>
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
	</footer>
</body>
<link rel="stylesheet" href="../../css/main.css" />
</html> 