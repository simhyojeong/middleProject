<%@page import="java.util.List"%>
<%@page import="members.member.vo.MemberVO"%>
<%@page import="games.game.vo.GameVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	List<GameVO> gameList = (List<GameVO>) request.getAttribute("list");
List<GameVO> allGameList = (List<GameVO>) request.getAttribute("allList");
List<GameVO> discountList = (List<GameVO>) request.getAttribute("discountList");
List<GameVO> allDiscountList = (List<GameVO>) request.getAttribute("allDiscountList");

String msg = (String) request.getAttribute("msg");
request.removeAttribute("msg");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<meta http-equiv="X-UA-Compatible" content="ie=edge" />
<title>Beans Games Store</title>

</head>
<body>
	<header id="header-container-fluid">
		<jsp:include page="header.jsp" />
		<jsp:include page="headerNav.jsp" />
		<%-- 		<%@ include file="header.jsp" %> --%>
		<%-- 		<jsp:include page="headerNav.jsp" /> --%>
	</header>
<!-- 	<section id="hp-prim-show"> -->
<!-- 		<div class="container"> -->
<!-- 			<div class="content"> -->
<!-- 				<div class="game-banner"> -->
<!-- 					<img id="game-banner-image" src="https://cdn2.unrealengine.com/Diesel%2Fstore%2Ffeatured-carousel-jfo-shenmue-phoenixpoint%2FFeatured-carousel-horizontal-1080-1920x1080-0168a527c1d2aa846622d3c722b2ab3f789d4def.jpg" /> -->
<!-- 				</div> -->
<!-- 				<div class="game-details"> -->
<!-- 					<div class="top"> -->
<!-- 						<div class="game-change-arrows"> -->
<!-- 							<img src="../images/icons8-chevron-left-24.png" /> <img src="../images/icons8-chevron-right-24.png" /> -->
<!-- 						</div> -->
<!-- 						<div class="active-and-other-dots"> -->
<!-- 							<span class="dot active-dot"></span> -->
<!-- 							<span class="dot"></span> -->
<!-- 							<span class="dot"></span> -->
<!-- 						</div> -->
<!-- 					</div> -->
<!-- 					<div class="main-details"> -->
<!-- 						<p class="available-bool">AVAILABLE NOW</p> -->
<!-- 						<h2 class="game-title">Phoenix Point</h2> -->
<!-- 						<p class="game-details-txt">Fight to save humanity in this turn-based strategy title from the creator of the XCOM series.</p> -->
<!-- 						<button class="shop-btn"> -->
<!-- 							Buy Now <img src="../images/icons8-right-24.png" alt="r-arrw" /> -->
<!-- 						</button> -->
<!-- 					</div> -->
<!-- 				</div> -->
<!-- 			</div> -->
<!-- 		</div> -->
<!-- 	</section> -->
 <section id="hp-prim-show">
        <div class="container">
            <!-- 1번째 슬라이드 -->
            <div class="mySlides fade">
            <div class="content">
                    <div class="game-banner">
                        <img id="game-banner-image" src="https://cdn2.unrealengine.com/the-game-awards-2022-goty-1916x1004-f88c2727ef5a.jpg" />
                    </div>
                    <div class="game-details">
                        <div class="top">
                            <div class="game-change-arrows">
                                <img src="../images/icons8-chevron-left-24.png" />
                                <img src="../images/icons8-chevron-right-24.png" />
                            </div>
                        </div>
                        <div class="main-details">
                            <p class="available-bool">NEWS</p>
                            <h2 class="game-title">Game Awards 2022:</h2>
                            <p class="game-details-txt">지난 한 해를 강타한 최고의 작품들을 <br>만나보세요!</p>
							<a href="/Game.do">
								<button class="shop-btn">
									Buy Now <img src="../images/icons8-right-24.png" alt="r-arrw" />
								</button>
							</a>
						</div>
                    </div>
                </div>
            </div>
            
            
            
            <!-- 2번째 슬라이드 -->
            <div class="mySlides fade">
            <div class="content">
                    <div class="game-banner">
                        <img id="game-banner-image" src="https://cdn2.unrealengine.com/egs-league-of-legends-lunar-ny-2023-breaker-1920x1080-805df29aeefa.jpg?h=1080&resize=1&w=1920" />
                    </div>
                    <div class="game-details">
                        <div class="top">
                            <div class="game-change-arrows">
                                <img src="../images/icons8-chevron-left-24.png" /> <img src="../images/icons8-chevron-right-24.png" />
                            </div>
                           
                        </div>
                        <div class="main-details">
                            <p class="available-bool">Free Now</p>
                            <h2 class="game-title">League of Legends</h2>
                            <p class="game-details-txt">연맞이 이벤트로 새단장한<br>소환사의 협곡이 당신을 기다립니다!</p>
                            <a href="/detailGame.do?id=game23">
                            <button class="shop-btn">
                                Play Now <img src="../images/icons8-right-24.png" alt="r-arrw" />
                            </button>
                            </a>
                        </div>
                    </div>
                </div>
            </div>
            
            <!-- 3번째 슬라이드 -->
            <div class="mySlides fade">
            <div class="content">
                    <div class="game-banner">
                        <img id="game-banner-image" src="https://cdn2.unrealengine.com/en-23br-zerobuild-1p-1920x1080-1920x1080-7bb21824d768.jpg" />
                    </div>
                    <div class="game-details">
                        <div class="top">
                            <div class="game-change-arrows">
                                <img src="../images/icons8-chevron-left-24.png" /> <img src="../images/icons8-chevron-right-24.png" />
                            </div>
                            
                        </div>
                        <div class="main-details">
                            <p class="available-bool">New Season</p>
                            <h2 class="game-title">FORTNITE</h2>
                            <p class="game-details-txt">새로운 필드, 새로운 무기, 새로운 스킨<br>새로운 재미가 함께하는 새 시즌 시작!</p>
                            <a href="/detailGame.do?id=game1">
                            <button class="shop-btn">
                                Play Now <img src="../images/icons8-right-24.png" alt="r-arrw" />
                            </button>
                            </a>
                        </div>
                    </div>
                </div>
            </div>
                    
            <!-- 도트 -->
            <br>

            <div style="text-align:center">
                <span class="dot"></span>
                <span class="dot"></span>
                <span class="dot"></span>
            </div>

        </div>
        </div>
    </section>
	<section id="new-release">
		<div class="container">
			<h3 class="heading">신작 게임</h3>
			<div class="new-games-list">
				<%
					for (int i = 0; i < 5; i++) {
				%>
				<div class="single-game">
				<a href="/detailGame.do?id=<%=gameList.get(i).getGameId()%>"> 
					<div class="img-box">
						<img class="game-img" src="<%=gameList.get(i).getGameImg().trim()%>" alt="game-pic" />
					</div>
					<h6 class="title"><%=gameList.get(i).getGameName()%></h6>
					<div class="price">₩ <%=gameList.get(i).getGamePrice()%></div>
				</a>
				</div>
				<%
					}
				%>
			</div>
		</div>
	</section>
	<section id="free-games-weekly">
		<div class="container">
			<h3 class="main-title">할인 이벤트 게임</h3>
			<div class="games">
				<%
					for (int i = 0; i < 2; i++) {
				%>
				<div class="game">
				<a href="/detailGame.do?id=<%=discountList.get(i).getGameId()%>"> 
					<img src="<%=discountList.get(i).getGameImg().trim()%>" alt="game" />
					<h5 class="is-it-free">FREE NOW</h5>
					<h4 class="name"><%=discountList.get(i).getGameName()%></h4>
					<h5 class="free-time">Free Now Until - <%=discountList.get(i).getDisEnd()%></h5>
				</a>
				</div>
				<%
					}
				%>
			</div>
		</div>
	</section>
	<section id="categories">
		<div class="container">
			<h3 class="main-title">인기 카테고리</h3>
			<div class="main-content">
				<div class="category">
					<a class="css-1672chc" role="link" href="/Game.do?detailName=액션">
						<h4 class="title">액션</h4>
					</a>
				</div>
				<div class="category">
					<a class="css-1672chc" role="link" href="/Game.do?detailName=생존">
						<h4 class="title">생존</h4>
					</a>
				</div>
				<div class="category">
					<a class="css-1672chc" role="link" href="/Game.do?detailName=슈팅">
						<h4 class="title">슈팅</h4>
					</a>
				</div>
				<div class="category">
					<a class="css-1672chc" role="link" href="/Game.do?detailName=전략">
						<h4 class="title">전략</h4>
					</a>
				</div>
				<div class="category">
					<a class="css-1672chc" role="link" href="/Game.do?detailName=퀴즈">
						<h4 class="title">퀴즈</h4>
					</a>
				</div>
			</div>
		</div>
	</section>
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
				<img src="../images/beans_logo.png" />
			</div>
		</div>
	</footer>
	
    <script>
        var slideIndex = 0;
        showSlides();

        function showSlides() {
            var i;
            var slides = document.getElementsByClassName("mySlides");
            var dots = document.getElementsByClassName("dot");
            for (i = 0; i < slides.length; i++) {
                slides[i].style.display = "none";
            }
            slideIndex++;
            if (slideIndex > slides.length) { slideIndex = 1 }
            for (i = 0; i < dots.length; i++) {
                dots[i].className = dots[i].className.replace(" active", "");
            }
            slides[slideIndex - 1].style.display = "block";
            dots[slideIndex - 1].className += " active";
            setTimeout(showSlides, 3000); // Change image every 3 seconds
        }

</script>




</body>
<link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro&display=swap" rel="stylesheet" />
<link href="/your-path-to-fontawesome/css/fontawesome.css" rel="stylesheet" />
<link href="/your-path-to-fontawesome/css/brands.css" rel="stylesheet" />
<link href="/your-path-to-fontawesome/css/solid.css" rel="stylesheet" />
<link rel="stylesheet" href="../css/main.css" />
</html>
