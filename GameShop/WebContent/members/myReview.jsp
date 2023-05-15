<%@page import="members.review.vo.MyReviewVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	// List<MyReviewVO> myrevList = (List<MyReviewVO>) request.getAttribute("myrevList");
List<MyReviewVO> myrevList = (List<MyReviewVO>) request.getAttribute("searchReview"); //if문이 실행될 때 
List<MyReviewVO> list = (List<MyReviewVO>) request.getAttribute("list");
MyReviewVO rv = (MyReviewVO) request.getAttribute("rv");

// int revSize = myrevList.size();
%>

<!DOCTYPE html>
<html lang="en">
<head>
<title>리뷰</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="../css/review.css" rel="stylesheet">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.2.3/js/bootstrap.min.js"
	integrity="sha512-eHx4nbBTkIr2i0m9SANm/cczPESd0DUEcfl84JpIuutE6oDxPhXvskMR08Wmvmfx5wUpVjlWdi82G5YLvqqJdA=="
	crossorigin="anonymous" referrerpolicy="no-referrer"></script>

<link rel="stylesheet" href="../css/mypageHeader.css">

<script>
	// 검색
	function searchName(num) {
		if (num == 0) {
			var name = document.querySelector("#searchName").value;
			if (name != null && name != "") {
				document.querySelector("#searchName").value = "";
				window.location.href = "/members/MyReview.do?gameName=" + name;
			}
		}
	}
</script>

</head>

<body>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"></script>

	<header id="header-container-fluid">
		<jsp:include page="../main/header.jsp" />
	</header>

	<div id="container">
		<div class="tabs">
			<div class="tab-2">
				<label for="tab2-1" style="padding: 32px 0px;"><a
					id="mypageId" href="/members/updateMember.jsp">회원정보</a></label> <input
					id="tab2-1" name="tabs-two" type="radio">
			</div>
			<div class="tab-2">
				<label for="tab2-2" style="padding: 32px 0px;"><a
					id="mypageId" href="/order/purchaseRecord.do">구매내역</a></label> <input
					id="tab2-2" name="tabs-two" type="radio">
			</div>
			<div class="tab-2">
				<label for="tab2-3" style="padding: 32px 0px;"><a
					id="mypageId" href="/members/MyReview.do">리뷰내역</a></label> <input
					id="tab2-3" name="tabs-two" type="radio" checked="checked">
			</div>
		</div>
	</div>




	<div class="container-fluid">
		<div class="row">
			<!-- 			<div class="column side"></div> -->
			
