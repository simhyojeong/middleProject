<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%
		String gameId = request.getParameter("id");
	%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>연령 제한</title>
<link rel="stylesheet" href="../css/ageLimit.css">
</head>
<body>
	<div class="css-1hpkump" data-testid="egs-overlay"
		data-component="Overlay">
		<div class="css-gfwtva">
			<div class="css-1x7xjze" data-component="WarningLayout">
				<div class="css-1jqyn8r">
					<span class="css-1gztcf0" aria-hidden="true" data-testid="icon"
						data-component="Icon"><svg
							xmlns="http://www.w3.org/2000/svg" class="svg css-w1atjl"
							viewBox="0 0 61 71">
							<path
								d="M5.4677 0C1.4741 0 0 1.4943 0 5.545v48.8775c0 .459.0179.884.0578 1.2792.0914.884-.0578 2.6306 3.0795 4.026 2.0916.9304 10.267 4.3653 24.5264 10.305 1.3801.5821 1.7684.72 2.8039.72.9224.018 1.5315-.1342 2.7912-.72 14.2692-5.7532 22.4492-9.1881 24.54-10.305 3.1363-1.6751 3.1363-4.8461 3.1363-5.3052V5.5449C60.9351 1.4943 59.4611 0 55.4674 0H5.4677z"
								fill="#0078F2"></path>
							<path
								d="M32.6667 28.3938l-1.4 6.848h-1.9542L28 28.5787V23h4.6667v5.3938zm0 13.2729H28v-4.4948h4.6667v4.4948z"
								fill="#FFF"></path></svg></span>
					<div class="css-1bmvmcg">
						<h1 class="css-1gty6cv" data-component="Heading">
							<span data-component="Message">이 게임은 18세 미만의 이용자가 플레이하기에
								부적절한 콘텐츠를 포함하고 있을 수 있습니다. 사전구매작의 경우, 등급분류 결과가 나올 때까지 구매 연령에 제한이
								있을 수 있습니다.</span>
						</h1>
					</div>
					<div class="css-iqoq9n">
						<div class="css-xvql1u" data-component="PDPAgeGate">
							<button class="css-38hacf" data-component="BaseButton"
							onclick="location.href='/detailGame.do?id=<%=gameId%>'">
								<span data-component="Message">계속</span>
							</button>
							<div class="css-iqoq9n">
								<a class="css-1672chc" role="link" href="/Game.do"><span
									data-component="Message">스토어로 돌아가기</span></a>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>