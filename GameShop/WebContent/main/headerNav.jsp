<%@page import="members.member.vo.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="../css/header.css">
<script>
	function searchName(num) {
		if (num == 0) {
			var name = document.querySelector("#searchName").value;
			if (name != null && name != "") {
				document.querySelector("#searchName").value = "";
				window.location.href = "/Game.do?gameName=" + name;
			}
		} else if (num == 1) {
			var name = document.querySelector("#searchCategory").value;
			if (name != null && name != "") {
				document.querySelector("#searchName").value = "";
				window.location.href = "/Game.do?detailName=" + name;
			}
		}
	}
</script>
</head>
<body>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"></script>
	<div class="nav-container-fluid">
		<div class="nav">
			<div class="nav-search-container">
				<div class="css-zb6syf">
					<div class="css-1naxk52" id="SearchLayout">
						<div class="css-lbj87a">
							<button class="css-1iw29td">
								<span class="css-71f46r" aria-hidden="true" data-testid="icon" data-component="Icon"><svg class="svg-col" xmlns="http://www.w3.org/2000/svg" class="svg css-w1atjl" viewBox="0 0 21 20" preserveAspectRatio="xMidYMid meet">
										<g class="g-col" transform="scale(1 -1) rotate(-45 -11.93502884 -2)" stroke="currentColor" stroke-width="1.65" fill="none" fill-rule="evenodd">
										<circle class="circle-col" cx="7.70710678" cy="7.70710678" r="7"></circle>
										<path class="path-col" d="M15.2071068 8.62132034h5.6923881" stroke-linecap="square"></path></g></svg></span>
							</button>
						</div>
						<div class="css-qdcmcm">
							<div class="css-eb6zcm">
								<input class="css-w7sedp" placeholder="검색" id="searchName">
							</div>
						</div>
						<div class="css-1x89cvs"></div>
					</div>
				</div>
			</div>
			<div class="nav-menu-container">
				<div class="nav-menu">
					<div class="explore-container">
						<a class="explore-link" tabindex="0" role="link" href="/main.do">
							<div class="explore-link-body">
								<div class="explore-row">
									<span class="explore-row-span">
										<div class="explore-text">탐색</div>
									</span>
								</div>
							</div>
						</a>
					</div>
					<div class="find-container">
						<a class="find-link" tabindex="0" role="link" href="/Game.do">
							<div class="find-link-body">
								<div class="find-row">
									<span class="find-row-span">
										<div class="find-text">찾아보기</div>
									</span>
								</div>
							</div>
						</a>
					</div>
				</div>
			</div>
			<%
				if (admin == null && vo != null) {
			%>
			<div class="nav-mem-container">
				<div class="nav-mem">
					<div class="wish-container">
						<a class="wish-link" tabindex="0" role="link" href="/wishList/wishListDetail.do">
							<div class="wish-link-body">
								<div class="wish-row">
									<span class="wish-row-span">
										<div class="wish-text">위시리스트</div>
									</span>
								</div>
							</div>
						</a>
					</div>
					<div class="cart-container">
						<a class="cart-link" tabindex="0" role="link" href="/cart/cartDetail.do">
							<div class="cart-link-body">
								<div class="cart-row">
									<span class="cart-row-span">
										<div class="cart-text">&nbsp;&nbsp;&nbsp;장바구니</div>
									</span>
								</div>
							</div>
						</a>
					</div>
				</div>
			</div>
			<%
				}
			%>
		</div>
	</div>
	<script>
		document.querySelector("#searchName").addEventListener("keyup",
				function() {
					if (event.key == "Enter") {
						searchName(0);
					}
				});
	</script>
</body>
</html>