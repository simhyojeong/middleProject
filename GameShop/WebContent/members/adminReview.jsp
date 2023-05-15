<%@page import="members.review.vo.MyReviewVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	List<MyReviewVO> myrevList = (List<MyReviewVO>) request.getAttribute("myrevList");
List<MyReviewVO> adrevList = (List<MyReviewVO>) request.getAttribute("adrevList");
List<MyReviewVO> list = (List<MyReviewVO>) request.getAttribute("list");

// int revSize = myrevList.size();
%>

<!DOCTYPE html>
<html lang="en">
<head>
<title>리뷰</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="../css/adminReview.css" rel="stylesheet">
<link rel="stylesheet" href="../css/gameListAdmin.css">
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

<script>
	function searchName(num) {
		if (num == 0) {
			var name = document.querySelector("#searchName").value;
			if (name != null && name != "") {
				document.querySelector("#searchName").value = "";
				window.location.href = "/AdminReview.do?memName=" + name;
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


	<div class="container-fluid">
		<div class="row">
			<div class="column side">
				<div class="col-lg-3 col-md-3 col-sm-3 sidebar-section hidden-xs">
					<br> <br> <br> <br> <br> <br>
					<div class="container sidebar-container" style="margin-left: 15px">
						<div class="navigation-section"
							style="width: 230px; padding-left: 30px;">
							<!-- 회원 정보 변경 버튼 -->
							<button class="setting col-sm-12 col-md-12 password" id="btn0"
								style="width: 198px; height: 53.5px; font-size: 11.76px;">
								회원 관리<i
									class="glyphicon glyphicon glyphicon-menu-right pull-right visible-xs custom-chevron"></i>
							</button>
							<button class="setting col-sm-12 col-md-12 password" id="btn1"
								style="width: 198px; height: 53.5px; font-size: 11.76px;">
								게임 관리<i
									class="glyphicon glyphicon glyphicon-menu-right pull-right visible-xs custom-chevron"></i>
							</button>
							<button class="setting col-sm-12 col-md-12 password " id="btn2"
								style="width: 198px; height: 53.5px; font-size: 11.76px;">
								게임 추가<i
									class="glyphicon glyphicon glyphicon-menu-right pull-right visible-xs custom-chevron"></i>
							</button>
							<button class="setting col-sm-12 col-md-12 password " id="btn3"
								style="width: 198px; height: 53.5px; font-size: 11.76px;">
								무료 게임 설정<i
									class="glyphicon glyphicon glyphicon-menu-right pull-right visible-xs custom-chevron"></i>
							</button>
							<button class="setting col-sm-12 col-md-12 personal-info active"
								id="btn4"
								style="width: 198px; height: 53.5px; font-size: 11.76px;">
								리뷰 관리<i
									class="glyphicon glyphicon glyphicon-menu-right pull-right visible-xs custom-chevron"></i>
							</button>
							<button class="setting col-sm-12 col-md-12 password " id="btn5"
								style="width: 198px; height: 53.5px; font-size: 11.76px;">
								코드 발급<i
									class="glyphicon glyphicon glyphicon-menu-right pull-right visible-xs custom-chevron"></i>
							</button>
						</div>
					</div>
				</div>
			</div>


			<div class="column middle">

				<div class="title_container" style="padding-left: 30px;">
					<p style="font-size: 32px; margin: 80px 0px 30px 0px; color: #ddd;">리뷰내역</p>
					<p style="margin: 16px 0px; color: #999;">모든 리뷰의 세부사항을 확인할 수
						있습니다.</p>
				</div>
				<div class="nav-search-container">
					<div class="css-zb6syf">
						<div class="css-1naxk52" id="SearchLayout">
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
									<input class="css-w7sedp" placeholder="작성자" id="searchName">
								</div>
							</div>
						</div>
					</div>
				</div>

				<%
					// 				int myrevSize = myrevList.size();
				// 				if (myrevSize > 0) {
				// 				for (int i = 0; i < myrevSize; i++) {

				if (list != null) {
					for (int i = 0; i < list.size(); i++) {
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
							<span style="color: #d32f2f; font-size: 18px;">★★★★★</span>

							<%
								} else if (list.get(i).getRevGrade() == 4) {
							%>
							<span style="color: #d32f2f; font-size: 18px;">★★★★</span>
							<!-- 						<span style="color: #616161; font-size: 22px;">★</span>	 -->

							<%
								} else if (list.get(i).getRevGrade() == 3) {
							%>
							<span style="color: #d32f2f; font-size: 18px;">★★★</span>
							<!-- 						<span style="color: #616161; font-size: 22px;">★★</span> -->
							<%
								} else if (list.get(i).getRevGrade() == 2) {
							%>
							<span style="color: #d32f2f; font-size: 18px;">★★</span>
							<!-- 						<span style="color: #616161; font-size: 22px;">★★★</span> -->
							<%
								} else if (list.get(i).getRevGrade() == 1) {
							%>
							<span style="color: #d32f2f; font-size: 18px;">★</span>
							<!-- 						<span style="color: #616161; font-size: 22px;">★★★★</span> -->
							<%
								}
							%>

						</div>

						<div class="mem_name">
							작성자 :
							<%=list.get(i).getMemName()%></div>
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


							<a href="/AdminReviewDelete.do?revId=<%=list.get(i).getRevId()%>"
								class="btn btn-link" onfocus="blur()" style="color: #d32f2f"
								onclick="return confirm('리뷰를 정말 삭제하시겠습니까?')">삭제</a>
							<!-- 						
<!-- 							<button type="button" class="btn btn-link" data-toggle="modal" -->
							<!-- 								data-target="#rev_delete" style="color: #d32f2f">DELETE</button> -->
						</div>
					</div>
				</div>
				<!-- 삭제하기 Modal -->
				<!-- 							<div id="rev_delete" class="modal fade" role="dialog"> -->
				<!-- 								<div class="modal-dialog"> -->

				<!-- Modal content-->
				<!-- 									<div class="modal-content" style="background: #202020;"> -->
				<!-- 										<div class="modal-header" -->
				<!-- 											style="border-bottom: 0.3px solid #d32f2f;"> -->
				<!-- 											<h4 class="modal-title" style="color: #d32f2f;">DELETE</h4> -->
				<!-- 										</div> -->
				<!-- 										<div class="modal-body" style="padding:20px;"> -->
				<!-- 											<p style="color: #ffffff; font-size: 16px; text-align: center; margin:0px;">작성하신 리뷰를 삭제 -->
				<!-- 												하시겠습니까?</p> -->
				<!-- 										</div> -->
				<!-- 										<div class="modal-footer" -->
				<!-- 											style="border-top: 0.3px solid #d32f2f;"> -->
				<%-- 											<button type="button" class="btn btn-secondary" id="reviewDelete" onclick="location.href='/AdminReviewDelete.do?revId=<%=list.get(i).getRevId()%>'">Delete --%>
				<!-- 											</button> -->
				<!-- 											<a -->
				<%-- 												href="/AdminReviewDelete.do?revId=<%=list.get(i).getRevId()%>" --%>
				<!-- 												class="btn btn-primary" role="button" style="background:#202020;border: none;">Delete</a> -->

				<!-- 											<button type="submit" class="btn btn-danger" -->
				<!-- 												data-dismiss="modal">Cancel</button> -->
				<!-- 										</div> -->
				<!-- 									</div> -->
				<!-- 								</div> -->
				<!-- 							</div> -->

				<%
					} //for문 close
				%>

				<div id="pageList" style="padding-right: 150px;">
					<ul class="pagination">
						<li class="prev"><a href="#"
							style="border: none; background: none; color: #d32f2f;">Prev</a></li>
					</ul>

					<!--pagination -->
					<ul class="pagination pager">
						<%
							int sPage = (int) request.getAttribute("sPage");
						int ePage = (int) request.getAttribute("ePage");
						int cPage = (int) request.getAttribute("cPage");

						for (int i = sPage; i <= ePage; i++) {
							//선택된 페이지 번호 활성화 하기
							if (i == cPage) {
						%>
						<li class="page-item"><a class="page-link" href="#"
							id="pageNum"
							style="border: none; background: none; color: #ffffff;"><%=i%></a></li>
						<!-- 						<li class="page-item"><a class="page-link" href="#">3</a></li> -->
						<%
							} else {
						%>
						<li><a href="#" id="pageNum"
							style="border: none; background: none; color: #d32f2f;"><%=i%></a></li>
						<%
							} //if else end 
						} //for end
						%>
					</ul>

					<ul class="pagination">
						<li class="next"><a href="#"
							style="border: none; background: none; color: #d32f2f;">Next</a></li>
					</ul>
				</div>

				<%
					} else {
				%>

				<!-- 리뷰내역이 존재하지 않을때 -->
				<div class="css-1r4bksq">
					<div class="css-1x7xjze">
						<div class="css-1jqyn8r">
							<span class="css-1gztcf0" aria-hidden="true" data-testid="icon"
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
							<div class="css-1bmvmcg">
								<h1 class="css-1gty6cv">
									<span>아직 리뷰내역에 추가한 제품이 없습니다.</span>
								</h1>
							</div>
							<div class="css-pl0jz3">
								<span class="css-1onp491"><class
										="css-1hissmj" role="link" href="/main.do">스토어로 돌아가기</a></span>
							</div>
						</div>
					</div>
				</div>



				<%
					}
				%>


			</div>
			<!-- 			<div class="column side"></div> -->
		</div>
	</div>
	<!--  <div class="footer"> -->
	<!--   <p>Footer</p> -->
	<!-- </div>  -->





	<script>
		document.querySelector("#searchName").addEventListener("keyup",
				function() {
					if (event.key == "Enter") {
						searchName(0);
					}
				});
		
		document.querySelector("#btn0").addEventListener("click", function() {
			window.location.href = "/memberAdminList.do";
		});
		document.querySelector("#btn1").addEventListener("click", function() {
			window.location.href = "/GameListAdmin.do";
		});
		document.querySelector("#btn2").addEventListener("click", function() {
			window.location.href = "/InsertGame.do";
		});
		document.querySelector("#btn3").addEventListener("click", function() {
			window.location.href = "/DiscountAdmin.do";
		});
		document.querySelector("#btn4").addEventListener("click", function() {
			window.location.href = "/AdminReview.do";
		});
		document.querySelector("#btn5").addEventListener("click", function() {
			window.location.href = "/ListCode.do";
		});
		

		 
		
		
		var page = window.location.search.indexOf("page");
		var memName = window.location.search.indexOf("memName");
		
		//페이지 번호 클릭 이벤트>> 다음으로 넘어가는 
		$('.pagination li').on('click', function() {
// 			alert(memName);
// 			if(search == ""){
// 				window.location.href = url + "?page=" + $(this).text();
// 			}else 
			if(memName < 0){
				history.replaceState({}, null, location.pathname);
				window.location.href = window.location.href + "?page=" + $(this).text();
			}else{
				if(page<0){
					window.location.href = window.location.href + "&page=" + $(this).text();
				}else{
					window.location.href = window.location.search.substr(0, window.location.search.indexOf("&")) + "&page=" + $(this).text();
				}
			}	
// 			location.href = "/AdminReview.do?page=" + $(this).text();
// 			// main이라는 페이지로 보내준다는것? 
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
		   if(memName < 0){
				history.replaceState({}, null, location.pathname);
				window.location.href = window.location.href + "?page=" + currentPage; 
			}else{
				if(page<0){
					window.location.href = window.location.href + "&page=" + currentPage; 
				}else{
					window.location.href = window.location.search.substr(0, window.location.search.indexOf("&")) + "&page=" + currentPage; 
				}
			}
// 		   location.href = "/AdminReview.do?page=" + currentPage;   
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
		   if(memName < 0){
				history.replaceState({}, null, location.pathname);
				window.location.href = window.location.href + "?page=" + currentPage; 
			}else{
				if(page<0){
					window.location.href = window.location.href + "&page=" + currentPage; 
				}else{
					window.location.href = window.location.search.substr(0, window.location.search.indexOf("&")) + "&page=" + currentPage; 
				}
			}
// 		   location.href = "/AdminReview.do?page=" + currentPage;   
		});
		
	</script>


</body>

</html>
