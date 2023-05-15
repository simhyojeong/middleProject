<%@page import="games.publisher.vo.PublisherVO"%>
<%@page import="games.category.vo.CategoryDetailVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	List<CategoryDetailVO> cateList = (List<CategoryDetailVO>) request.getAttribute("cateList");
	List<PublisherVO> pubList = (List<PublisherVO>) request.getAttribute("pubList");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게임 추가</title>

<link rel="stylesheet" href="../css/gameListAdmin.css">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.13.1/css/bootstrap-select.css" />

<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
</head>
<body>
	<header id="header-container-fluid">
		<jsp:include page="/main/header.jsp" />
	</header>
<!-- 	<br> -->
<div class="container-fluid">
	<div class="row">
    <div class="column side">
	<div class="col-lg-3 col-md-3 col-sm-3 sidebar-section hidden-xs" style="background-color: #121212;">
		<br> <br> <br> <br>
		<div class="container sidebar-container" style="margin-left: 15px">
			<div class="navigation-section" style="width:230px; padding-left: 30px; ">
				<!-- 회원 정보 변경 버튼 -->
				<button class="setting col-sm-12 col-md-12 password " id="btn0">
					회원관리<i class="glyphicon glyphicon glyphicon-menu-right pull-right visible-xs custom-chevron"></i>
				</button>
				<button class="setting col-sm-12 col-md-12 password" id="btn1">
					게임 관리<i class="glyphicon glyphicon glyphicon-menu-right pull-right visible-xs custom-chevron"></i>
				</button>
				<button class="setting col-sm-12 col-md-12 personal-info active" id="btn2">
					게임 추가<i class="glyphicon glyphicon glyphicon-menu-right pull-right visible-xs custom-chevron"></i>
				</button>
				<button class="setting col-sm-12 col-md-12 password " id="btn3">
					무료 게임 설정<i class="glyphicon glyphicon glyphicon-menu-right pull-right visible-xs custom-chevron"></i>
				</button>
				<button class="setting col-sm-12 col-md-12 password " id="btn4">
					리뷰 관리<i class="glyphicon glyphicon glyphicon-menu-right pull-right visible-xs custom-chevron"></i>
				</button>
				<button class="setting col-sm-12 col-md-12 password " id="btn5">
					코드 발급<i class="glyphicon glyphicon glyphicon-menu-right pull-right visible-xs custom-chevron"></i>
				</button>
			</div>
		</div>
	</div>
	</div>
	<div class="column middle">
