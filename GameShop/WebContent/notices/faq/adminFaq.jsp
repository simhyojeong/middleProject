<%@page import="java.util.List"%>
<%@page import="faq.vo.FaqVO"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<%
	List<FaqVO> faqList = (List<FaqVO>) request.getAttribute("faqList");

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="../css/adminfaq.css" rel="stylesheet">
<title>자주 묻는 질문</title>


<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

</head>
<body>

	<header id="header-container-fluid">
		<jsp:include page="../../main/header.jsp" />
	</header>
	<div class="main">
		<div class="column side"></div>
		<div class="column middle">

			<h3 style="color: #ddd; font-weight: bold; font-size: 30px;">자주
				묻는 질문</h3>
			

				<%
					int faqSize = faqList.size();
				if (faqSize > 0) {
					for (int i = 0; i < faqSize; i++) {
				%>


				<!-- 				<div class="faq_main"> -->
				<%-- 					<textarea class="form-control"><%=faqList.get(i).getFaqTitle()%></textarea> --%>
				<!-- 					<br> -->
				<%-- 					<textarea class="form-control"><%=faqList.get(i).getFaqCont()%></textarea> --%>
				<!-- 				</div> -->

		<form action="./AdminFaq.do" method="post">
				<input type="hidden" name="faqId" value="<%=faqList.get(i).getFaqId()%>">
				
				<div class="form-group" style="margin-bottom: 5px;">
					<label for="title" style="color: #ddd; font-size: 14px;">제목</label>
					<textarea name="faqTitle" class="form-control" rows="1" id=title 
						style="background-color: #121212; color: #ddd; resize: none; "><%=faqList.get(i).getFaqTitle()%></textarea>
						
						
					<label for="comment" style="color: #ddd; font-size: 14px; padding-top: 10px;">내용</label>
					
					<!--<textarea class="form-control" rows="3" id="comment" -->
					<%--style="background-color: #121212; color: #ddd; resize: vertical;; overflow: hidden;"><%=faqList.get(i).getFaqCont()%></textarea> --%>

					<textarea name="faqCont" class="form-control" id="newTweetContent" rows="3" placeholder="내용을 입력하세요."
						onkeydown="resize(this)" onkeyup="resize(this)"
						style=" background-color: #121212; color: #ddd;min-height: 5rem; overflow-y: hidden; resize: none; "><%=faqList.get(i).getFaqCont()%></textarea>
				</div>

				<div class="btn_modify" style="display: flex; justify-content: right;">
					<button type="submit" class="btn btn-link" style="padding-right:0px; text-decoration: none; color:#d32f2f;">MODIFY</button>	
				</div>
			</form>

				<%
					}
				} else {
				%>
				<p>자주 묻는 질문 내역이 존재하지 않습니다.</p>
				<%
					}
				%>
		</div>
		<div class="column side"></div>
	</div>
	

	<script>
		function resize(obj) {
			obj.style.height = 'auto';
			obj.style.height = (12 + obj.scrollHeight) + 'px';
		}
	</script>
</body>
</html>