<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>결 제</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor"
	crossorigin="anonymous">
<script src="../js/jquery-3.6.0.min.js"></script>
</head>
<body>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2" crossorigin="anonymous"></script>

	<div class="modal" tabindex="-1" role="dialog" id="payModal">
		<div class="modal-dialog" style="margin-top: 150px" role="document">
			<div class="modal-content rounded-4 shadow">
				<div class="modal-body p-5">
					<div class="payment-summaries payment-summaries--mutiple">
		<span class="payment-title payment-summaries__title">주문 요약</span>
		
		<div>1개의 게임을 결제합니다</div>

		<div class="payment-summaries__scroll-container"
			id="payment-summaries__scroll-container">
			<div class="payment-offer-summary payment-offer-summary--mutiple">
				<div class="payment-offer-summary__content">
					<h2 class="payment-offer-summary__title">이름</h2>
					<!-- <p class="payment-offer-summary__author">2K Games, Inc.</p> -->
					<span class="payment-offer-summary__origin-price">25000></span><span
						class="payment-offer-summary__current-price">25000</span>
				</div>
				<div class="payment-offer-summary__thumbnail-wrap">
					<img alt="https://cdn1.epicgames.com/spt-assets/c0a1f1250e1a4fcca28ad87222ee222b/download-keywe-offer-r16ig.jpg?h=854&resize=1&w=640"
						src="https://cdn1.epicgames.com/spt-assets/c0a1f1250e1a4fcca28ad87222ee222b/download-keywe-offer-r16ig.jpg?h=854&resize=1&w=640"
						class="payment-offer-summary__thumbnail">
				</div>
			</div>
			<div class="payment-order-summary payment-summaries__order">
				<div class="payment-price">
					<div class="payment-price__label">
						<span>가격</span>
					</div>
					<div class="payment-price__value">
						<span>₩25000</span>
					</div>
				</div>
				
<!-- 				<div class="payment-price">
					<div class="payment-price__label">
						<span>판매 할인</span>
					</div>
					<div class="payment-price__value">
						-<span>₩64,900</span>
					</div>
				</div> -->
				
				

				
				
				<!-- 여긴 하나만 출력  -->
				<hr class="payment-summaries__divider">
				<div class="payment-price">
					<div class="payment-price__label payment-price__label--YOUPAY">
						<span>합계</span>
					</div>
					<div class="payment-price__value payment-price__value--YOUPAY">
						<span>₩25,000</span>
					</div>
				</div>
			</div>
			<footer class="payment-contact-us">
				<p>
					<span>도움이 필요하신가요?</span>&nbsp;<a
						href="https://www.epicgames.com/help/ko/c99" target="_blank"
						rel="noopener noreferrer"><span>문의하기</span></a>
				</p>
			</footer>
		</div>
		<div class="payment-order-confirm">
			<button class="payment-btn payment-order-confirm__btn payment-btn--disabled payment-btn--primary">
				<div class="payment-loading">
					<div class="payment-loading__container">
						<span>주문하기</span>
					</div>
				</div>
			</button>
		</div>
	</div>
				</div>
			</div>
		</div>
	</div>
<script>
$('#payModal').modal();
</script>
</body>
</html>