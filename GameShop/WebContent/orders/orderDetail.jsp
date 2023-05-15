<%@page import="java.util.List"%>
<%@page import="games.game.vo.GameVO"%>
<%@page import="orders.cart.vo.CartVO"%>
<%@page import="games.game.vo.DiscountVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String totalPrice = (String) request.getAttribute("totalPrice");
	List<GameVO> gameInfoList = (List<GameVO>) request.getAttribute("gameInfoList");
	List<String> cartIdList = (List<String>) request.getAttribute("cartIdList");
	List<DiscountVO> discountList = (List<DiscountVO>) request.getAttribute("discountList");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>결 제</title>
<link rel="stylesheet" href="../css/pay.css">
</head>
<body>
<div class="wrapper">
	<div class="payment-summaries payment-summaries--mutiple">
		<span class="payment-title payment-summaries__title">주문 요약</span>
		<div style="color: white; font-size: 16px; padding:5px; padding-top:35px;"><%=gameInfoList.size()%>개의 게임을 결제합니다
		</div>
		<%
			if (gameInfoList.size() > 0) {
			for (int i = 0; i < gameInfoList.size(); i++) {
		%>
		<div class="payment-summaries__scroll-container" id="payment-summaries__scroll-container">
			<div class="payment-offer-summary payment-offer-summary--mutiple">
				<div class="payment-offer-summary__content">
					<h2 class="payment-offer-summary__title"><%=gameInfoList.get(i).getGameName()%></h2>
					<span class="payment-offer-summary__origin-price"></span> <span class="payment-offer-summary__current-price">₩ <%=gameInfoList.get(i).getGamePrice()%></span>
				</div>
				<div class="payment-offer-summary__thumbnail-wrap">
					<img alt="<%=gameInfoList.get(i).getGameName()%>" src="<%=gameInfoList.get(i).getGameImg()%>" class="payment-offer-summary__thumbnail">
				</div>
			</div>
			<div class="payment-order-summary payment-summaries__order">
				<div class="payment-price">
					<div class="payment-price__label">
						<span>가격</span>
					</div>
					<div class="payment-price__value">
						<span>₩ <%=gameInfoList.get(i).getGamePrice()%></span>
					</div>
				</div>
				<%
					if (discountList.isEmpty()) { //한시적무료 없을때
				%>
				<div class="payment-price">
					<div class="payment-price__label">
						<span>판매 할인</span>
					</div>
					<div class="payment-price__value">
						-<span>₩ 0</span>
					</div>
				</div>
				<%
					} else { //한시적 무료 존재할때
				for (DiscountVO vo : discountList) {
					// 한시적무료게임의 경우
					if (vo.getGameId().equals(gameInfoList.get(i).getGameId())) {
				%>
				<div class="payment-price">
					<div class="payment-price__label">
						<span>판매 할인</span>
					</div>
					<div class="payment-price__value">
						-<span>₩ <%=gameInfoList.get(i).getGamePrice()%></span>
					</div>
				</div>
				<%
					} else { // 한시적무료게임이 아닌경우
				%>
				<div class="payment-price">
					<div class="payment-price__label">
						<span>판매 할인</span>
					</div>
					<div class="payment-price__value">
						-<span>₩ 0</span>
					</div>
				</div>
				<%
					}
				}
				}
				%>
				<%
					}
				}
				%>
				<!-- 여긴 하나만 출력  -->
				<hr class="payment-summaries__divider">
				<div class="payment-price">
					<div class="payment-price__label payment-price__label--YOUPAY">
						<span>합계</span>
					</div>
					<div class="payment-price__value payment-price__value--YOUPAY">
						<span>₩ <%=totalPrice%></span>
					</div>
				</div>
			</div>
			<footer class="payment-contact-us">
				<p>
					<span style="color:gray;">도움이 필요하신가요?</span>&nbsp;<a id="call" href="/faq/listFaq.do" target="_blank" rel="noopener noreferrer" ><span>문의하기</span></a>
				</p>
			</footer>
		</div>
		<%
			String cartIdPara = "";
		int size2 = cartIdList.size();
		if (size2 > 0) {
			for (int i = 0; i < size2; i++) {
				cartIdPara += "&cartIdPara" + "=" + cartIdList.get(i);
			}
		}
		%>
		<%
			if (totalPrice.equals("0")) {
		%>
		<div class="payment-order-confirm">
			<button class="payment-btn payment-order-confirm__btn payment-btn--disabled payment-btn--primary" onClick="location.href='../order/SuccessOrderController.do?><%=cartIdPara%>'">
				<div class="payment-loading">
					<div class="payment-loading__container">
						<span>주문하기</span>
					</div>
				</div>
			</button>
		</div>
		<%
			} else {
		%>
		<div class="payment-order-confirm">
			<button class="payment-btn payment-order-confirm__btn payment-btn--disabled payment-btn--primary" onClick="location.href='../order/kakaoPayController.do?totalPrice=<%=totalPrice%><%=cartIdPara%>'">
				<div class="payment-loading">
					<div class="payment-loading__container">
						<span>주문하기</span>
					</div>
				</div>
			</button>
		</div>
		<%
			}
		%>
	</div>
	</div>
</body>
</html>