<div class="title_container">
			<p style="font-size:36px; margin:50px 0px 36px 0px;">리뷰내역</p>
			<p style="margin:16px 0px;">계정의 리뷰 세부사항을 확인할 수 있습니다.</p>
			</div>
			<div style="float: right; padding-right: 400px;">
			<div class="column middle">
				<div class="nav-search-container">
					<div class="css-zb6syf">
						<div class="css-1naxk52" id="SearchLayout" style="background-color: #121212">
							<div class="css-lbj87a">
								<button class="css-1iw29td">
									<span class="css-71f46r" aria-hidden="true" data-testid="icon"
										data-component="Icon"><svg class="svg-col"
											xmlns="http://www.w3.org/2000/svg" class="svg css-w1atjl"
											viewBox="0 0 21 20" preserveAspectRatio="xMidYMid meet">
										<g class="g-col"
												transform="scale(1 -1) rotate(-45 -11.93502884 -2)"
												stroke="currentColor" stroke-width="1.65" fill="none"
												fill-rule="evenodd">
										<circle class="circle-col" cx="7.70710678" cy="7.70710678"
												r="7"></circle>
										<path class="path-col" d="M15.2071068 8.62132034h5.6923881"
												stroke-linecap="square"></path></g></svg></span>
								</button>
							</div>
							<div class="css-qdcmcm">
								<div class="css-eb6zcm">
									<input class="css-w7sedp" placeholder="게임명 " id="searchName">
								</div>
							</div>
						</div>
					</div>
				</div>


				<%


				int listSize =  list.size();
				if (listSize > 0) {
				%>
				<div class="border">
				<%
					for (int i = 0; i < listSize; i++) {
				%>

				<div class="review">
					<div class="leftcol">
						<div class="game_profile">
							<h3 class="game_name"><%=list.get(i).getGameName()%></h3>
							<a href="/detailGame.do?id=<%=list.get(i).getGameId()%>"> <img
								class="game_img" src="<%=list.get(i).getGameImg().trim()%>"></a>
						</div>
					</div>

					<div class="rightcol">
						<div class="rev_grade">
							<%
								if (list.get(i).getRevGrade() == 5) {
							%>
							<span style="color: #037bee; font-size: 22px;">★★★★★</span>

							<%
								} else if (list.get(i).getRevGrade() == 4) {
							%>
							<span style="color: #037bee; font-size: 22px;">★★★★</span>

							<%
								} else if (list.get(i).getRevGrade() == 3) {
							%>
							<span style="color: #037bee; font-size: 22px;">★★★</span>
							<%
								} else if (list.get(i).getRevGrade() == 2) {
							%>
							<span style="color: #037bee; font-size: 22px;">★★</span>
							<%
								} else if (list.get(i).getRevGrade() == 1) {
							%>
							<span style="color: #037bee; font-size: 22px;">★</span>
							<%
								}
							%>

						</div>

						<div class="rev_date">
							POSTED :
							<%=list.get(i).getRevDate()%></div>
						<div class="rev_title">
							제목 :
							<%=list.get(i).getRevTitle()%></div>
						<div class="rev_cont">
							"<%=list.get(i).getRevCont()%>"
						</div>


						<div class="buttoncol"
							style="text-align: right; padding-top: 10px;">
							<a href="/members/MyReviewUpdate.do?revId=<%=list.get(i).getRevId()%>" class="btn btn-link" onfocus="blur()" style="color: #037bee">수정</a>	

							<a href="/members/MyReviewDelete.do?revId=<%=list.get(i).getRevId()%>" class="btn btn-link" onfocus="blur()" style="color: #037bee"
						onclick="return confirm('리뷰를 정말 삭제하시겠습니까?')">삭제</a>
						</div>
					</div>
				</div>
			

				<%
					} //for close
				%>
	</div>

				<div id="pageList">
					<ul class="pagination">
						<li class="prev"><a href="#"
							style="border: none; background: none; color: #037bee">Prev</a></li>
					</ul>

					<!--pagination -->
					<ul class="pagination pager">
						<%
							int sPage = (int) request.getAttribute("sPage");
						int ePage = (int) request.getAttribute("ePage");
						int cPage = (int) request.getAttribute("cPage");

						for (int j = sPage; j <= ePage; j++) {
							//선택된 페이지 번호 활성화 하기
							if (j == cPage) {
						%>
						<li class="page-item"><a class="page-link" href="#"
							style="border: none; background: none; color: #ffffff"><%=j%></a></li>
						<%
							} else {
						%>
						<li><a href="#" style="border: none; background: none; color: #037bee" ><%=j%></a></li>
						<%
							} //if else end 
						} //for end
						%>
					</ul>

					<ul class="pagination">
						<li class="next"><a href="#"
							style="border: none; background: none; color: #037bee">Next</a></li>
					</ul>
				</div>

				<%
					} else {
				%>

				<!-- 리뷰내역이 존재하지 않을때 -->
				<div class="css-map4tx">
					<div class="css-11fvpc2">
						<div class="css-zigog8">
							<div class="css-g46w8s" data-testid="icon">
								<span class="css-cvmfyy" aria-hidden="true" data-testid="icon"
									data-component="Icon"><svg
										xmlns="http://www.w3.org/2000/svg" class="svg css-w1atjl"
										viewBox="0 0 45 52">
													<g fill="none" fill-rule="evenodd">
													<path
											d="M4.058 0C1.094 0 0 1.098 0 4.075v35.922c0 .338.013.65.043.94.068.65-.043 1.934 2.285 2.96 1.553.683 7.62 3.208 18.203 7.573 1.024.428 1.313.529 2.081.529.685.013 1.137-.099 2.072-.53 10.59-4.227 16.66-6.752 18.213-7.573 2.327-1.23 2.097-3.561 2.097-3.899V4.075C44.994 1.098 44.13 0 41.166 0H4.058z"
											fill="#0078F2"></path>
													<path stroke="#FFF" stroke-width="2" stroke-linecap="round"
											stroke-linejoin="round"
											d="M14 18l4.91 2.545-2.455 4M25.544 28.705c-1.056-.131-1.806-.14-2.25-.025-.444.115-1.209.514-2.294 1.197M29.09 21.727L25 19.5l2.045-3.5"></path></g></svg></span>
							</div>
							<div class="css-cn3xcj">
								<span class="css-mywzwd" data-component="Text"> <span>리뷰
										내역이 존재하지 않습니다.</span></span>
							</div>
							<div>
								<span class="css-z3vg5b"> <a class="css-8dq9ld"
									style="text-decoration: none;" role="link" href="/Game.do">
										<span>게임 및 앱 구매하기</span>
								</a></span>
							</div>
						</div>
					</div>
				</div>



				<%
					}
				%>



			</div>
			</div>
			<!-- 			<div class="column side"></div> -->
		</div>
	</div>


	<script>
		document.querySelector("#searchName").addEventListener("keyup",
				function() {
					if (event.key == "Enter") {
						searchName(0);
					}
				});

		var page = window.location.search.indexOf("page");
		var gameName = window.location.search.indexOf("gameName");
		
		//페이지 번호 클릭 이벤트>> 다음으로 넘어가는 
		$('.pagination li').on('click', function() {
			//		    alert($(this).text());
			if(gameName < 0){
				history.replaceState({}, null, location.pathname);
				window.location.href = window.location.href + "?page=" + $(this).text();
			}else{
				if(page<0){
					window.location.href = window.location.href + "&page=" + $(this).text();
				}else{
					window.location.href = window.location.search.substr(0, window.location.search.indexOf("&")) + "&page=" + $(this).text();
				}
			}	
// 			location.href = "/members/MyReview.do?page=" + $(this).text();
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
		   if(gameName < 0){
				history.replaceState({}, null, location.pathname);
				window.location.href = window.location.href + "?page=" + currentPage;
			}else{
				if(page<0){
					window.location.href = window.location.href + "&page=" + currentPage;
				}else{
					window.location.href = window.location.search.substr(0, window.location.search.indexOf("&")) + "&page=" + currentPage;
				}
			}	
// 		   location.href = "/members/MyReview.do?page=" + currentPage;   
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
		   if(gameName < 0){
				history.replaceState({}, null, location.pathname);
				window.location.href = window.location.href + "?page=" + currentPage;   
			}else{
				if(page<0){
					window.location.href = window.location.href + "&page=" + currentPage;   
				}else{
					window.location.href = window.location.search.substr(0, window.location.search.indexOf("&")) + "&page=" + currentPage;   
				}
			}	
// 		   location.href = "/members/MyReview.do?page=" + currentPage;   
		});
		</script>
</body>
</html>