<!-- 	<div class="h1" style="padding:50px 50px 20px 50px; color:#ddd;">Game Register</div> -->
	<div class="col-md-9 col-lg-9 col-sm-9 main-section" style="background-color: #121212;">
		<div>
			<div class="">
				<div>
					<div class="">
						<div>
							<div class="main-container password-container">
								<div>
									<form action="/InsertGame.do" method="post" enctype="multipart/form-data">
										<div class="row">
											<div class="col-md-12 password-form-column">
												<div class="container form-container password-form-container" style="padding-top:70px;">
													<div>
														<div class="title-section">
															<div class="h2" style="color:#ddd; padding-bottom:10px;">게임 등록</div>
															<p class="description" style="color: #gray;">새로운 게임을 등록합니다.</p>
														</div>
														<div class="form--body">
															<div class="form--body-column">
																<div class="password-inner-container">
																	<div class="password-fields form-fields">
																		<div class="form-field--section clearfix">
																			<div class="form-group clearfix">
																				<div>
																					<div class="form-field form-field--custom password-field">
																						<input class="input confirmPassword" type="text" maxlength="60" minlength="0" autocomplete="off" name="title" placeholder="NAME" value="" style="margin:0px auto 10px;">
																					</div>
																					<!-- 이미지, 영상 등록 -->
																					<div class="custom-file" style="padding-bottom:50px;">
																						<input type="file" class="custom-file-input" id="cover" name="cover" >
																						<label class="custom-file-label"for="customFile" style="background: #121212; color: #DDDDDD; border: none; border-radius: 5px;">COVER</label>
																					</div>
																				<div class="custom-file">
																						<input type="file" class="custom-file-input" id="trailer" name="trailer">
																						<label class="custom-file-label " for="customFile" style="background: #121212; color: #DDDDDD; border: none; border-radius: 5px;">TRAILER</label>
																					</div>
																					
																					
																					<div class="form-field form-field--custom password-field">
																						<input class="input confirmPassword" type="text" maxlength="100" autocomplete="off" name="price" placeholder="PRICE" value="" >
																					</div>
																					<div class="form-field form-field--custom password-field">
																						<input class="input confirmPassword" type="text" maxlength="100" minlength="0" autocomplete="off" name="age" placeholder="AGE" value="" >
																					</div>
																					<div class="form-field form-field--custom password-field">
																						<input class="input confirmPassword" type="text" maxlength="100" minlength="0" autocomplete="off" name="developer" placeholder="개발사" value="" >
																					</div>
																					<!-- 달력 영역 -->
																					<div style="margin: 10px 0 0 12px">
																					<laebl>RELDATE</laebl>
																					<input type="date" name="name" style="font-size: 14px; background: #121212; border: 0; color: #9A9DA0; display: block; padding: 5px; margin-top:8px; "/>
																					</div>
																					<div style="margin: 10px 0 0 12px">
																						<label>퍼블리셔</label><br>
																						<select class="selectpicker" data-style="btn-link" data-width="300px" multiple data-live-search="true" name="publisher" autocomplete="off">
																							<%
																								for (int i = 0; i < pubList.size(); i++) {
																							%>
																							<option value="<%=pubList.get(i).getPubName()%>"><%=pubList.get(i).getPubName()%></option>
																							<%
																								}
																							%>
																						</select>
																					</div>
																					<div style="margin: 10px 0 0 12px">
																						<label>JENRE</label><br>
																						<select class="selectpicker" data-style="btn-link" data-width="300px" multiple data-live-search="true" name="jenre">
																							<%
																								for (int i = 0; i < cateList.size(); i++) {
																								if (cateList.get(i).getCateName().equals("장르")) {
																							%>
																							<option value="<%=cateList.get(i).getDetailId()%>"><%=cateList.get(i).getDetailName()%></option>
																							<%
																								}
																							}
																							%>
																						</select>
																					</div>
																					<div style="margin: 10px 0 0 12px">
																						<label>FUNCTION</label><br>
																						<select class="selectpicker" data-style="btn-link" data-width="300px" multiple data-live-search="true" name="function">
																							<%
																								for (int i = 0; i < cateList.size(); i++) {
																								if (cateList.get(i).getCateName().equals("기능")) {
																							%>
																							<option value="<%=cateList.get(i).getDetailId()%>"><%=cateList.get(i).getDetailName()%></option>
																							<%
																								}
																							}
																							%>
																						</select>
																					</div>
																					<div style="margin: 10px 0 0 12px">
																						<label>PLATFORM</label><br>
																						<select class="selectpicker" data-style="btn-link" data-width="300px" multiple name="platform">
																							<%
																								for (int i = 0; i < cateList.size(); i++) {
																								if (cateList.get(i).getCateName().equals("플랫폼")) {
																							%>
																							<option value="<%=cateList.get(i).getDetailId()%>"><%=cateList.get(i).getDetailName()%></option>
																							<%
																								}
																							}
																							%>
																						</select>
																					</div>
																				</div>
																			</div>
																		</div>
																	</div>
																</div>
																<div class="submit-section col-md-12">
																	<div class="submit-btns hidden-mobile password-submit" style="padding-left: 10px;">
																		<div>
<!-- 																			<button type="button" class="btn btn-default btn-custom ">Cancel</button> -->
																			<input class="btn btn-light" type="reset" value="Cancel"> &nbsp;
<!-- 																			<button type="button" class="btn btn-light">Cancel</button> -->
																			<button type="submit" class="btn btn-danger">Register</button>
																			<br><br><br>
																		</div>
																	</div>
																</div>
															</div>
														</div>
													</div>
												</div>
											</div>
										</div>
									</form>
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
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.bundle.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.13.1/js/bootstrap-select.min.js"></script>
	<script src="../js/jquery-3.6.0.min.js"></script>
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
		document.querySelector("#btn3").addEventListener("click",function(){
			window.location.href = "/DiscountAdmin.do"; 
		});
		document.querySelector("#btn4").addEventListener("click",function(){
			window.location.href = "/AdminReview.do"; 
		});
		document.querySelector("#btn5").addEventListener("click",function(){
			window.location.href = "/ListCode.do"; 
		});
		
		
		$(document).ready(function() {
		    $("#cover").on('change',function(){
		        $(this).next('.custom-file-label').html(event.target.files[0].name);
			})
		});
		
		

		
	</script>
</body>
</html>