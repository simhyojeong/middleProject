<%@page import="members.member.vo.MemberVO"%>
<%@page import="members.review.vo.MyReviewVO"%>
<%@page import="members.review.vo.ReviewVO"%>
<%@page import="wishList.vo.WishListVO"%>
<%@page import="orders.cart.vo.CartVO"%>
<%@page import="games.game.vo.GameVO"%>
<%@page import="games.game.vo.GameDetailVO"%>
<%@page import="java.util.List"%>
<%@ taglib prefix ="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%
MemberVO vo = (MemberVO) session.getAttribute("loginMember");
List<GameDetailVO> detailList = (List<GameDetailVO>) request.getAttribute("detailList");
List<GameVO> discountList = (List<GameVO>) request.getAttribute("discountList");
List<MyReviewVO> reviewList = (List<MyReviewVO>) request.getAttribute("reviewList");
List<CartVO> cartList = (List<CartVO>) request.getAttribute("cartList");
List<WishListVO> wishList = (List<WishListVO>) request.getAttribute("wishList");
List<String> orderedGameIdList = (List<String>) request.getAttribute("orderedGameIdList");

String age15 = "https://cdn1.epicgames.com/salesEvent/salesEvent/grac_15_217x256-e9654db2c96555b4094b11bf1fa40db2";
String ageAll = "https://cdn1.epicgames.com/salesEvent/salesEvent/grac_all_217x256-d1807c2030d2f1a7b632ed99d9f02fbe";
String age18 = "https://cdn1.epicgames.com/salesEvent/salesEvent/grac_18_217x256-f30f31671bede02ec5d7eb913af1fc87";
String age12 = "https://cdn1.epicgames.com/salesEvent/salesEvent/grac_12_217x256-b1f4b4e2dd53d071c044854d929801a4";

String gameId = detailList.get(0).getGameId();
String gameName = detailList.get(0).getGameName();
String gamePrice = detailList.get(0).getGamePrice();
String gameDate = detailList.get(0).getGameDate();
String age = detailList.get(0).getAgeGrade();
String gameDev = detailList.get(0).getGameDev();
String gamePub = detailList.get(0).getPubName();
String gameImg = detailList.get(0).getGameImg();
String gameVideo = detailList.get(0).getGameVideo();

int avgRgd = 0;
String admin = (String) session.getAttribute("login");

// 위시리스트 추가하기 후 창 넘어가지 않고 detail에 남아있기위해
String msg = session.getAttribute("msg") == null ? "" : (String) session.getAttribute("msg");
session.removeAttribute("msg"); //꺼내온 메세지 속성 제거하기

session.setAttribute("gameId", gameId);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="../js/jquery-3.6.0.min.js"></script>
<link rel="stylesheet" href="../css/gameDetail.css">
<script src="../js/jquery-3.6.0.min.js"></script>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.13.1/css/bootstrap-select.css" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>



	
<title>게임상세</title>


