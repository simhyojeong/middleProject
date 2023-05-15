<%@page import="games.game.vo.GameVO"%>
<%@page import="orders.vo.OrderVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	List<OrderVO> orderList = (List<OrderVO>) request.getAttribute("vo");
	List<GameVO> gameList = (List<GameVO>) request.getAttribute("game");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>구매 내역</title>
</head>
<body>
	<header id="header-container-fluid">
		<jsp:include page="/main/header.jsp" />
		<jsp:include page="/main/headerNav.jsp" />
	</header>
	<form action="successOrderController.do" method="post">
		<table border="1">
			<tr>
				<th>주문아이디</th>
				<th>카트넘버</th>
				<th>주문일자</th>
			</tr>
			<%
				int orderSize = orderList.size();
			if (orderSize > 0) {
				for (int i = 0; i < orderSize; i++) {
			%>
			<tr>
				<td><%=orderList.get(i).getOrderId()%></td>
				<td><%=orderList.get(i).getCartId()%></td>
				<td><%=orderList.get(i).getOrderDate()%></td>
			</tr>
			<%
				}
			} else {
			%>
			<tr>
				<td colspan="3">주문정보가 없습니다.</td>
			</tr>
			<%
				}
			%>
		
</body>
</html>