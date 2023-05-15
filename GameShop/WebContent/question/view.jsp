<%@page import="questions.answer.vo.AnswerVO"%>
<%@page import="members.member.vo.MemberVO"%>
<%@page import="questions.question.vo.QuestionVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	QuestionVO qv = (QuestionVO)request.getAttribute("qv");
	AnswerVO ansv = (AnswerVO)request.getAttribute("ansv");
	MemberVO loginMember = (MemberVO) session.getAttribute("loginMember");
%>
<!DOCTYPE html>
<html lang="ko">
<head>
<title>Q&A</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<link href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" rel="stylesheet">
<!--   <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script> -->
  
  <link rel="stylesheet" href="../css/summernote/summernote-lite.css">
<style>
#qnaVContainer { /* 전체범위 크기,색*/
	padding-left: 15%;
	padding-right: 15%;
	background-color: rgb(12, 12, 12);
}
h1,hr {
	color: #ffffff;
}
#viewBody { /* 상세보기 바디 색     !!!썸머노트 뜨는곳이 검게 들어가서 글씨가 안보임*/
	background-color: rgb(12, 12, 12);
}
#writersetting {  /* 작성자랑 날짜 같이띄우기 */
	display: inline-block;
	width: 40%;
}
#datesetting {  /* 작성자랑 날짜 같이띄우기 */
	display: inline-block;
	width: 40%;
	padding-left: 10%;
}
.form-label { /* 제목,작성자,작성일,내용 글자색 */
	color: #ffffff;
}
#title.form-control, #writer.form-control, #date.form-control,#content.form-control { /*  제목,작성자,작성일 답변,답변일 값 배경,글자색 */
	background-color: #202020;
	color: #ffffff;
	border: none;
}
</style>
</head>
<body id="qnaVContainer" class="sb-nav-fixed">
<header id="header-container-fluid">
		<jsp:include page="../main/header.jsp" />
	</header>
 <script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<script src="../js/summernote/summernote-lite.js"></script>
  <script src="../js/summernote/summernote-ko-KR.js"></script>
	<main class="mt-5 pt-5">
	<div class="container-fluid px-4">
		<h1 class="mt-4">상세보기</h1>
		<div id="viewBody" class="card mb-4">
			<div class="card-body">
				<form>
<!-- 					<div class="mb-3 mt-3"> -->
<!-- 						<label for="num" class="form-label">글번호</label>  -->
<%-- 						<input type="text" class="form-control" id="num" name="num" value="<%=qv.getQesId() %>" hidden> --%>
<!-- 					</div> -->
					<div class="mb-3">
					<%
					if(qv.getQesTitle().contains("[신고]")){
						%>
						<label for="title" class="form-label">제목</label> <input
								type="text" class="form-control" id="title" name="qesTitle" style="color:red;"
								value="<%=qv.getQesTitle() %>" disabled>
						</div><hr>
					<%
					}else{
					%>
					
						<label for="title" class="form-label">제목</label> <input
							type="text" class="form-control" id="title" name="qesTitle"
							value="<%=qv.getQesTitle() %>" disabled>
					</div><hr>
					<%
					}
					%>
					<div id="writersetting" class="mb-3">
						<label for="writer" class="form-label">작성자</label> 
						<input type="text" class="form-control" id="writer" name="qesWriter"
							value="<%=qv.getMemName() %>" disabled>
					</div>
					<div id="datesetting" class="mb-3">
						<label for="regDate" class="form-label">작성일</label> 
						<input type="text" class="form-control" id="date" name="qesDate"
							value="<%=qv.getQesDate() %>" disabled>
					</div>
					<div class="mb-3"><hr>
						<label for="content" class="form-label">내용</label>
						<textarea id="summernote" class="form-control" id="content" name="qesCont" disabled>
						<%=qv.getQesCont() %></textarea>
					</div>
					<a href="/question/list.do" class="btn btn-outline-secondary" style="color: #ffffff">목록</a>
				<%
					if(loginMember.getMemId().equals(qv.getMemId())){
				%>
					<a href="/question/update.do?qesId=<%=qv.getQesId() %>" class="btn btn-outline-warning">수정</a>
					<a href="/question/delete.do?qesId=<%=qv.getQesId() %>" class="btn btn-outline-danger"
						onclick="return confirm('삭제하시겠습니까?')">삭제</a>
				<%	
					}else{
						
					}
				%>
				</form>
			</div>
		</div>
		<%
		if(qv.getQesId().equals(ansv.getQesId())){
		%>
		<div id="viewBody" class="card mb-4">
			<div class="card-body">
				<form>
				<div class="mb-3"><hr>
						<label for="answer" class="form-label">답변</label>
						<textarea class="form-control" id="content" name="ansCont"
							disabled><%=ansv.getAnsCont() %></textarea>
					</div><hr>
				<div class="mb-3">
						<label for="regDate" class="form-label">작성일</label> 
						<input type="text" class="form-control" id="date" name="ansDate"
							value="<%=ansv.getAnsDate() %>" disabled>
					</div>
				</form>
			</div>
		</div>
		<%}
		%>
	</div>
	</main>
	<script>
        $('#summernote').summernote({
            tabsize: 2,
            height: 300
          });
  </script>
</body>
</html>