</head>
<body>
	<header id="header-container-fluid">
		<jsp:include page="/main/header.jsp" />
		<jsp:include page="/main/headerNav.jsp" />
	</header>
	<div class="css-16c6sbl" data-component="Page">
		<div class="css-1n8met0" style="background-color: black">
			<div class="css-s45c7f" data-component="StorePageContent">
				<div class="css-1sqqqs8" data-component="StorePage">
					<script id="_schemaOrgMarkup-Product" type="application/ld+json"
						data-component="SchemaMarkup">
					</script>
					<div class="meta-schema" data-component="DocumentHead"></div>
					<div class="css-1fttcpj" data-component="ProductDetailPageLayout">
						<div class="css-g46w8s">
							<div class="css-spkfbn" data-component="TitleSectionLayout">
								<div class="css-dkvgms" data-component="HorizontalRule">
									<div></div>
								</div>
							</div>
							<div class="css-levcgr" data-component="TitleSectionLayout">
								<div class="css-1ff36h2">
									<h1 class="css-1amee4m">
										<div class="css-spkfbn" data-component="PDPTitleHeader">
											<span class="css-1p6kk8h" data-component="Text"><%=gameName%></span>
										</div>
									</h1>
								</div>
							</div>
						</div>
						<div class="css-1fttcpj"
							data-component="ResponsiveContentWithOptionalSidebarLayout">
							<div class="css-1nqq6xy">
								<div class="css-qemfat">
									<div class="css-usl2mg"
										data-component="ProductDetailPageLayout">
										<div class="css-1d3w5wq" data-component="CarouselLayout"
											style="background-color: black">
											<div class="css-vabva8" data-component="PDPCarousel">
												<div class="css-vabva8"
													data-component="PDPDesktopCarouselSlides">
													<ul class="css-1bprq3k" data-testid="carousel-slider"
														style="transform: translateX(calc(0% - 0px));">
														<li class="css-dq2ku"
															data-component="PDPDesktopCarouselSlides"><div
																class="css-15zkufr" data-component="Level">
																<div class="css-u421q6"
																	data-component="AspectRatioContainer">
																	<div class="css-han5dv">
																		<div data-component="PDPCarouselVideoSlide">
																			<div class="css-r53zlq">
																				<div class="css-122y91a"
																					data-component="HtmlPlayerComponent">
																					<%
																						if (gameVideo.contains("youtube")){
																					%>
																					<iframe frameborder="0" autoplay preload="auto" controls="controls" src=<%=gameVideo%> class="css-yxalrd"></iframe>
																					<%
																						} else if (!gameVideo.contains("https")) {
																					%>
																					<video width="560" height="315" controls="controls"
																						class="css-yxalrd" preload="auto"
																						autoplay="autoplay">
																						<source
																							src="<%=request.getContextPath()%>/movie/videoView.do?filename=<%=gameVideo%>"
																							type="video/mp4" autofocus="autofocus">
																					</video>
																					<%
																						} else {
																					%>
																					<video width="560" height="315" controls="controls"
																						class="css-yxalrd" preload="auto"
																						autoplay="autoplay">
																						<source
																							src="<%=gameVideo%>"
																							type="video/mp4" autofocus="autofocus">
																					</video>
																					<%
																						}
																					%>
																					<!-- 동영상 중단 버튼 일단 보류 -->
																					<ul data-testid="controls" class="css-uoli3e"
																						dir="ltr">
																						<li class="css-465aw5"><span
																							class="css-1xsfkfu" data-component="ProgressBar"><span
																								class="css-16unk8l"><button
																										class="css-1kuq7ep" tabindex="-1"
																										data-testid="pbButton"></button>
																									<div aria-label="진행" aria-valuetext="47초/2분 8초"
																										aria-valuemin="0" draggable="true"
																										aria-valuemax="128.469"
																										aria-valuenow="47.292399" class="css-16zeaa7"
																										role="slider">
																										<span class="css-go5dyh"
																											style="width: 36.8123%; left: 0px;"></span><span
																											aria-hidden="true" class="css-35jgdh"
																											data-testid="primaryIndicator"
																											style="left: 36.8123%;"></span><span
																											class="css-1wqd7vt"
																											style="width: 62.2718%; left: 0px;"></span><span
																											class="css-1re01x1" style="left: 0px;"></span>
																									</div></span></span></li>
																						<li><button aria-label="일시 중지"
																								aria-hidden="false" class="css-1xypy5w">
																								<span class="css-staqnu" aria-hidden="true"
																									data-testid="icon" data-component="Icon"><svg
																										xmlns="http://www.w3.org/2000/svg"
																										class="svg css-w1atjl" viewBox="0 0 10 14">
																										<path d="M0 14h3V0H0v14zM7 0v14h3V0H7z"
																											fill="currentColor" fill-rule="nonzero"></path></svg></span>
																							</button></li>
																						<li class="css-1vr7vmn"><button
																								aria-label="음소거 해제" aria-hidden="false"
																								class="css-1xypy5w" data-testid="volume-button">
																								<span class="css-staqnu" aria-hidden="true"
																									data-testid="icon" data-component="Icon"><svg
																										xmlns="http://www.w3.org/2000/svg"
																										class="svg css-w1atjl" viewBox="0 0 18 18">
																										<title>음소거됨</title><path
																											d="M13.5 9A4.5 4.5 0 0 0 11 4.97v2.21l2.45 2.45c.03-.2.05-.41.05-.63zM16 9c0 .94-.2 1.82-.54 2.64l1.51 1.51A8.796 8.796 0 0 0 18 9c0-4.28-2.99-7.86-7-8.77v2.06c2.89.86 5 3.54 5 6.71zM1.27 0L0 1.27 4.73 6H0v6h4l5 5v-6.73l4.25 4.25c-.67.52-1.42.93-2.25 1.18v2.06a8.99 8.99 0 0 0 3.69-1.81L16.73 18 18 16.73l-9-9L1.27 0zM9 1L6.91 3.09 9 5.18V1z"
																											fill="currentColor" fill-rule="nonzero"></path></svg></span><span
																									class="css-1qwdmuy" data-component="Icon">음소거됨</span>
																							</button> <span class="css-1trrhs1"
																							data-testid="volume-slide"><span
																								class="css-energd"><span
																									class="css-1xsfkfu"
																									data-component="ProgressBar"><span
																										class="css-16unk8l"><button
																												class="css-1kuq7ep" tabindex="-1"
																												data-testid="pbButton"></button>
																											<div aria-label="볼륨" aria-valuetext="0% 볼륨"
																												aria-valuemin="0" draggable="true"
																												aria-valuemax="1" aria-valuenow="0"
																												class="css-16zeaa7" role="slider">
																												<span class="css-go5dyh" style="width: 0%;"></span><span
																													aria-hidden="true" class="css-35jgdh"
																													data-testid="primaryIndicator"
																													style="left: 0%;"></span><span
																													class="css-1re01x1"></span>
																											</div></span></span></span></span></li>
																						<li class="css-1fd0ih0"><span
																							data-testid="timestamp" style="width: 29px;">0:47</span>
																							/ 2:08</li>
																						<li class="css-788mz0"
																							data-component="HtmlPlayerSettings"><button
																								aria-hidden="false" class="css-1xypy5w"
																								data-testid="settings-button">
																								<span class="css-staqnu" aria-hidden="true"
																									data-testid="icon" data-component="Icon"><svg
																										xmlns="http://www.w3.org/2000/svg"
																										class="svg css-w1atjl" viewBox="0 0 10 10">
																										<title>설정</title><path
																											d="M3.587 6.413C3.977 6.804 4.449 7 5 7s1.022-.196 1.413-.587C6.804 6.023 7 5.551 7 5s-.196-1.022-.587-1.413A1.926 1.926 0 0 0 5 3c-.551 0-1.022.196-1.413.587A1.926 1.926 0 0 0 3 5c0 .551.196 1.022.587 1.413zm5.234-.92l1.08.822c.113.078.129.187.049.328L8.917 8.38c-.064.11-.169.141-.313.094l-1.273-.493c-.337.235-.625.4-.865.493L6.274 9.79c-.033.14-.113.211-.24.211H3.966c-.128 0-.208-.07-.24-.211l-.193-1.315a3.956 3.956 0 0 1-.865-.493l-1.273.493c-.144.047-.249.016-.313-.094L.05 6.643c-.08-.14-.064-.25.048-.328l1.081-.822A3.706 3.706 0 0 1 1.155 5c0-.22.008-.383.024-.493L.1 3.685c-.113-.078-.129-.187-.049-.328L1.083 1.62c.064-.11.169-.141.313-.094l1.273.493c.337-.235.625-.4.865-.493L3.726.21C3.76.071 3.84 0 3.966 0h2.067c.128 0 .208.07.24.211l.193 1.315c.304.125.592.29.865.493l1.273-.493c.144-.047.249-.016.313.094L9.95 3.357c.08.14.064.25-.048.328l-1.081.822c.016.11.024.274.024.493 0 .22-.008.383-.024.493z"
																											fill="currentColor" fill-rule="evenodd"></path></svg></span><span
																									class="css-1qwdmuy" data-component="Icon">설정</span>
																							</button></li>
																						<li class="css-8axk8s"><button
																								aria-hidden="false" class="css-1xypy5w"
																								data-testid="fullscreen-button">
																								<span class="css-staqnu" aria-hidden="true"
																									data-testid="icon" data-component="Icon"><svg
																										xmlns="http://www.w3.org/2000/svg"
																										class="svg css-w1atjl" viewBox="0 0 14 14">
																										<title>전체 화면 시작</title><g fill="none"
																											fill-rule="evenodd">
																										<path d="M-5-5h24v24H-5z"></path>
																										<path
																											d="M2 9H0v5h5v-2H2V9zM0 5h2V2h3V0H0v5zm12 7H9v2h5V9h-2v3zM9 0v2h3v3h2V0H9z"
																											fill="currentColor" fill-rule="nonzero"></path></g></svg></span><span
																									class="css-1qwdmuy" data-component="Icon">전체
																									화면 시작</span>
																							</button></li>
																					</ul>
																					<div aria-label="일시 중지" class="css-rylixz"
																						role="status" data-testid="status-icon">
																						<span class="css-15wl14t" aria-hidden="true"
																							data-testid="icon" data-component="Icon" style=""><svg
																								xmlns="http://www.w3.org/2000/svg"
																								class="svg css-w1atjl" viewBox="0 0 10 14">
																								<path d="M0 14h3V0H0v14zM7 0v14h3V0H7z"
																									fill="currentColor" fill-rule="nonzero"></path></svg></span>
																					</div>
																				</div>
																			</div>
																		</div>
																	</div>
																</div>
															</div></li>
														<li class="css-dq2ku"
															data-component="PDPDesktopCarouselSlides"><div
																class="css-15zkufr" data-component="Level">
																<div class="css-u421q6"
																	data-component="AspectRatioContainer">
																	<div class="css-han5dv"></div>
																</div>
															</div></li>
														<li class="css-dq2ku"
															data-component="PDPDesktopCarouselSlides"><div
																class="css-15zkufr" data-component="Level">
																<div class="css-u421q6"
																	data-component="AspectRatioContainer">
																	<div class="css-han5dv"></div>
																</div>
															</div></li>
														<li class="css-dq2ku"
															data-component="PDPDesktopCarouselSlides"><div
																class="css-15zkufr" data-component="Level">
																<div class="css-u421q6"
																	data-component="AspectRatioContainer">
																	<div class="css-han5dv"></div>
																</div>
															</div></li>
													</ul>
												</div>
											</div>
										</div>
									</div>
									<div class="css-usl2mg"
										data-component="ProductDetailPageLayout">
										<div class="css-wzn7g1" data-component="ProductSection">
											<div class="css-1fttcpj">
												<div class="css-7q6jfy" data-component="AboutSectionLayout">
													<span class="css-1onp491" data-component="Text"><div
															class="css-vetbs0" data-component="LineClamp">
															<div class="css-1myreog"></div>
														</div></span>
												</div>
												<div class="css-nkzsvb" data-component="AboutSectionLayout">
													<div class="css-1wgjfnd"
														data-component="AboutMetadataLayout">
														<div class="css-1kg0r30"
															data-testid="about-metadata-layout-column"
															data-component="AboutMetadataLayout">
															<div class="css-encdnt" data-component="Metadata">
																<div class="css-1pj7rfu">
																	<span class="css-11ksoqt" data-component="Text">장르</span>
																</div>
																<div class="css-1pj7rfu">
																	<ul class="css-vs1xw0" data-component="MetadataList">
																		<%
																			for (int i = 0; i < detailList.size(); i++) {
																			if (detailList.get(i).getCateName().equals("장르")) {
																		%>
																		<li class="css-t8k7" data-testid="metadata-list-1인칭"
																			data-component="MetadataList"><a
																			class="css-1672chc" role="link" 
																			href="/Game.do?detailName=<%=detailList.get(i).getDetailName()%>"><span
																				class="css-z3vg5b" data-component="Text"><span
																					data-component="Message"><%=detailList.get(i).getDetailName()%></span></span></a></li>
																		<%
																			}
																		}
																		%>
																	</ul>
																</div>
															</div>
														</div>
														<div class="css-1kg0r30"
															data-testid="about-metadata-layout-column"
															data-component="AboutMetadataLayout">
															<div class="css-encdnt" data-component="Metadata">
																<div class="css-1pj7rfu">
																	<span class="css-11ksoqt" data-component="Text">기능,
																		플랫폼</span>
																</div>
																<div class="css-1pj7rfu">
																	<ul class="css-vs1xw0" data-component="MetadataList">
																		<%
																			for (int i = 0; i < detailList.size(); i++) {
																			if (!detailList.get(i).getCateName().equals("장르")) {
																		%>
																		<li class="css-t8k7"
																			data-testid="metadata-list-컨트롤러 지원"
																			data-component="MetadataList"><a
																			class="css-1672chc" role="link"
																			href="/Game.do?detailName=<%=detailList.get(i).getDetailName()%>"><span
																				class="css-z3vg5b" data-component="Text"><span
																					data-component="Message"><%=detailList.get(i).getDetailName()%></span></span></a></li>
																		<%
																			}
																		}
																		%>
																	</ul>
																</div>
															</div>
														</div>
													</div>
												</div>
												<div class="css-nkzsvb" data-component="AboutSectionLayout"></div>
											</div>
										</div>
									</div>
								</div>
								<aside class="css-566nsd">
									<div class="css-1gmuxco" data-component="DesktopSticky">
										<div class="css-1fttcpj" data-component="PDPSidebarLayout">
											<div class="css-15fg505">
												<div class="css-3kzb0v" data-component="PDPSidebarLogo">
													<div class="css-1yo049y" data-component="Level">
														<div class="css-u421q6"
															data-component="AspectRatioContainer">
															<div class="css-han5dv">
																<div class="css-u0wq1j" data-component="PdpImage">
																	<div data-testid="picture" data-component="Picture">
																		<%
																			if (gameImg.contains("http")) {
																		%>
																		<img alt="" src="<%=gameImg%>" width="600px"
																			height="400px" class="css-5iu9l4"
																			data-image="https://cdn2.unrealengine.com/Diesel%2Fproduct%2Fcatnip%2FEGS_2K_OAK_IC1_Logo_Transparent_400x800-800x400-847db268641618b804c2dc3e64f0055387fd10e5.png?h=270&amp;resize=1&amp;w=480"
																			data-testid="picture-image"
																			data-component="FallbackImage">
																		<%
																			} else {
																		%>
																		<img alt=""
																			src="<%=request.getContextPath()%>/images/imageSrcView.do?fileName=<%=gameImg%>"
																			width="600px" height="400px" class="css-5iu9l4"
																			data-image="https://cdn2.unrealengine.com/Diesel%2Fproduct%2Fcatnip%2FEGS_2K_OAK_IC1_Logo_Transparent_400x800-800x400-847db268641618b804c2dc3e64f0055387fd10e5.png?h=270&amp;resize=1&amp;w=480"
																			data-testid="picture-image"
																			data-component="FallbackImage">
																		<%
																			}
																		%>
																	</div>
																</div>
															</div>
														</div>
													</div>
												</div>
												<div class="css-10o6sbo" data-component="PDPSidebarLogo">
													<div data-component="PdpImage">
														<div class="css-u421q6"
															data-component="AspectRatioContainer">
															<div class="css-han5dv">
																<div class="css-u0wq1j" data-component="PdpImage">
																	<div data-testid="picture" data-component="Picture">
																		<img alt=""
																			src="https://cdn1.epicgames.com/catnip/offer/BL3Wide_2560x1440-2560x1440-462318f36bee20de4412e111ef72dc62.jpg?h=270&amp;resize=1&amp;w=480"
																			class="css-5iu9l4"
																			data-image="https://cdn1.epicgames.com/catnip/offer/BL3Wide_2560x1440-2560x1440-462318f36bee20de4412e111ef72dc62.jpg?h=270&amp;resize=1&amp;w=480"
																			data-testid="picture-image"
																			data-component="FallbackImage">
																	</div>
																</div>
															</div>
														</div>
													</div>
												</div>
											</div>
											<div class="css-15fg505">
												<div class="css-1o8z5v1"
													data-component="PDPSidebarTagsLayout">
													<div class="css-2b03zn"
														data-component="PDPSidebarTagsLayout">
														<span class="css-15fdr99" data-component="Text"><div
																class="css-1t8lqo3" data-component="BaseTag">
																<span data-component="Message">기본 게임</span>
															</div></span>
													</div>
												</div>
											</div>
											<div class="css-15fg505">
												<div class="css-169q7x3"
													data-component="CatalogOfferSidebarPrice">
													<div class="css-fhxb3m" data-component="PriceLayout">
														<%
															for (int i = 0; i < discountList.size(); i++) {
															if (gameId.equals(discountList.get(i).getGameId())) {
														%>
														<div class="css-l24hbj">
															<span class="css-15fdr99" data-component="Text"><div
																	class="css-9a80zb" data-component="BaseTag">-100%</div></span>
														</div>
														<span class="css-157lcjk"><div class="css-l24hbj">
																<span class="css-11ksoqt" data-component="Text"><div
																		class="css-1rcj98u"
																		data-component="PDPDiscountedFromPrice">
																		<%=gamePrice%></div></span>
															</div>
															<div class="css-l24hbj">
																<span class="css-z3vg5b" data-component="Text"><span
																	data-component="Message"> 무료</span></span>
															</div> </span>
														<%
															} else {
														%>
														<span class="css-157lcjk"><div class="css-l24hbj">
																<span class="css-11ksoqt" data-component="Text"><div
																		class="css-1rcj98u"
																		data-component="PDPDiscountedFromPrice">
																		<%=gamePrice%></div></span>
															</div>
															<div class="css-l24hbj">
																<span class="css-z3vg5b" data-component="Text"><span
																	data-component="Message"> 무료</span></span>
															</div> </span>
														<%
															}
														}
														%>
													</div>
												</div>
											</div>
											<%
												for (int i = 0; i < discountList.size(); i++) {
												if (gameId.equals(discountList.get(i).getGameId())) {
											%>
											<div class="css-15fg505">
												<div class="css-1146xy9">
													<span class="css-iqno47" data-component="Text"><span
														data-component="Message"><%=discountList.get(i).getDisEnd()%>
															할인 종료</span></span>
												</div>
											</div>
											<%
												}
											}
											%>
											<%
												if (orderedGameIdList.isEmpty() == false) {
													if (orderedGameIdList.contains(gameId)) {
														System.out.println("구매1");
											%>
											<div class="css-15fg505">
												<div data-component="WithClickTracking">
													<button class="css-1t46j26" aria-disabled="false"
														data-testid="purchase-ctas-button"
														data-component="BaseButton">
														<span class="css-8en90x" data-component="PurchaseCTA"><span
															data-component="Message">이미 구매한 게임</span></span>
													</button>
												</div>
											</div>
											<%
											} else {
												System.out.println("구매2");
											%>
											<div class="css-15fg505">
												<div data-component="WithClickTracking">
													<button class="css-1t46j26"
														onclick="location.href='orderController.do?gameId=<%=gameId%>'"
														data-testid="purchase-ctas-button"
														data-component="BaseButton">
														<span class="css-8en90x" data-component="PurchaseCTA"><span
															data-component="Message">바로결제</span></span>
													</button>
												</div>
											</div>
											<%
											}

											} else if (orderedGameIdList.isEmpty() == true) {
											%>
											<div class="css-15fg505">
												<div data-component="WithClickTracking">
													<button class="css-1t46j26"
														onclick="location.href='orderController.do?gameId=<%=gameId%>'"
														data-testid="purchase-ctas-button"
														data-component="BaseButton">
														<span class="css-8en90x" data-component="PurchaseCTA"><span
															data-component="Message">바로결제</span></span>
													</button>
												</div>
											</div>
											<%
												}
											%>
											<%
												if (cartList != null) {
												int count = 0;
												for (int i = 0; i < cartList.size(); i++) {
													if (gameId.equals(cartList.get(i).getGameId())) {
											%>
											<div class="css-15fg505">
												<div data-component="WithClickTracking">
													<button class="css-1xs0iza" aria-disabled="false"
														data-testid="add-to-cart-cta-button"
														onclick="location.href='cart/insertCart.do?gameId=<%=gameId%>'"
														disabled="disabled" data-component="BaseButton">
														<span class="css-10gyk0u" data-component="Button"><span
															class="" data-component="Message">장바구니에 이미 있습니다.</span></span>
													</button>
												</div>
											</div>
											<%
												break;
											}
											count++;
											}
											if (count == cartList.size()) {
											%>
											<div class="css-15fg505">
												<div data-component="WithClickTracking">
													<button class="css-1xs0iza" aria-disabled="false"
														data-testid="add-to-cart-cta-button"
														onclick="location.href='cart/insertCart.do?gameId=<%=gameId%>'"
														data-component="BaseButton">
														<span class="css-10gyk0u" data-component="Button"><span
															class="" data-component="Message">장바구니에 담기</span></span>
													</button>
												</div>
											</div>
											<%
												}
											} else {
											%>
											<div class="css-15fg505">
												<div data-component="WithClickTracking">
													<button class="css-1xs0iza" aria-disabled="false"
														data-testid="add-to-cart-cta-button"
														onclick="location.href='cart/insertCart.do?gameId=<%=gameId%>'"
														data-component="BaseButton">
														<span class="css-10gyk0u" data-component="Button"><span
															class="" data-component="Message">장바구니에 담기</span></span>
													</button>
												</div>
											</div>
											<%
												}
											if (wishList != null) {
											int count = 0;
											for (int i = 0; i < wishList.size(); i++) {
												if (gameId.equals(wishList.get(i).getGameId())) {
											%>
											<div class="css-15fg505">
												<button class="css-tpudt1" data-component="BaseButton"
													disabled="disabled"
													onclick="location.href='wishList/insertWishList.do?gameId=<%=gameId%>'"
													aria-expanded="false">
													<span class="css-rfip8z" data-component="WishlistCTALabel"><div
															class="css-kympza" data-testid="wishbutton-circle"
															data-component="WishButtonCircle">
															<div data-testid="spinner" class="css-7valn4"
																data-component="WishButtonSpinner"></div>
														</div> <span class="css-15fdr99" data-component="Text"><span
															data-component="Message">위시리스트에 이미 있습니다.</span></span></span>
												</button>
											</div>
											<%
												break;
											}
											count++;
											}
											if (count == wishList.size()) {
											%>
											<div class="css-15fg505">
												<button class="css-tpudt1" data-component="BaseButton"
													onclick="location.href='wishList/insertWishList.do?gameId=<%=gameId%>'"
													aria-expanded="false">
													<span class="css-rfip8z" data-component="WishlistCTALabel"><div
															class="css-kympza" data-testid="wishbutton-circle"
															data-component="WishButtonCircle">
															<div data-testid="spinner" class="css-7valn4"
																data-component="WishButtonSpinner"></div>
														</div> <span class="css-15fdr99" data-component="Text"><span
															data-component="Message">위시리스트에 추가</span></span></span>
												</button>
											</div>
											<%
												}
											} else {
											%>
											<div class="css-15fg505">
												<button class="css-tpudt1" data-component="BaseButton"
													onclick="location.href='wishList/insertWishList.do?gameId=<%=gameId%>'"
													aria-expanded="false">
													<span class="css-rfip8z" data-component="WishlistCTALabel"><div
															class="css-kympza" data-testid="wishbutton-circle"
															data-component="WishButtonCircle">
															<div data-testid="spinner" class="css-7valn4"
																data-component="WishButtonSpinner"></div>
														</div> <span class="css-15fdr99" data-component="Text"><span
															data-component="Message">위시리스트에 추가</span></span></span>
												</button>
											</div>
											<%
												}
											%>
											<div class="css-421tyv">
												<div class="css-1vncc1c"
													data-component="PDPSidebarRatingLayout">
													<%
														if (age.contains("18세")) {
													%>
													<div class="css-8rk9sy">
														<img alt="청소년이용불가" class="css-7i9tj1"
															src="https://cdn1.epicgames.com/salesEvent/salesEvent/grac_18_217x256-f30f31671bede02ec5d7eb913af1fc87"
															data-component="PDPRatingImage">
													</div>
													<div class="css-trn5ka">
														<div class="css-1d3w5wq">
															<span class="css-b3sav2" data-component="Text">청소년이용불가</span>
														</div>
														<div class="css-1d3w5wq">
															<span class="css-11ksoqt" data-component="Text">폭력성,
																선전성, 언어의 부적절성</span>
														</div>
													</div>
													<%
														} else if (age.contains("15세")) {
													%>
													<div class="css-8rk9sy">
														<img alt="15세이용가" class="css-7i9tj1" src="<%=age15%>"
															data-component="PDPRatingImage">
													</div>
													<div class="css-trn5ka">
														<div class="css-1d3w5wq">
															<span class="css-b3sav2" data-component="Text">15세
																이용가</span>
														</div>
														<div class="css-1d3w5wq">
															<span class="css-11ksoqt" data-component="Text">폭력성,
																언어의 부적절성</span>
														</div>
													</div>
													<%
														} else if (age.contains("12세")) {
													%>
													<div class="css-8rk9sy">
														<img alt="12세이용가" class="css-7i9tj1" src="<%=age12%>"
															data-component="PDPRatingImage">
													</div>
													<div class="css-trn5ka">
														<div class="css-1d3w5wq">
															<span class="css-b3sav2" data-component="Text">12세
																이용가</span>
														</div>
														<div class="css-1d3w5wq">
															<span class="css-11ksoqt" data-component="Text">폭력성</span>
														</div>
													</div>
													<%
														} else {
													%>
													<div class="css-8rk9sy">
														<img alt="전체 이용가" class="css-7i9tj1" src="<%=ageAll%>"
															data-component="PDPRatingImage">
													</div>
													<div class="css-trn5ka">
														<div class="css-1d3w5wq">
															<span class="css-b3sav2" data-component="Text">전체
																이용가</span>
														</div>
													</div>
													<%
														}
													%>
												</div>
											</div>
											<div class="css-15fg505">
												<div class="css-b6wrti"
													data-component="SidebarMetadataLayout">
													<div class="css-10mlqmn"
														data-component="SidebarMetadataLayout">
														<div class="css-fxdlmq"
															data-component="PDPSidebarMetadataBase">
															<span class="css-11ksoqt" data-component="Text">개발사</span>
															<div class="css-btns76">
																<span class="css-z3vg5b" data-component="Text"><%=gameDev%></span>
															</div>
														</div>
													</div>
													<div class="css-10mlqmn"
														data-component="SidebarMetadataLayout">
														<div class="css-fxdlmq"
															data-component="PDPSidebarMetadataBase">
															<span class="css-11ksoqt" data-component="Text">퍼블리셔</span>
															<div class="css-btns76">
																<span class="css-z3vg5b" data-component="Text"><%=gamePub%></span>
															</div>
														</div>
													</div>
													<div class="css-10mlqmn"
														data-component="SidebarMetadataLayout">
														<div class="css-fxdlmq"
															data-component="PDPSidebarMetadataBase">
															<span class="css-11ksoqt" data-component="Text">출시일</span>
															<div class="css-btns76">
																<span class="css-z3vg5b" data-component="Text"><time
																		datetime="2019-12-25" data-component="Time">
																	<fmt:parseDate value="<%=detailList.get(0).getGameDate()%>" var="dateValue" pattern="yyyy-MM-dd HH:mm:ss"/>
																	<fmt:formatDate value="${dateValue}" pattern="yyyy-MM-dd"/>
																	</time></span>
															</div>
														</div>
													</div>
													<div class="css-10mlqmn"
														data-component="SidebarMetadataLayout">
														<div class="css-fxdlmq"
															data-component="PDPSidebarMetadataBase">
															<span class="css-11ksoqt" data-component="Text">플랫폼</span>
															<div class="css-btns76">
																<div class="css-1biwmls"
																	data-component="PDPMetadataPlatforms">
																	<ul class="css-e6kwg0"
																		data-component="SupportedPlatforms">
																		<li class="css-1nau1p3"
																			data-testid="metadata-platform-windows"
																			data-component="SupportedPlatforms"><span
																			class="css-15wl14t" aria-hidden="true"
																			data-testid="icon" data-component="Icon"><svg
																					xmlns="http://www.w3.org/2000/svg"
																					class="svg css-w1atjl" viewBox="0 0 512 512">
																					<title></title><g>
																					<path fill="currentColor"
																						d="M0.175 256l-0.175-156.037 192-26.072v182.109zM224 69.241l255.936-37.241v224h-255.936zM479.999 288l-0.063 224-255.936-36.008v-187.992zM192 471.918l-191.844-26.297-0.010-157.621h191.854z"></path></g></svg></span><span
																			class="css-1qwdmuy" data-component="Icon"><%=detailList.get(detailList.size() - 1).getDetailName()%></span></li>
																		<li class="css-1nau1p3"
																			data-testid="metadata-platform-mac"
																			data-component="SupportedPlatforms"><span
																			class="css-15wl14t" aria-hidden="true"
																			data-testid="icon" data-component="Icon"><svg
																					xmlns="http://www.w3.org/2000/svg"
																					class="svg css-w1atjl" viewBox="0 0 105 43">
																					<title>Mac OS</title><g>
																					<path
																						d="M40.152 39.6706H34.5029V10.4623H34.3002L22.3433 39.3667H17.7834L5.80114 10.4623H5.59848V39.6706H0V0H7.11843L19.962 31.3109H20.19L32.9829 0H40.1267V39.6706H40.152Z"
																						fill="currentColor"></path>
																					<path
																						d="M46.2617 31.4377C46.2617 26.3459 50.1376 23.4327 57.2814 23.002L64.9571 22.5207V20.3421C64.9571 17.1249 62.8292 15.377 59.08 15.377C55.9641 15.377 53.7095 16.9729 53.2535 19.4048H47.6803C47.8577 14.2623 52.6962 10.5385 59.232 10.5385C66.2744 10.5385 70.8596 14.2117 70.8596 19.9368V39.6708H65.1598V34.9083H65.0078C63.3865 38.0242 59.8146 39.9748 55.9387 39.9748C50.2643 39.9748 46.2617 36.5549 46.2617 31.4377ZM64.9571 28.9045V26.6752L58.1173 27.1312C54.2668 27.3845 52.2655 28.8032 52.2655 31.3111C52.2655 33.743 54.3681 35.3136 57.636 35.3136C61.7905 35.2629 64.9571 32.603 64.9571 28.9045Z"
																						fill="currentColor"></path>
																					<path
																						d="M96.5139 20.798C95.9819 17.7328 93.626 15.4528 89.7501 15.4528C85.2156 15.4528 82.201 19.278 82.201 25.2312C82.201 31.387 85.2409 35.0602 89.8008 35.0602C93.4486 35.0602 95.8806 33.2362 96.5645 29.8923H102.264C101.631 35.9975 96.7672 40 89.7754 40C81.5424 40 76.1719 34.4015 76.1719 25.2312C76.1719 16.2888 81.5677 10.4877 89.7248 10.4877C97.1218 10.4877 101.707 15.1235 102.214 20.7727H96.5139V20.798Z"
																						fill="currentColor"></path></g></svg></span><span
																			class="css-1qwdmuy" data-component="Icon">Mac
																				OS</span></li>
																	</ul>
																</div>
															</div>
														</div>
													</div>
												</div>
											</div>
										</div>
									</div>
								</aside>
							</div>
						</div>
						<div class="css-1fttcpj"
							data-component="ResponsiveContentWithOptionalSidebarLayout">
							<div class="css-1nqq6xy">
								<div class="css-qemfat">
									<div class="css-iqoq9n"
										data-component="ProductDetailPageLayout">
										<div class="css-wzn7g1" data-component="ProductSection">
											<div class="css-1azpx8r" style="width: 100px">
												<h2 class="css-12d0yut" data-component="Heading">
													<span data-component="Message">평점</span>
												</h2>
											</div>
											<div class="css-1fttcpj">
												<div class="css-1ilpia5"
													data-component="CriticReviewsLayout">
													<div class="css-5q96rd">
														<ul class="css-1qfz72n"
															data-component="PDPCriticReviewMetricsLayout">
															<li class="css-1ufz7qh"
																data-component="PDPCriticReviewMetricsLayout"><div
																	class="css-14kxzvf"
																	data-component="CircularProgressBar">
																	<svg viewBox="0 0 75 75" height="75" width="75"
																		version="1.1" class="css-t0grqz">
																		<circle stroke-width="3" cx="50%" cy="50%" r="36"
																			class="css-1fs9ftn"
																			data-component="CircularProgressBar"></circle>
																		<circle stroke-width="3" cx="50%" cy="50%" r="36"
																			class="css-vc3zen"
																			stroke-dasharray="226.1946710584651, 226.1946710584651"
																			stroke-dashoffset="45.238934211693014"
																			data-component="CircularProgressBar"></circle></svg>
																	<%
																		if (reviewList.size() > 0) {
																		String sumgrd = "";
																		int sumGrd = 0;
																		for (int i = 0; i < reviewList.size(); i++) {
																			sumgrd = Integer.toString(reviewList.get(i).getRevGrade());
																			sumGrd += Integer.parseInt(sumgrd);
																		}
																		avgRgd = sumGrd / reviewList.size();
																	}
																	%>
																	<div class="css-1q9chu"><%=reviewList.size()%></div>
																</div>
																<div class="css-j08qra" data-component="MetricCard">
																	<span data-component="Message">게임 리뷰</span>
																</div></li>
															<li class="css-1ufz7qh" style="margin-left: 25px"
																data-component="PDPCriticReviewMetricsLayout"><div
																	class="css-14kxzvf"
																	data-component="CircularProgressBar">
																	<svg viewBox="0 0 75 75" height="75" width="75"
																		version="1.1" class="css-t0grqz">
																		<circle stroke-width="3" cx="50%" cy="50%" r="36"
																			class="css-1fs9ftn"
																			data-component="CircularProgressBar"></circle>
																		<circle stroke-width="3" cx="50%" cy="50%" r="36"
																			class="css-vc3zen"
																			stroke-dasharray="226.1946710584651, 226.1946710584651"
																			stroke-dashoffset="45.238934211693014"
																			data-component="CircularProgressBar"></circle></svg>
																	<div class="css-1q9chu"><%=avgRgd%></div>
																</div>
																<div class="css-j08qra" data-component="MetricCard">
																	<span data-component="Message">리뷰 평균</span>
																</div></li>
															<li class="css-1ufz7qh" style="margin-left: 25px"
																data-component="PDPCriticReviewMetricsLayout"><div
																	class="css-14kxzvf"
																	data-component="CircularProgressBar">
																	<svg viewBox="0 0 75 75" height="75" width="75"
																		version="1.1" class="css-t0grqz">
																		<circle stroke-width="3" cx="50%" cy="50%" r="36"
																			class="css-1fs9ftn"
																			stroke-dasharray="51.548667764616276, 5"
																			stroke-dashoffset="-2.5"
																			data-component="CircularProgressBar"></circle>
																		<circle stroke-width="3" cx="50%" cy="50%" r="36"
																			class="css-vc3zen"
																			stroke-dasharray="51.548667764616276, 5, 51.548667764616276, 5, 51.548667764616276, 226.1946710584651"
																			stroke-dashoffset="-2.5"
																			data-component="CircularProgressBar"></circle></svg>
																	<div class="css-1q9chu">긍정적</div>
																</div>
																<div class="css-j08qra" data-component="MetricCard">
																	<span data-component="Message">사용자 평가</span>
																</div></li>
															<li class="css-fuc5di" style="margin-left: 50px"><a
																href="/members/MyReview.do" role="link"
																rel="noopener external" target="_blank"
																referrerpolicy="unsafe-url" data-component="Link" style="text-decoration: none;"><span
																	class="css-dcpx1m" data-component="Text"><div
																			class="css-125og8r"
																			data-component="PDPCriticReviewMetrics">
																			<span data-component="Message">내 리뷰 보기</span> <span
																				class="css-1sg47sy" aria-hidden="true"
																				data-testid="icon" data-component="Icon"><svg
																					xmlns="http://www.w3.org/2000/svg"
																					class="svg css-w1atjl" viewBox="0 0 13 13">
																					<path
																						d="M10,10 L3,10 L3,3 L6.5,3 L6.5,2 L3,2 C2.445,2 2,2.45 2,3 L2,10 C2,10.55 2.445,11 3,11 L10,11 C10.55,11 11,10.55 11,10 L11,6.5 L10,6.5 L10,10 Z M7.5,0 L7.5,3 L9.295,3 L4.38,7.915 L5.085,8.62 L10,3.705 L10,5.5 L11,5.5 L11,2 L7.5,2 Z"
																						fill="currentColor" fill-rule="evenodd"></path></svg></span>
																		</div></span></a></li>
															<li class="css-fuc5di" style="margin-left: 50px">
															<a data-toggle="modal" href="#rev_register" role="link" rel="noopener external" target="_blank" referrerpolicy="unsafe-url" data-component="Link" style="text-decoration: none;"><span
																	class="css-dcpx1m" data-component="Text"><div
																			class="css-125og8r" 
																			data-component="PDPCriticReviewMetrics">
																			<span data-component="Message">리뷰 등록하기</span> <span
																				class="css-1sg47sy" aria-hidden="true"
																				data-testid="icon" data-component="Icon"><svg
																					xmlns="http://www.w3.org/2000/svg"
																					class="svg css-w1atjl" viewBox="0 0 13 13">
																					<path
																						d="M10,10 L3,10 L3,3 L6.5,3 L6.5,2 L3,2 C2.445,2 2,2.45 2,3 L2,10 C2,10.55 2.445,11 3,11 L10,11 C10.55,11 11,10.55 11,10 L11,6.5 L10,6.5 L10,10 Z M7.5,0 L7.5,3 L9.295,3 L4.38,7.915 L5.085,8.62 L10,3.705 L10,5.5 L11,5.5 L11,2 L7.5,2 Z"
																						fill="currentColor" fill-rule="evenodd"></path></svg></span>
																		</div></span></a></li>
															<li class="css-fuc5di" style="margin-left: 50px">
															<a href="/question/report.do?memId=<%=vo.getMemId()%>&memName=<%=vo.getMemName()%>&gameName=<%=gameName%>" role="link" rel="noopener external" target="_blank" referrerpolicy="unsafe-url" data-component="Link" style="text-decoration: none;"><span
																	style="color: red; font-size: 12px;" data-component="Text"><div
																			class="css-125og8r" 
																			data-component="PDPCriticReviewMetrics">
																			<span data-component="Message">게임 신고</span> <span
																				class="css-1sg47sy" aria-hidden="true"
																				data-testid="icon" data-component="Icon"><svg
																					xmlns="http://www.w3.org/2000/svg"
																					class="svg css-w1atjl" viewBox="0 0 13 13">
																					<path
																						d="M10,10 L3,10 L3,3 L6.5,3 L6.5,2 L3,2 C2.445,2 2,2.45 2,3 L2,10 C2,10.55 2.445,11 3,11 L10,11 C10.55,11 11,10.55 11,10 L11,6.5 L10,6.5 L10,10 Z M7.5,0 L7.5,3 L9.295,3 L4.38,7.915 L5.085,8.62 L10,3.705 L10,5.5 L11,5.5 L11,2 L7.5,2 Z"
																						fill="currentColor" fill-rule="evenodd"></path></svg></span>
																		</div></span></a></li>
														</ul>
													</div>
													<br>

															<!--리뷰등록 모달 -->
																	<form action="/members/InsertMyReview.do" method="post">
																		<input type="hidden" name="revId"
																			value=""> <input
																			type="hidden" name="gameId"
																			value=""> <input
																			type="hidden" name="memId" value="">
																		<div id="rev_register" class="modal fade" role="dialog">
																			<div class="modal-dialog">
																			
																				<!-- Modal content-->
																				<div class="modal-content" style="background: #202020;">
																					<div class="modal-header"
																						style="border-bottom: 0.5px solid #037bee;">
