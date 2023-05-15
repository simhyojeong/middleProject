<%@page import="games.publisher.vo.PublisherVO"%>
<%@page import="games.publisher.vo.PublishVO"%>
<%@page import="games.category.vo.CategoryDetailVO"%>
<%@page import="games.game.vo.GameVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix ="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	List<GameVO> gameList = (List<GameVO>) request.getAttribute("gameList");
	List<GameVO> discountList = (List<GameVO>) request.getAttribute("discountList");
	List<CategoryDetailVO> cateList = (List<CategoryDetailVO>) request.getAttribute("cateList");
	List<PublisherVO> pubList = (List<PublisherVO>) request.getAttribute("pubList");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게임 관리</title>
<script src="../js/jquery-3.6.0.min.js"></script>
<link rel="stylesheet" href="../css/gameListAdmin.css">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.13.1/css/bootstrap-select.css" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
</head>
</head>
<body id="gameListAdmin-Body">
	<header id="header-container-fluid">
		<jsp:include page="/main/header.jsp" />
	</header>
	<div class="container-fluid">
	<div class="row">
        <div class="column side">
	<div class="col-lg-3 col-md-3 col-sm-3 sidebar-section hidden-xs" >
		<br> <br> <br> <br> <br> <br>
		<div class="container sidebar-container" style="margin-left: 15px">
			<div class="navigation-section" style="width:230px; padding-left: 30px; ">
				<!-- 회원 정보 변경 버튼 -->
				<button class="setting col-sm-12 col-md-12 password" id="btn0" style="font-size: 11.76px;">
					회원 관리<i class="glyphicon glyphicon glyphicon-menu-right pull-right visible-xs custom-chevron"></i>
				</button>
				<button class="setting col-sm-12 col-md-12 personal-info active" id="btn1" style="font-size: 11.76px;">
					게임 관리<i class="glyphicon glyphicon glyphicon-menu-right pull-right visible-xs custom-chevron"></i>
				</button>
				<button class="setting col-sm-12 col-md-12 password " id="btn2" style="font-size: 11.76px;">
					게임 추가<i class="glyphicon glyphicon glyphicon-menu-right pull-right visible-xs custom-chevron"></i>
				</button>
				<button class="setting col-sm-12 col-md-12 password " id="btn3" style="font-size: 11.76px;">
					무료 게임 설정<i class="glyphicon glyphicon glyphicon-menu-right pull-right visible-xs custom-chevron"></i>
				</button>
				<button class="setting col-sm-12 col-md-12 password " id="btn4" style="font-size: 11.76px;">
					리뷰 관리<i class="glyphicon glyphicon glyphicon-menu-right pull-right visible-xs custom-chevron"></i>
				</button>
				<button class="setting col-sm-12 col-md-12 password " id="btn5" style="font-size: 11.76px;">
					코드 발급<i class="glyphicon glyphicon glyphicon-menu-right pull-right visible-xs custom-chevron"></i>
				</button>
			</div>
		</div>
	</div>
	</div>
	<div class="column middle">
