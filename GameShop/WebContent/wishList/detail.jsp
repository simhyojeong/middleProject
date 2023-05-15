<%@page import="games.game.vo.DiscountVO"%>
<%@page import="java.util.List"%>
<%@page import="wishList.vo.WishListVO"%>
<%@page import="games.game.vo.GameVO"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	List<WishListVO> wishLists = (List<WishListVO>) request.getAttribute("wishLists");
List<GameVO> gameDetailList = (List<GameVO>) request.getAttribute("gameDetailList");
List<DiscountVO> discountList = (List<DiscountVO>) request.getAttribute("discountList");
String msg = session.getAttribute("msg") == null ? "" : (String) session.getAttribute("msg");
session.removeAttribute("msg"); //꺼내온 메세지 속성 제거하기
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>위시리스트</title>
<link rel="stylesheet" href="../css/wishList.css">
<link rel="stylesheet" href="../css/cart.css">
</head>
<header id="header-container-fluid">
	<jsp:include page="/main/header.jsp" />
	<jsp:include page="/main/headerNav.jsp" />
</header>
<body>
	<div data-testid="egs-ssr-wrapper-all">
		<div class="css-1ktypff">
			<div class="css-1n8met0">
				<div class="css-s45c7f">
					<div class="css-1sqqqs8">
						<section class="css-6xy8un">
							<div class="css-yewo14">
								<div class="css-yh460">
									<!-- 위시리스트 헤더 영역 -->
									<div class="css-sbt18p">
										<div class="css-96t4v1">
											<div class="css-g030ms">
												<h1 class="css-1gty6cv">위시리스트</h1>
											</div>
										</div>
										<!-- 위시리스트 본문 영역 -->
										<%
											boolean emptyCartChk = wishLists.isEmpty();
										%>
										<%
											if (emptyCartChk == false) {
										%>
										<div class="css-map4tx">
											<div class="css-11fvpc2">
												<!-- 위시리스트 블럭(리스트 받아와서 반복문) -->
												<%
													int size = gameDetailList.size();
												if (size > 0) {
													for (int i = 0; i < size; i++) {
												%>
												<div class="css-2zb5l7">
													<div data-testid="offer-card-layout-wrapper">
														<div class="css-h8tfh5">
															<div class="css-id4ofr">
																<div class="css-fybeq" data-testid="image-desktop">
																	<a class="css-1nvf6h0" role="link" href="/detailGame.do?id=<%=gameDetailList.get(i).getGameId()%>">
																		<div class="css-167dhte">
																			<div class="css-yb58t8">
																				<div class="css-han5dv">
																					<img class="css-11h61hf" alt="" src="<%=gameDetailList.get(i).getGameImg()%>" data-animated="animated" data-image="<%=gameDetailList.get(i).getGameImg()%>" data-testid="lazy-image-observer" data-component="BaseImage">
																				</div>
																			</div>
																		</div>
																	</a>
																</div>
																<div class="css-19o6pkz">
																	<div class="css-rosb62">
																		<div class="css-z5atxi">
																			<!-- 기본게임 출력 영역 -->
																			<div class="css-tl38pn">
																				<div class="css-2b03zn">
																					<span class="css-15fdr99" data-component="Text"><div class="css-1t8lqo3" data-component="BaseTag">
																							<span data-component="Message">기본 게임</span>
																						</div></span>
																				</div>
																			</div>
																			<!-- 게임 제목 영역 -->
																			<div class="css-14mezjk">
																				<a class="css-qcw33g" role="link" href="/detailGame.do?id=<%=gameDetailList.get(i).getGameId()%>"><h2 class="css-12d0yut" data-component="Heading">
																						<div class="css-vetbs0" data-component="LineClamp">
																							<div class="css-8uhtka" data-testid="one-line-text"><%=gameDetailList.get(i).getGameName()%></div>
																						</div>
																					</h2></a>
																			</div>
																		</div>
																		<!-- 게임 가격 영역 -->
																		<div class="css-pd895a">
																			<div class="css-1ehhp1w">
																				<%
																					// 만약 무료게임리스트의 게임아이디와 해당 게임아이디가 같으면 무료와 할인종료일자 띄우기                                                                                                                                                                   
																				if (discountList.isEmpty()) {
																				%>
																				<div class="css-fhxb3m" data-component="PriceLayout">
																					<span class="css-157lcjk">
																						<div class="css-l24hbj">
																							<span class="css-11ksoqt">
																								<div class="css-1rcj98u"></div>
																							</span>
																						</div>
																						<div class="css-l24hbj">
																							<span class="css-z3vg5b">₩<%=gameDetailList.get(i).getGamePrice()%></span>
																						</div>
																					</span>
																				</div>
																				<div class="css-hkh81z">
																					<span class="css-iqno47"> <span> </span></span>
																				</div>
																				<%
																					} else {
																				for (DiscountVO vo : discountList) {
																					if (vo.getGameId().equals(gameDetailList.get(i).getGameId())) {
																						// 무료게임과 지금 띄울 게임아이디가 동일하다면
																				%>
																				<div class="css-fhxb3m" data-component="PriceLayout">
																					<span class="css-157lcjk">
																						<div class="css-l24hbj">
																							<span class="css-11ksoqt">
																								<div class="css-1rcj98u">
																									₩<%=gameDetailList.get(i).getGamePrice()%></div>
																							</span>
																						</div>
																						<div class="css-l24hbj">
																							<span class="css-z3vg5b">&nbsp&nbsp무료</span>
																						</div>
																					</span>
																				</div>
																				<div class="css-hkh81z">
																					<span class="css-iqno47"> <span><%=vo.getDisEnd()%> 까지 할인 </span></span>
																				</div>
																				<%
																					} else {
																				%>
																				<div class="css-fhxb3m" data-component="PriceLayout">
																					<span class="css-157lcjk">
																						<div class="css-l24hbj">
																							<span class="css-11ksoqt">
																								<div class="css-1rcj98u"></div>
																							</span>
																						</div>
																						<div class="css-l24hbj">
																							<span class="css-z3vg5b">₩<%=gameDetailList.get(i).getGamePrice()%></span>
																						</div>
																					</span>
																				</div>
																				<%
																					}
																				}
																				}
																				%>
																			</div>
																		</div>
																	</div>
																	<div class="css-bfzj8t">
																		<!-- 게임 연령 영역 -->
																		<div class="css-ht241g">
																			<div class="css-vs1xw0">
																				<div class="css-7whenc">
																					<div class="css-1f1kwdk">
																						<%
																							String srcImg = "";
																						String age = gameDetailList.get(i).getAgeGrade();
																						if (age.equals("전체 이용가")) {
																							srcImg = "https://cdn1.epicgames.com/salesEvent/salesEvent/grac_all_217x256-d1807c2030d2f1a7b632ed99d9f02fbe";
																						} else if (age.equals("15세 이용가")) {
																							srcImg = "https://cdn1.epicgames.com/salesEvent/salesEvent/grac_15_217x256-e9654db2c96555b4094b11bf1fa40db2";
																						} else if (age.equals("18세 이용가")) {
																							srcImg = "https://cdn1.epicgames.com/salesEvent/salesEvent/grac_18_217x256-f30f31671bede02ec5d7eb913af1fc87";
																						} else if (age.equals("12세 이용가")) {
																							srcImg = "https://cdn1.epicgames.com/salesEvent/salesEvent/grac_12_217x256-b1f4b4e2dd53d071c044854d929801a4";
																						}
																						%>
																						<img alt="15세이용가" class="css-7i9tj1" src=<%=srcImg%>>
																					</div>
																					<div>
																						<div class="css-cgc87z">
																							<span class="css-25dfdw"><%=gameDetailList.get(i).getAgeGrade()%></span>
																						</div>
																						<div class="css-1d3w5wq">
																							<span class="css-dcpx1m">선정성, 폭력성, 언어의 부적절성, 약물, 범죄, 사행성</span>
																						</div>
																					</div>
																				</div>
																			</div>
																		</div>
																		<div class="css-scht8r"></div>
																		<!-- 게임 플랫폼 영역 -->
																		<div class="css-1aj3lkt">
																			<div class="css-kopxry">
																				<ul class="css-e6kwg0">
																					<li class="css-1nau1p3"><span class="css-staqnu" aria-hidden="true"> <svg xmlns="http://www.w3.org/2000/svg" class="svg css-w1atjl" viewBox="0 0 512 512">
																											<title>Windows</title><g>
																											<path fill="currentColor" d="M0.175 256l-0.175-156.037 192-26.072v182.109zM224 69.241l255.936-37.241v224h-255.936zM479.999 288l-0.063 224-255.936-36.008v-187.992zM192 471.918l-191.844-26.297-0.010-157.621h191.854z"></path></g></svg></span><span class="css-1qwdmuy" data-component="Icon">Windows</span></li>
																					<li class="css-1nau1p3"><span class="css-staqnu" aria-hidden="true"> <svg xmlns="http://www.w3.org/2000/svg" class="svg css-w1atjl" viewBox="0 0 105 43">
																											<title>Mac OS</title><g>
																											<path d="M40.152 39.6706H34.5029V10.4623H34.3002L22.3433 39.3667H17.7834L5.80114 10.4623H5.59848V39.6706H0V0H7.11843L19.962 31.3109H20.19L32.9829 0H40.1267V39.6706H40.152Z" fill="currentColor"></path>
																											<path d="M46.2617 31.4377C46.2617 26.3459 50.1376 23.4327 57.2814 23.002L64.9571 22.5207V20.3421C64.9571 17.1249 62.8292 15.377 59.08 15.377C55.9641 15.377 53.7095 16.9729 53.2535 19.4048H47.6803C47.8577 14.2623 52.6962 10.5385 59.232 10.5385C66.2744 10.5385 70.8596 14.2117 70.8596 19.9368V39.6708H65.1598V34.9083H65.0078C63.3865 38.0242 59.8146 39.9748 55.9387 39.9748C50.2643 39.9748 46.2617 36.5549 46.2617 31.4377ZM64.9571 28.9045V26.6752L58.1173 27.1312C54.2668 27.3845 52.2655 28.8032 52.2655 31.3111C52.2655 33.743 54.3681 35.3136 57.636 35.3136C61.7905 35.2629 64.9571 32.603 64.9571 28.9045Z" fill="currentColor"></path>
																											<path d="M96.5139 20.798C95.9819 17.7328 93.626 15.4528 89.7501 15.4528C85.2156 15.4528 82.201 19.278 82.201 25.2312C82.201 31.387 85.2409 35.0602 89.8008 35.0602C93.4486 35.0602 95.8806 33.2362 96.5645 29.8923H102.264C101.631 35.9975 96.7672 40 89.7754 40C81.5424 40 76.1719 34.4015 76.1719 25.2312C76.1719 16.2888 81.5677 10.4877 89.7248 10.4877C97.1218 10.4877 101.707 15.1235 102.214 20.7727H96.5139V20.798Z" fill="currentColor"></path></g></svg></span><span class="css-1qwdmuy" data-component="Icon">Mac OS</span></li>
																				</ul>
																			</div>
																		</div>
																	</div>
																	<!-- 버튼 영역 -->
																	<div class="css-hf0z5i">
																		<div class="css-3xwyuq">
																			<!-- 삭제 버튼 -->
																			<button class="css-gstqsr" onClick="location.href='deleteWishList.do?wishId=<%=wishLists.get(i).getWishId()%>'">
																				<span class="css-z3vg5b"> <span>삭제</span></span>
																			</button>
																			<div class="css-n07k1x">
																				<div>
																					<!-- 장바구니에 담기 버튼 -->
																					<button class="css-gstqsr" onclick="location.href='wishToCart.do?gameId=<%=gameDetailList.get(i).getGameId()%>'">
																						<span class="css-z3vg5b">장바구니 추가</span>
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
									<%
										}
									}
									%>
									</div>
								</div>
							</div>
							<%
								} else if (emptyCartChk == true) {
							%>
							<!-- 위시리스트가  비었을 때 출력할 화면 -->
							<div class="css-map4tx">
								<div class="css-11fvpc2">
									<div class="css-zigog8">
										<div class="css-g46w8s" data-testid="icon">
											<span class="css-cvmfyy" aria-hidden="true" data-testid="icon" data-component="Icon"><svg xmlns="http://www.w3.org/2000/svg" class="svg css-w1atjl" viewBox="0 0 45 52">
													<g fill="none" fill-rule="evenodd">
													<path d="M4.058 0C1.094 0 0 1.098 0 4.075v35.922c0 .338.013.65.043.94.068.65-.043 1.934 2.285 2.96 1.553.683 7.62 3.208 18.203 7.573 1.024.428 1.313.529 2.081.529.685.013 1.137-.099 2.072-.53 10.59-4.227 16.66-6.752 18.213-7.573 2.327-1.23 2.097-3.561 2.097-3.899V4.075C44.994 1.098 44.13 0 41.166 0H4.058z" fill="#0078F2"></path>
													<path stroke="#FFF" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" d="M14 18l4.91 2.545-2.455 4M25.544 28.705c-1.056-.131-1.806-.14-2.25-.025-.444.115-1.209.514-2.294 1.197M29.09 21.727L25 19.5l2.045-3.5"></path></g></svg></span>
										</div>
										<div class="css-cn3xcj">
											<span class="css-mywzwd" data-component="Text"> <span>위시리스트가 비어 있습니다.</span></span>
										</div>
										<div>
											<span class="css-z3vg5b"> <a class="css-8dq9ld" role="link" href="/Game.do"> <span>게임 및 앱 구매하기</span></a></span>
										</div>
									</div>
								</div>
							</div>
							<%
								}
							%>
						
					</div>
					</section>
				</div>
			</div>
		</div>
	</div>
	</div>
	<%
		if (msg.equals("위시삭제성공")) {
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
		} else if (msg.equals("위시리스트게임을 장바구니 담기 성공")) {
	%>
	<script>
				alert('위시리스트 게임을 장바구니에 담았습니다');
			</script>
	<%
		} else if (msg.equals("위시리스트게임을 장바구니 담기 실패")) {
	%>
	<script>
				alert('위시리스트 게임이 이미 장바구니에 있습니다');
			</script>
	<%
		}
	%>
</body>
</html>