<!-- 																						<button type="button" class="close" data-dismiss="modal">&times;</button> -->
																						<h5 class="modal-title" style="color: #037bee;">리뷰 작성</h5>
																					</div>
																					<div class="modal-body" style="background: #202020;">
																						<form>
																							<div class="modal_grade">
																								<label for="inputGrade" class="form-label" style="color: #ffffff;">Rate</label> 
<!-- 																								<input name="revGrade" type="text" class="form-control" id="inputGrade"  -->
<!-- 																									style="background: #202020; border: none; color: #ffffff; "/> -->
																								<br>
																								<fieldset id="fieldset" >
																									<input type="radio" class="reviewStar" name="revGrade" value="5" id="rate1"><label class="star_lbl"
																										for="rate1">★</label>
																									<input type="radio" class="reviewStar" name="revGrade" value="4" id="rate2"><label class="star_lbl"
																										for="rate2">★</label>
																									<input type="radio" class="reviewStar" name="revGrade" value="3" id="rate3"><label class="star_lbl"
																										for="rate3">★</label>
																									<input type="radio" class="reviewStar" name="revGrade" value="2" id="rate4"><label class="star_lbl"
																										for="rate4">★</label>
																									<input type="radio" class="reviewStar" name="revGrade" value="1" id="rate5" checked="checked"><label class="star_lbl"
																										for="rate5">★</label>
																								</fieldset>
																								
										
																							</div>
																							<div class="modal_title">
																								<label for="inputTitle" class="form-label"
																									style="padding-top: 10px; color: #ffffff;">Title</label>
																								<input name="revTitle" type="text" class="form-control" autocomplete="off"
																									id="inputTitle" placeholder="제목을 입력하세요." required="required"
																									style="background: #202020; border: none; color: #ffffff;"
																									 />
																							</div>
																							<div class="modal_contents">
																								<label for="inputContents" class="form-label"
																									style="padding-top: 10px; color: #ffffff;">Contents</label>
																								<input name="revCont" type="text" class="form-control" autocomplete="off"
																									id="inputContents" placeholder="내용을 입력하세요." required="required"
																									style="background: #202020; border: none; color: #ffffff; height: 300px;"/>
																							</div>
																						</form>
																					</div>
																					<div class="modal-footer"
																						style="border-top: 0.5px solid #037bee;">
																						<button type="button" class="btn btn-secondary"
																							data-dismiss="modal">Close</button>
																						<button type="submit" class="btn btn-primary" >Insert</button>
										
																					</div>
																				</div>
																			</div>
																		</div>
																	</form>
																</div>
													
													<div class="css-5q96rd">
														<div class="css-uzfw96"
															data-component="CarouselBasicLayout">
															<div class="css-1kxonj9">
																<div class="css-3q4ecs" data-testid="carousel-content">
																	<div
																		class="swiper-container swiper-container-initialized swiper-container-horizontal swiper-container-pointer-events">
																		<div class="swiper-wrapper">

																			<div
																				class="swiper-slide swiper-slide-visible swiper-slide-active"
																				style="width: 238.333px; margin-right: 20px;">
																				<div class="css-1k6yg9d"
																					data-component="PDPCriticReviewLayout">
																					<%
																						if (reviewList.size() > 0) {
																						for (int i = 0; i < reviewList.size(); i++) {
																					%>
																					<div class="css-174xcl1" data-component="Level"
																						style="margin-right: 20px; width:250px;">
																						<div class="css-13ku56z" style="width: 220px">
																							<div class="css-1azpx8r">
																								<div class="css-1d3w5wq">
																									<span class="css-z3vg5b" data-component="Text"><%=reviewList.get(i).getRevTitle()%></span>
																								</div>
																								<div class="css-1d3w5wq">
																									<span class="css-11ksoqt" data-component="Text"><span
																										data-component="Message">작성자: <%=reviewList.get(i).getMemId()%></span></span>
																								</div>
																							</div>
																							<div class="css-dkvgms"
																								data-component="HorizontalRule">
																								<div style="width: 100%;"></div>
																							</div>
																							<div class="css-wt3lag" style="width: 100%;">
																								<div class="css-1d3w5wq">
																									<%
																										String grdd = Integer.toString(reviewList.get(i).getRevGrade());
																									int grd = Integer.parseInt(grdd);
																									for (int j = 0; j < grd; j++) {
																									%>
																									<span class="css-z3vg5b" data-component="Text">
																										★ </span>
																									<%
																										}
																									%>
																								</div>
																								<div class="css-uy4qy4">
																									<span class="css-11ksoqt" data-component="Text">“<%=reviewList.get(i).getRevCont()%>”
																									</span>
																								</div>
																							</div>
																						</div>
																					</div>
																					<%
																						}
																					}
																					%>
																				</div>
																			</div>
																		</div>
																	</div>
																</div>
															</div>
															<div class="css-1ecwfqu"
																data-component="PaginationSingleBreakpoint">
																<button class="css-1jbvqli" aria-label="슬라이드 1/3"
																	tabindex="0" data-component="PaginationBulletButton">
																	<div class="css-1qmiys4"
																		data-component="PaginationBullet"></div>
																</button>
																<button class="css-1jbvqli" aria-label="슬라이드 2/3"
																	tabindex="0" data-component="PaginationBulletButton">
																	<div class="css-1avhstz"
																		data-component="PaginationBullet"></div>
																</button>
																<button class="css-1jbvqli" aria-label="슬라이드 3/3"
																	tabindex="0" data-component="PaginationBulletButton">
																	<div class="css-1avhstz"
																		data-component="PaginationBullet"></div>
																</button>
															</div>
															<div class="css-j9flol"
																data-component="PaginationSingleBreakpoint">
																<button class="css-1jbvqli" aria-label="슬라이드 1/2"
																	tabindex="0" data-component="PaginationBulletButton">
																	<div class="css-1qmiys4"
																		data-component="PaginationBullet"></div>
																</button>
																<button class="css-1jbvqli" aria-label="슬라이드 2/2"
																	tabindex="0" data-component="PaginationBulletButton">
																	<div class="css-1avhstz"
																		data-component="PaginationBullet"></div>
																</button>
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
	</div>
	<%
		if (msg == "성공") {
	%>
	<script>
		alert('정상적으로 처리되었습니다');
	</script>
	<%
		} else if (msg == "실패") {
	%>
	<script>
		alert('이미 존재하는 게임입니다');
	</script>
	<%
		} else if (msg == "장바구니 담기 성공") {
	%>
	<script>
		alert('장바구니 담기 성공');
	</script>
	<%
		} else if (msg == "장바구니 담기 실패") {
	%>
	<script>
		alert('이미 장바구니에 존재하는 항목입니다');
	</script>
	<%
		} else if (msg == "이미 구매한 게임입니다") {
	%>
	<script>
		alert('이미 구매한 게임입니다');
	</script>
	<%
		}
	%>
	<%
		if (msg.equals("위시리스트추가성공")) {
	%>
	<script>
		alert('위시리스트가 추가되었습니다');
	</script>
	<%
		} else if (msg.equals("위시리스트추가실패")) {
	%>
	<script>
		alert('이미 위시리스트에 있는 항목입니다');
	</script>
	<%
		} else if (msg.equals("위시삭제성공")) {
	%>
	<script>
		alert('위시리스트에서 삭제되었습니다');
	</script>
	<%
		} else if (msg.equals("위시삭제실패")) {
	%>
	<script>
		alert('위시리스트 삭제에 실패하였습니다');
	</script>
	<%
		}
	%>
	<script>
		document.querySelector("#updateCancel").addEventListener("click",
				function() {
					$("#update").modal('hide');
				});
		document.querySelector("#deleteCancel").addEventListener("click",
				function() {
					$("#delete").modal('hide');
				});
		</script>
		<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.bundle.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.13.1/js/bootstrap-select.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2" crossorigin="anonymous"></script>

</body>
</html>