<!-- 	<div class="h1" style="padding:50px; color:#ddd;">Game List</div> -->
	
	<div class="col-md-9 col-lg-9 col-sm-9 main-section">
		<div>
			<div class="">
				<div>
					<div class="">
						<div>
							<div class="main-container password-container">
								<div>
									<div class="row">
										<div class="col-md-12 password-form-column">
											<div class="container form-container password-form-container" style="padding-left:0;">
												<div class="container rounded bg-#181818">
													<div class="h2" style="color:#ddd; padding-bottom:35px; padding-top:90px;">게임 목록</div>
													<div class="table-responsive">
														<table class="table align-middle text-center" style="text-align: center;">
															<thead>
																<tr style="text-align: center; color:#ddd;">
																	<th scope="col" style="text-align: center;">게임 ID</th>
																	<th scope="col" style="text-align: center;">게임 이름</th>
																	<th scope="col" style="text-align: center;">가격</th>
																	<th scope="col" style="text-align: center;">발매일</th>
																	<th scope="col" style="text-align: center;">개발사</th>
																	<th scope="col" style="text-align: center;">연령제한</th>
																</tr>
															</thead>
															<tbody style="border-top:  solid #d32f2f">
																<%
																	for (int i = 0; i < gameList.size(); i++) {
																	for (int j = 0; j < discountList.size(); j++) {
																		if (gameList.get(i).getGameId().equals(discountList.get(j).getGameId())) {
																			gameList.remove(i);
																			i--;
																		}
																	}
																}

																for (int i = 0; i < gameList.size(); i++) {
																%>
																<tr class="bg-blue align-middle" >
																	<td class="pt-3">
<%-- 																		<div class="lg-5 pl-md-1 pl-1 p-0 name" style="vertical-align: middle;"><%=gameList.get(i).getGameId()%></div> --%>
																		<%=gameList.get(i).getGameId()%>
																	</td>
																	<td class="pt-3 mt-1"><%=gameList.get(i).getGameName()%></td>
																	<td class="pt-3"><%=gameList.get(i).getGamePrice()%>원</td>
																	<td class="pt-6" style="vertical-align: middle">
																	<fmt:parseDate value="<%=gameList.get(i).getGameDate()%>" var="dateValue" pattern="yyyy-MM-dd HH:mm:ss"/>
																	<fmt:formatDate value="${dateValue}" pattern="yyyy-MM-dd"/>
																	</td>
																	<td class="pt-6" style="vertical-align: middle"><%=gameList.get(i).getGameDev()%></td>
																	<td class="pt-6" style="vertical-align: middle"><%=gameList.get(i).getAgeGrade()%></td>
																	<td class="pt-2" style="vertical-align: middle">
																		<button type="button" class="btn btn-dark" id="updateGame" data-toggle="modal" value="<%=gameList.get(i).getGameId()%>"
																			data-target="#game_modify">Upd</button>
																		
																	
																	</td>
																	<td class="pt-2" style="vertical-align: middle">
<%-- 																		<button class="btn btn-submit btn-custom" onclick="location.href='/GameDeleteAdmin.do?game_id=<%=gameList.get(i).getGameId()%>'" style="background-color: #ffffff; border: none;">삭제</button> --%>
<%-- 																		<button type="button" class="btn btn-light" data-toggle="modal" onclick="location.href='/GameDeleteAdmin.do?game_id=<%=gameList.get(i).getGameId()%>'" --%>
<!-- 																			data-target="#game_delete">삭제</button> -->
																		<button type="button" class="btn btn-dark" data-toggle="modal"
																			data-target="#game_delete">Del</button>
																	</td>
																</tr>
																<!-- 구분영역 -->
																<tr id="spacing-row">
																</tr>
																<%
																	}
																for (int i = 0; i < gameList.size(); i++) {
																%>
							<!-- 수정하기 Modal -->
						<form action="/GameUpdateAdmin.do" method="post" enctype="multipart/form-data">
						<input type="hidden" name="updateGameId" value="<%=gameList.get(i).getGameId()%>">
						
							<div id="game_modify" class="modal fade" role="dialog">
								<div class="modal-dialog modal-dialog-centered">
 
									<!-- Modal content-->
									<div class="modal-content" style="background: #202020;" >
										<div class="modal-header" style="border-bottom: 0.5px solid #d32f2f;">
<!-- 											<button type="button" class="close" data-dismiss="modal">&times;</button> -->
											<h4 class="modal-title" style="color:#d32f2f; ">GAME MODIFY</h4>
										</div>
										<div class="modal-body" style="background: #202020; text-align: left;">
											<form>
												<div class="modal_gameName">
													<label for="inputName" class="form-label" style="color: #ffffff;">Name</label>
													<input name="gameName"
														type="text" class="form-control" id="inputName" placeholder="게임 이름을 입력하세요." style="background: #202020; border: none; color: #ffffff;" 
														/>
												</div>
												<div class="modal_gamePrice">
													<label for="inputPrice" class="form-label" style="color: #ffffff;">Price</label>
													<input name="gamePrice"
														type="text" class="form-control" id="inputPrice" placeholder="게임 가격을 입력하세요." style="background: #202020; border: none; color: #ffffff;" 
														/>
												</div>
												<div class="modal_gameDate">
													<label for="inputDate" class="form-label" style="color: #ffffff;">Release Date</label>
													<input name="gameDate"
														type="date" class="form-control" id="inputDate" style="background: #202020; border: none; color: gray;" 
														/>
												</div>
												<div class="modal_ageGrade">
													<label for="inputAge" class="form-label" style="color: #ffffff;">Age Grade</label>
													<input name="ageGrade"
														type="text" class="form-control" id="inputAge" placeholder="연령제한을 입력하세요." style="background: #202020; border: none; color: #ffffff;" 
														/>
												</div>
												<div class="modal_gameDev">
													<label for="inputDev" class="form-label" style="color: #ffffff;">Developer</label>
													<input name="gameDev"
														type="text" class="form-control" id="inputDev" placeholder="게임 개발사를 입력하세요." style="background: #202020; border: none; color: #ffffff;" 
														/>
												</div>
												<div class="modal_gamePub">
													<label for="inputPub" class="form-label" style="color: #ffffff;">Publisher</label>
													<select class="selectpicker" data-style="btn-link" multiple data-live-search="true" name="publisher" >
														<%
														for (int j = 0; j < pubList.size(); j++) {
 														%>
														<option value="<%=pubList.get(j).getPubName()%>"><%=pubList.get(j).getPubName()%></option>
														<%
														}
														%>
														</select>
												</div>
												<div class="modal_gameJenre">
													<label for="inputJenre" class="form-label" style="color: #ffffff;">Jenre</label>
														<select class="selectpicker" data-style="btn-link" multiple data-live-search="true" name="jenre">
																							<%
																								for (int j = 0; j < cateList.size(); j++) {
																								if (cateList.get(j).getCateName().equals("장르")) {
																							%>
																							<option value="<%=cateList.get(j).getDetailId()%>"><%=cateList.get(j).getDetailName()%></option>
																							<%
																								}
																							}
																							%>
																						</select>
														
														
														
												</div>
												<div class="modal_gameFunc">
													<label for="inputFunc" class="form-label" style="color: #ffffff;">Function</label>
													<select class="selectpicker" data-style="btn-link"multiple data-live-search="true" name="function">
																							<%
																								for (int j = 0; j < cateList.size(); j++) {
																								if (cateList.get(j).getCateName().equals("기능")) {
																							%>
																							<option value="<%=cateList.get(j).getDetailId()%>"><%=cateList.get(j).getDetailName()%></option>
																							<%
																								}
																							}
																							%>
																						</select>
												</div>
												<div class="modal_gamePlat">
													<label for="inputPlat" class="form-label" style="color: #ffffff;">Platform</label>
													<select class="selectpicker" data-style="btn-link" multiple name="platform">
													<%
													for (int j = 0; j < cateList.size(); j++) {
													if (cateList.get(j).getCateName().equals("플랫폼")) {
													%>
													<option value="<%=cateList.get(j).getDetailId()%>"><%=cateList.get(j).getDetailName()%></option>
													<%
													}
													}
													%>
													</select>
												</div>
											</form>
										</div>
										<div class="modal-footer" style="border-top: 0.5px solid #d32f2f;">
											<button type="button" class="btn btn-secondary"
												data-dismiss="modal">Close</button>
											<button type="submit" class="btn btn-danger">Update</button>
											
										</div>
									</div>
								</div>
							</div>
							</form>
																
							<!-- 삭제하기 Modal -->
						<div id="game_delete" class="modal fade" role="dialog">
							<div class="modal-dialog modal-dialog-centered">
								<!-- Modal content-->
								<div class="modal-content" style="background: #202020;">
									<div class="modal-header"  style="border-bottom: 0.5px solid #d32f2f;">
<!-- 										<button type="button" class="close" data-dismiss="modal">&times;</button> -->
										<h4 class="modal-title" style="color:#d32f2f;">DELETE</h4>
									</div>
									<div class="modal-body" style="text-align: left;">
										<p style="color: #ffffff; font-size:18px; text-align: center;">선택하신 게임을 삭제하시겠습니까?</p>
									</div>
									<div class="modal-footer" style="border-top: 0.5px solid #d32f2f;">
										<!--<button type="button" class="btn btn-secondary" id="reviewDelete">YES -->
										<!-- </button> -->
										<a
											href="#"
											class="btn btn-secondary" role="button">YES</a>
										<button type="submit" class="btn btn-danger"
											data-dismiss="modal">NO</button>
									</div>
								</div>
							</div>
						</div>									
																<%
																	}
																for (int i = 0; i < discountList.size(); i++) {
																%>
																<tr class="bg-blue align-middle">
																	
																	<td class="pt-3">
<%-- 																		<div class="lg-5 pl-md-1 pl-1 p-0 name" style="vertical-align: middle;"><%=gameList.get(i).getGameId()%></div> --%>
																		<%=discountList.get(i).getGameId()%>
																	</td>
																	
																	
																	
																	<td class="pt-3 mt-1"><%=discountList.get(i).getGameName()%></td>
																	<td class="pt-3">
																		무료&nbsp;<strike><%=discountList.get(i).getGamePrice()%>원</strike>
																	</td>
																	
																	
																	<td class="pt-6" style="vertical-align: middle">
																	<fmt:parseDate value="<%=discountList.get(i).getGameDate()%>" var="dateValueForFree" pattern="yyyy-MM-dd HH:mm:ss"/>
																	<fmt:formatDate value="${dateValueForFree}" pattern="yyyy-MM-dd"/>
																	</td>
																	<td class="pt-6" style="vertical-align: middle"><%=discountList.get(i).getGameDev()%></td>
																	<td class="pt-6" style="vertical-align: middle"><%=discountList.get(i).getAgeGrade()%></td>
																	<td class="pt-2">
																		<button type="button" class="btn btn-dark" id="updateGame" data-toggle="modal" value="<%=gameList.get(i).getGameId()%>"
																			data-target="#game_modify">Upd</button>
																		
																	
																	</td>
																	<td class="pt-2" style="vertical-align: middle">
<%-- 																		<button class="btn btn-submit btn-custom" onclick="location.href='/GameDeleteAdmin.do?game_id=<%=gameList.get(i).getGameId()%>'" style="background-color: #ffffff; border: none;">삭제</button> --%>
<%-- 																		<button type="button" class="btn btn-light" data-toggle="modal" onclick="location.href='/GameDeleteAdmin.do?game_id=<%=gameList.get(i).getGameId()%>'" --%>
<!-- 																			data-target="#game_delete">삭제</button> -->
																		<button type="button" class="btn btn-dark" data-toggle="modal"
																			data-target="#game_delete">Del</button>
																	</td>
																</tr>
																<!-- 구분영역 -->
																<tr id="spacing-row">
																</tr>
																<%
																	}
																%>
																
														
																		
																	
																
																
																
															</tbody>
														</table>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	</div>
        <div class="column side"></div>
	</div>
	</div>
	<script>
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
// 		document.querySelector("#updateCancel").addEventListener("click",
// 				function() {
// 					$("#update").modal('hide');
// 				});
// 		document.querySelector("#deleteCancel").addEventListener("click",
// 				function() {
// 					$("#delete").modal('hide');
// 				});
	</script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.bundle.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.13.1/js/bootstrap-select.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2" crossorigin="anonymous"></script>
</body>
</html>